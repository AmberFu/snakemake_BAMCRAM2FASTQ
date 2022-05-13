# snakemake_BAMCRAM2FASTQ
BAM or CRAM file to pair end FASTQ

> Docker Image: `snakemake/snakemake:stable`
> 
> Tools: samtools
> 
> INPUT file format: BAM or CRAM
> 
> OUTPUT file format: pair-end FASTQ

### Snakemake folder structure

* Best practice of sankemake project structure: https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html#distribution-and-reproducibility

```
├── .gitignore
├── README.md
├── LICENSE.md
├── workflow
│   ├── rules
|   │   ├── module1.smk
|   │   └── module2.smk
│   ├── envs
|   │   ├── tool1.yaml
|   │   └── tool2.yaml
│   ├── scripts
|   │   ├── script1.py
|   │   └── script2.R
│   ├── notebooks
|   │   ├── notebook1.py.ipynb
|   │   └── notebook2.r.ipynb
│   ├── report
|   │   ├── plot1.rst
|   │   └── plot2.rst
|   └── Snakefile
├── config
│   ├── config.yaml
│   └── some-sheet.tsv
├── results
└── resources

------------------------------------------------------

├── .gitignore
├── README.md
├── LICENSE.md
├── workflow
│   ├── rules
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
