import os
import glob
import pandas as pd
from pathlib import Path

def file_extension(s: str) -> str:
    if s == ".bam":
        return "BAM"
    elif s == ".cram":
        return "CRAM"
    else:
        return "OTHERS"

### Get input BAM/CRAM full path as a list: (independent list)
BAMCRAM_FILESPATH = glob.glob(config["bam_cram_folder"]+"/*ams/PCGC*")
BAMCRAM_FILENAME = list(map(os.path.basename, BAMCRAM_FILESPATH))
BAMCRAM_STEMNAME = []
SAMPLE_BLIDID = []
BAM_CRAM = []
for f in BAMCRAM_FILENAME:
    filePathObject =  Path(f)
    f_stem = filePathObject.stem
    f_extension = filePathObject.suffix
    BAMCRAM_STEMNAME.append(f_stem)
    SAMPLE_BLIDID.append(f_stem.split("__")[1])
    BAM_CRAM.append(file_extension(f_extension))

### Tabular configuration
# https://snakemake.readthedocs.io/en/stable/snakefiles/configuration.html#tabular-configuration
info_dict = {'BAMCRAM_FILENAME': BAMCRAM_FILENAME, \
             'BAMCRAM_STEMNAME': BAMCRAM_STEMNAME, \
             'SAMPLE_BLIDID': SAMPLE_BLIDID, \
             'BAM_CRAM': BAM_CRAM}  
SAMPLES = pd.DataFrame(info_dict).set_index(["BAMCRAM_FILENAME"], drop=False).sort_index()
# SAMPLES = pd.DataFrame(info_dict).set_index(["BAMCRAM_FILENAME","BAMCRAM_STEMNAME","SAMPLE_BLIDID","BAM_CRAM"], drop=False).sort_index()
