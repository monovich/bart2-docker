# bart2-docker
Run BARTv2.0 in a Docker Container

Credit:
https://github.com/zanglab/bart2

# Dependencies
Requires a prior installation of docker and bash. Only tested on Linux, but in theory should work on Windows/MacOS.

# Installation From Pre-Built Image
Fastest and simplest way to get started.

```
# 1) Download Repo
git clone https://github.com/monovich/bart2-docker.git
cd bart2-docker

# 2) Download Source Data
# WARNING: This is 14Gb of unpacked data. Ensure you have sufficient disk space.
bash init.sh

# 3) Load From Image
# Version number will vary
docker load < bart2-1.0.tar.gz

# 4) Run Image
# You may find it convenient to set the following command as a bash alias in your 
# .bashrc, .bash_aliases, or other similar file
bash bin/sh/bart2-latest.sh

# 5) Run BART in Container
# The docker image uses the data directory as a bridge between the container 
# and host machine. Data needs to be placed inside the data directory on the 
# host machine to be accessible to the container.

# example geneset input
bart2 geneset -i data/input/sample-genelist.txt -s mm10 --outdir data/output/

# example profile input
bart2 profile -i data/input/ChIP.bam -f bam -s hg38 --outdir data/output/

# example region input
bart2 region -i data/input/ChIPpeak.bed -c 4 -s hg38 --outdir data/output/
```

# Installation From Manually Built Image
If you'd like to build the image from scratch (perhaps with your own modifications), I've included the necessary files.

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

# 5) Run BART
# The docker image uses the data directory as a bridge between the container 
# and host machine. Data needs to be placed inside the data directory on the 
# host machine to be accessible to the container.

# example geneset input
bart2 geneset -i data/input/sample-genelist.txt -s mm10 --outdir data/output/

# example profile input
bart2 profile -i data/input/ChIP.bam -f bam -s hg38 --outdir data/output/

# example region input
bart2 region -i data/input/ChIPpeak.bed -c 4 -s hg38 --outdir data/output/

# 6) (OPTIONAL) Save Image For Distribution
docker save bart2:1.0 | gzip > bart2-1.0.tar.gz
```
