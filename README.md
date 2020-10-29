# bart2-docker
Run BARTv2.0 (Binding Analysis for Regulation of Transcription) in a Docker Container

I made this for my own personal convenience and for deployment reproducibility. It is likely not
optimally packaged.

Credit:
https://github.com/zanglab/bart2

Docker Image:
https://hub.docker.com/r/monovich/bart2

# Dependencies
Requires a prior installation of git, docker, and bash. Only tested on Linux amd64, but in theory should work fine on Windows/MacOS.

# Installation From Pre-Built Image
Fastest and simplest way to get started.

```
# 1) Download Repo
git clone https://github.com/monovich/bart2-docker.git
cd bart2-docker

# 2) Download monovich/bart2:latest image
# The image is currently quite large ~1.2 Gb compressed. ~3 Gb uncompressed.
docker pull monovich/bart2

# 3) Download Source Data
# WARNING: The required data occupies 14 Gb of storage when uncompressed. Ensure you have 
# sufficient disk space on host.
bash init.sh

# 4) Run Image

# OPTION 1: Run with Script

# While in your bart2-docker dir run the following to add $BART to your .bashrc file
echo "export BART=$(pwd)" >> ~/.bashrc
echo "alias bart2=$BART/bin/sh/bart2-latest.sh" >> ~/.bashrc

# reload .bashrc or restart shell
. ~/.bashrc

# run image to open interactive shell
bart2

# OPTION 2: Custom Docker Container

# Alternatively you can run an interactive shell using the following command without setting a path.
# Replace /path/to/bart2-docker/ with the actual path.

docker run --rm -ti -v "/path/to/bart2-docker/data/":/home/BARTv2.0/data/ -v "/path/to/bart2-docker/bin":/home/BARTv2.0/bin/ -w /home/BARTv2.0/ bart2:latest /bin/bash

# 5) Test container output
# I'll assume you've opened an interactive shell in the container following OPTION 1. 
# Test container output with the following line:
bart2 geneset -i data/input/sample-genelist.txt -s mm10 --outdir data/output/

# This should generate 4 files in data/output for sample-genelist:

# sample-genelist_adaptive_lasso_Info.txt
# sample-genelist_auc.txt
# sample-genelist_bart_results.txt
# sample-genelist_enhancer_prediction_lasso.txt

# For future runs, provide unique file input names to avoid overwrites.

# 6) Run BART in Container
# The docker image uses the data directory as a bridge between the container 
# and host machine. Data needs to be placed inside the data directory on the 
# host machine to be accessible to the container.

# Due to git filesize limits, only a test genelist is provided, though BART
# also takes .bam and .bed input:

# example profile input
# bart2 profile -i data/input/ChIP.bam -f bam -s hg38 --outdir data/output/

# example region input
# bart2 region -i data/input/ChIPpeak.bed -c 4 -s hg38 --outdir data/output/
```

# Installation From Manually Built Image
If you'd like to build the image from scratch (perhaps with your own modifications), 
I've included the necessary files.

```
# 1) Download Repo
git clone https://github.com/monovich/bart2-docker.git
cd bart2-docker

# 2) Download Source Data
# WARNING: This is 14Gb of unpacked data. Ensure you have sufficient disk space.
bash init.sh

# 3) Build an Image
# Give your images tags for organization if you want to make iterative changes
docker build -t bart2:latest -t bart2:1.0 .

# 4) Run Image
# You may find it convenient to set the following command as a bash alias in your 
# .bashrc, .bash_aliases, or other similar file
bash bin/sh/bart2-latest.sh

# 5) Test container output
# example geneset input
bart2 geneset -i data/input/sample-genelist.txt -s mm10 --outdir data/output/
```
