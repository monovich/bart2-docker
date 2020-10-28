#!/bin/bash
docker run --rm -ti -v "$PWD/data/":/home/BARTv2.0/data/ -v "$PWD/bin":/home/BARTv2.0/bin/ -w /home/BARTv2.0/ bart2:latest /bin/bash
