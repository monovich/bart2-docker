#!/bin/bash
docker run --rm -ti -v "$BART/data":/home/BARTv2.0/data/ -v "$BART/bin":/home/BARTv2.0/bin/ -w /home/BARTv2.0/ bart2:1.0 /bin/bash
