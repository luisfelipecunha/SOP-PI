#!/bin/bash
#######################################################################
#run-ramspeed-PI-4.sh                                                 #
#                                                                     #
#######################################################################

#Executa o RAMSpeed/SMP 30 vezes

cd ramspeed-smp-master/
for i in $(seq 1 30); do
  ./ramsmp -b 6 -g 2
done
