#!/bin/bash

state=('Quasi-Crystals' 'Non-Newtonian_Fluids' 'Strange_Matter' 'Superfluids' 'Time_Crystals')
numbers=$(echo {0..9})
ls_out=$(ls)
files=$(find /home -type f -perm 777 2> /dev/null)

for file in ${files[@]}
do
   echo $file
done

for x in ${ls_out[@]}
do
   echo $x
done

for best in ${state[@]}
do
   if [ $best == 'Strange_Matter' ];
   then
      echo "Strange_Matter is the best state!"
   else
      echo "$best are a cool state!"
   fi
done

for num in ${numbers[@]}
do
   if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ];
   then
      echo $num
   fi
done
