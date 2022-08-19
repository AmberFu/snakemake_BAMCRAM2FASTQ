# snakemake_BAMCRAM2FASTQ
BAM or CRAM file to pair end FASTQ

> Docker Image: `snakemake/snakemake:stable`
> 
> Tools: samtools
> 
> INPUT file format: BAM or CRAM
> 
> OUTPUT file format: pair-end FASTQ

```
(snakemake) fup@compute1-exec-120:/storage1/fs1/jin810/Active/PCGC_CHD_IncRNA_2022/snakemake_BAMCRAM2FASTQ$ snakemake -c12 --use-conda
Building DAG of jobs...
Creating conda environment https://github.com/snakemake/snakemake-wrappers/raw/v1.5.0/bio/samtools/index/environment.yaml...
Downloading and installing remote packages.
Environment for https://github.com/snakemake/snakemake-wrappers/raw/v1.5.0/bio/samtools/index/environment.yaml created (location: .snakemake/conda/b622fb00535ba937d02e0974a51b921c)
Using shell: /bin/bash
Provided cores: 12
Rules claiming more threads will be scaled down.
Job stats:
job               count    min threads    max threads
--------------  -------  -------------  -------------
all                   1              1              1
bam2fastq            57              2              2
samtools_index       57              2              2
samtools_sort        57              8              8
total               172              1              8

Select jobs to execute...

[Thu May 19 21:37:46 2022]
rule samtools_sort:
    input: /storage1/fs1/jin810/Active/PCGC_CHD_IncRNA_2022/PCGC_CHD_19Trios_WGS_2022May/pcgc_downloaded_CRAM/PCGC0092467_HS_WG__1-01174-01__v1_FCHN5GYCCXX_L1_p1of1_P1.bam
    output: /storage1/fs1/jin810/Active/PCGC_CHD_IncRNA_2022/snakemake_BAMCRAM2FASTQ/results/SORTED_INDEX_BAM/PCGC0092467_HS_WG__1-01174-01__v1_FCHN5GYCCXX_L1_p1of1_P1.bam.sorted.bam
    log: /storage1/fs1/jin810/Active/PCGC_CHD_IncRNA_2022/snakemake_BAMCRAM2FASTQ/logs/SORTED_BAM_PCGC0092467_HS_WG__1-01174-01__v1_FCHN5GYCCXX_L1_p1of1_P1.bam.log
    jobid: 14
    wildcards: filename=PCGC0092467_HS_WG__1-01174-01__v1_FCHN5GYCCXX_L1_p1of1_P1.bam
    threads: 8
    resources: tmpdir=/tmp/328441.tmpdir

Activating conda environment: .snakemake/conda/0e95451dfc32012ad73a94697479472c
Activating conda environment: .snakemake/conda/0e95451dfc32012ad73a94697479472c
...


```

```
bsub -Is -G compute-jin810 -q general-interactive -n 12 -M 12GB -R 'select[mem>12GB] span[hosts=1] rusage[mem=12GB]' -a 'docker(snakemake/snakemake:stable)' /bin/bash
```

### Snakemake folder structure

* Best practice of sankemake project structure: https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html#distribution-and-reproducibility

```
├── .gitignore
├── README.md
├── LICENSE.md
├── workflow
│   ├── rules
|   │   ├── common.smk
|   │   ├── bam_cram_header.smk
|   │   └── bamcram2fastq.smk
│   ├── envs
│   ├── scripts
|   │   ├── script1.py
|   │   └── script2.R
│   ├── notebooks
│   ├── report
|   │   ├── plot1.rst
|   │   └── plot2.rst
|   └── Snakefile (Main file)
├── config
│   ├── config.yaml
│   └── some-sheet.tsv
├── results
└── resources
                                 


```

### Sankemake Steps Outline:

1. Provide a Folder path, and use `glob` to get ALL BAM/CRAM file path
2. Create Header files for each BAM/CRAM
3. Procressing BAM/CRAM Header file to get Reference version
4. BAM2FASTQ and CRAM2FASTQ
