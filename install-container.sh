#!/bin/bash

wget https://virginia.box.com/shared/static/031noe820hk888qzcxvw1cazol1gdhi0.gz -O bart_v2.0.tar.gz
tar xzvf bart_v2.0.tar.gz
cp bart_v2.0/bart2/bart.conf > bart_v2.0/bart2/bart-copy.conf
sed -s "s#/path/to/data/#/data#g" bart_v2.0/bart2/bart.conf
python bart_v2.0/setup.py install

