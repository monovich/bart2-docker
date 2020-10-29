#!/bin/bash
repo=$(head -n 1 ./path.txt)
docker run --rm -ti -v "$repo/data/":/home/BARTv2.0/data/ -v "$repo/bin":/home/BARTv2.0/bin/ -w /home/BARTv2.0/ monovich/bart2:latest /bin/bash
