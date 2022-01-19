# Ginkgo Bioworks Coding Challenge
# by Gandhar Mahadeshwar
# January 19, 2022

#note: run bwa index {ref}.fasta in shell before running bwa_map

#default rule
rule all:
    input:
        "plots/quals.svg"

#snakemake rule
rule bwa_map:
    #directives
    input:
        "data/ref.fasta", #reference
        "data/samples/R1.fq", #paired read 1
        "data/samples/R2.fq" #paired read 2
    output:
        "mapped_reads/sample_paired.sam"
    shell:
        "bwa mem {input} > {output}"

rule sam_to_bam:
    input:
        "mapped_reads/sample_paired.sam"
    output:
        "mapped_reads/sample_paired.bam"
    shell:
        "samtools view -bo {output} {input}"


rule samtools_sort:
    input:
        "mapped_reads/sample_paired.bam"
    output:
        "sorted_reads/sample_sorted.bam"
    shell:
        "samtools sort -T sorted_reads/sample_sorted.bam "
        "-O bam {input} > {output}"

rule freebayes:
    input:
        "data/ref.fasta",
        "sorted_reads/sample_sorted.bam"
    output:
        "output_vcf/var.vcf"
    shell:
        "freebayes -f {input} > {output}"

# rule qc:
#     input:
#         "output_vcf/var.vcf"
#     output:
#         ""
#     shell:
#         ""

rule annotation:
    input:
        "output_vcf/var.vcf"
    output:
        "output_vcf_ann/var_ann.vcf"
    shell:
        "java -jar snpEff.jar GRCh37.75 {input} > {output}"

rule plot_quals:
    input:
        "output_vcf/var.vcf"
    output:
        "plots/quals.svg"
    script:
        "scripts/plot-quals.py"
