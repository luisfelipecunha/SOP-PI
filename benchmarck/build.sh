#!/bin/bash

cd linpack-Pi4-master/
cc -O -o linpack linpack.c -lm

cd ..
cd ramspeed-smp-master/
bash build.sh
