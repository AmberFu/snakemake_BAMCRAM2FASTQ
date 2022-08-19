
rule bam2fastq:
    input:
        bam = config['bam_cram_folder']+"/bams/{filename}",
        bai = config['result_folder']+"/INDEX_BAM/{filename}.bai",
    output:
        r1 = temp(config['result_folder']+"/FASTQs_BAM/{filename}_r1.fastq"),
        r2 = temp(config['result_folder']+"/FASTQs_BAM/{filename}_r2.fastq"),
    log:
        config['logs_folder']+"/BAM2FQ_{filename}.log"
    conda:
        "../envs/samtools.yaml"
    threads: 
        config['bam2fastq']['threads']
    shell:
        "samtools fastq -@ {threads} -1 {output.r1} -2 {output.r2} {input.bam} >> {log} 2>&1"

rule gzipfastq_bam:
    input:
        r1 = config['result_folder']+"/FASTQs_BAM/{filename}_r1.fastq",
        r2 = config['result_folder']+"/FASTQs_BAM/{filename}_r2.fastq",
    output:
        r1gz = config['result_folder']+"/FASTQs_BAM/{filename}_r1.fastq.gz",
        r2gz = config['result_folder']+"/FASTQs_BAM/{filename}_r2.fastq.gz",
    log:
        config['logs_folder']+"/GZIPFQ_{filename}.log"
    shell:
        "gzip -c {input.r1} > {output.r1gz} 2>{log} && gzip -c {input.r2} > {output.r2gz} 2>>{log}"



rule cram2fastq:
    input:
        cram = config['bam_cram_folder']+"/crams/{filename}",
        crai = config['result_folder']+"/INDEX_CRAM/{filename}.crai",
    output:
        r1 = temp(config['result_folder']+"/FASTQs_CRAM/{filename}_r1.fastq"),
        r2 = temp(config['result_folder']+"/FASTQs_CRAM/{filename}_r2.fastq"),
    log:
        config['logs_folder']+"/CRAM2FQ_{filename}.log"
    conda:
        "../envs/samtools.yaml"
    threads: 
        config['bam2fastq']['threads']
    shell:
        "samtools fastq -@ {threads} -1 {output.r1} -2 {output.r2} {input.cram} >> {log} 2>&1"


rule gzipfastq_cram:
    input:
        r1 = config['result_folder']+"/FASTQs_CRAM/{filename}_r1.fastq",
        r2 = config['result_folder']+"/FASTQs_CRAM/{filename}_r2.fastq",
    output:
        r1gz = config['result_folder']+"/FASTQs_CRAM/{filename}_r1.fastq.gz",
        r2gz = config['result_folder']+"/FASTQs_CRAM/{filename}_r2.fastq.gz",
    log:
        config['logs_folder']+"/GZIPFQ_{filename}.log"
    shell:
        "gzip -c {input.r1} > {output.r1gz} 2>{log} && gzip -c {input.r2} > {output.r2gz} 2>>{log}"