#!/bin/bash


cmdname="$1"

rm -rf PuzzleDir/

for  i in {0..99}

do
    #echo "begin:$i"
    output=$(./$cmdname $i > stdout.txt 2>stderr.txt )

    out1=$(grep -ic "waldo" < stdout.txt)

    out2=$(grep -ic "waldo" < stderr.txt)
    

    out3=$(grep -ir "waldo" PuzzleDir/ | wc -l)

    out4=$(grep -irl "waldo" PuzzleDir/ | wc -l)
    
    
    if [ "$out1" != "0" ] || [ "$out2" != "0"  ] || [ "$out3" != "0" ] || [ "$out4" != "0" ];then
	    echo "$cmdname $i $out1 $out2 $out3 $out4" 
    fi

    rm stdout.txt stderr.txt
    rm -rf PuzzleDir/
done


rm -rf PuzzleDir/
