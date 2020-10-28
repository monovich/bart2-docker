# bart2-docker
Run BARTv2.0 in a Docker Container

# Dependencies
Requires a prior installation of docker and bash. Only tested on Linux, but in theory should work on Windows/MacOS.

# Installation From Pre-Built Image
Fastest and simplest way to get started.

```
# 1) Download Repo
git clone https://github.com/monovich/bart2-docker.git
cd bart2-docker

# 2) Download Source Data
bash install-host.sh

# 3) Load From Image
docker load bart2.tar.gz

# 4) Run Image
docker run -ti -v ./data:/data bart2 /bin/bash

# 5) Run BART
# The docker image uses the data directory as a bridge between the container and host machine. Data needs to be placed inside the data directory on the host machine to be accessible to the container.

# example geneset input
bart2 geneset -i /data/input/genelist.txt -s hg38 --outdir /data/output/

# example profile input
bart2 profile -i /data/input/ChIP.bam -f bam -s hg38 --outdir /data/output/

# example region input
bart2 region -i /data/input/ChIPpeak.bed -c 4 -s hg38 --outdir /data/output/
```

# Installation From Manually Built Image
If you'd like to build the image from scratch (perhaps with your own modifications), I've included the necessary files.

```
# 1) Download Repo
git clone https://github.com/monovich/bart2-docker.git
cd bart2-docker

# 2) Download Source Data
bash install-host.sh

# 3) Build an Image
docker build -t bart2 .

# 4) Run Image
docker run -ti -v ./data:/data bart2 /bin/bash

# 5) Run BART
# The docker image uses the data directory as a bridge between the container and host machine. Data needs to be placed inside the data directory on the host machine to be accessible to the container.

# example geneset input
bart2 geneset -i /data/input/genelist.txt -s hg38 --outdir /data/output/

# example profile input
bart2 profile -i /data/input/ChIP.bam -f bam -s hg38 --outdir /data/output/

# example region input
bart2 region -i /data/input/ChIPpeak.bed -c 4 -s hg38 --outdir /data/output/
```
