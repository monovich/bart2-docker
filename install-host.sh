#!/bin/bash

mkdir -p data/bart-libs/
mkdir -p data/input/
mkdir -p data/output/

cd data/bart-libs/

echo "Downloading Human Data"
wget https://virginia.box.com/shared/static/byufe8n6ft47hs4q7l6xxhyqnifjohm8.gz -O hg38_library.tar.gz
tar xzvf hg38_library.tar.gz

echo "Downloading Human Data"
wget https://virginia.box.com/shared/static/bxli2cc6zfj7h1llt9vx9km9u0d4vwhc.gz -O mm10_library.tar.gz
tar xzvf mm10_library.tar.gz
