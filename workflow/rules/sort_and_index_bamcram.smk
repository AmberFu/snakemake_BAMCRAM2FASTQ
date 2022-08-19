
# https://www.htslib.org/doc/samtools-index.html
rule samtools_index_cram:
    input:
        config['bam_cram_folder']+"/crams/{filename}",
    output:
        temp(config['result_folder']+"/INDEX_CRAM/{filename}.crai"),
    log:
        config['logs_folder']+"/INDEX_CRAM_{filename}.log"
    threads: 
        config['samtools_index']['threads']
    conda:
        "../envs/samtools.yaml"
    shell:
        "samtools index -@ {threads} {input} {output}"
        

rule samtools_index_bam:
    input:
        config['bam_cram_folder']+"/bams/{filename}",
    output:
        temp(config['result_folder']+"/INDEX_BAM/{filename}.bai"),
    log:
        config['logs_folder']+"/INDEX_BAM_{filename}.log"
    threads: 
        config['samtools_index']['threads']
    conda:
        "../envs/samtools.yaml"
    shell:
        "samtools index -@ {threads} {input} {output}"
        

