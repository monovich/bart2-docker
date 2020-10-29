#!/bin/bash
docker run --rm -ti -v "$BART/data/":/home/BARTv2.0/data/ -v "$BART/bin/":/home/BARTv2.0/bin/ -w /home/BARTv2.0/ monovich/bart2:latest /bin/bash
