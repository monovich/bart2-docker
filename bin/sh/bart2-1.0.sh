#!/bin/bash
<<<<<<< HEAD
docker run --rm -ti -v "$BART/data":/home/BARTv2.0/data/ -v "$BART/bin":/home/BARTv2.0/bin/ -w /home/BARTv2.0/ bart2:1.0 /bin/bash
=======
repo=$(head -n 1 ./path.txt)
docker run --rm -ti -v "$repo/data":/home/BARTv2.0/data/ -v "$repo/bin":/home/BARTv2.0/bin/ -w /home/BARTv2.0/ monovich/bart2:1.0 /bin/bash
>>>>>>> 002fe8947a70764ed4cd6691db86a70daf453c6e
