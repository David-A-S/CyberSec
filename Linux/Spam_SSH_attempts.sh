#!/bin/bash
# A shell script to attempt to SSH into each IP 100 times..
for (( i = 1; i <= 100; i++ ))      ### Outer for loop ###
do

    for z in $(cat webvmips.txt) ### Inner for loop ###
    do
          ssh RedAdmin@$z
    done
done
