#!/bin/bash

mkdir -p data/bart-libs/
mkdir -p data/input/
mkdir -p data/output/

cd data/bart-libs/

if [ ! -f hg38_library.tar.gz ]; then
   wget https://virginia.box.com/shared/static/byufe8n6ft47hs4q7l6xxhyqnifjohm8.gz -O hg38_library.tar.gz
fi
if [ ! -d hg38_library ]; then
   tar xzvf hg38_library.tar.gz
fi

if [ ! -f mm10_library.tar.gz ]; then
   wget https://virginia.box.com/shared/static/bxli2cc6zfj7h1llt9vx9km9u0d4vwhc.gz -O mm10_library.tar.gz
fi
if [ ! -d mm10_library ]; then
   tar xzvf mm10_library.tar.gz
fi 

cd ../..
cd bin/

if [ ! -f bart_v2.0.tar.gz ]; then
   wget https://virginia.box.com/shared/static/031noe820hk888qzcxvw1cazol1gdhi0.gz -O bart_v2.0.tar.gz
fi 
if [ ! -d bart_v2.0 ]; then
   tar xzvf bart_v2.0.tar.gz
fi 

sed -s "s#/path/to/data/#/data/bart-libs/#g" bart_v2.0/bart2/bart.conf
cd ..


