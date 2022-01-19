# Gandhar-GB-pipeline
prompt 1, and some work on prompt 2 (in 4 hours over 2 days)


to run the Snakefile, run $snakemake --cores 1

remember to create index files for the reference genome before if not created already: $bwa index {ref}.fasta

I have included a second Snakefile for an original dataset that I collected in lab- running the pipeline on this dataset, however, created an output file >20 GB and took a really long time to run. I would love to talk about this project nonetheless!

I have included a rule in the Snakefile for annotation of the VCF using SNPeff.

I used the sample.vcf provided in prompt 2 to work on some downstream data analysis, filtering, etc. using python and scikit-allel.

New skills learned: In the past, I have worked with pre-processed multiple sequence alignment files. This was a fantastic learning experience to build the VCFs needed for downstream analysis. Also took this opportunity to learn about and work with Snakemake for the first time, and implemented the pipeline successfully. Thank you!
