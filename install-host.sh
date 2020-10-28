#!/bin/bash

mkdir -p data/bart-libs/
mkdir -p data/bart-core/
mkdir -p data/input/
mkdir -p data/output/

cd data/bart-libs/

echo "Downloading Human Data"
wget https://virginia.box.com/shared/static/byufe8n6ft47hs4q7l6xxhyqnifjohm8.gz -O hg38_library.tar.gz
tar xzvf hg38_library.tar.gz

echo "Downloading Mouse Data"
wget https://virginia.box.com/shared/static/bxli2cc6zfj7h1llt9vx9km9u0d4vwhc.gz -O mm10_library.tar.gz
tar xzvf mm10_library.tar.gz

cd ../..
cd bin/

echo "Downloading BARTv2.0"
wget https://virginia.box.com/shared/static/031noe820hk888qzcxvw1cazol1gdhi0.gz -O bart_v2.0.tar.gz
tar xzvf bart_v2.0.tar.gz
cd bart_v2.0
sed -s "s#/path/to/data/#/data/bart-libs/#g" bart_v2.0/bart2/bart.conf



