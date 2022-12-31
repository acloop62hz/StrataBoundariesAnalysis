input=$1
out=$2

#from blastgn,find the best gene name from blast results from 3 reference species. "LOC" genes are abandoned.
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/02.filter1/blast_results/$input |while IFS=',' read -r bid gid zq zn cq cn hq hn 
do 
loc="LOC"

if [[ $zn == *$loc* ]] || [ "$zn" == "" ]; then
zq=0
fi

if [[ $cn == *$loc* ]] || [ "$cn" == "" ]; then
cq=0
fi

if [[ $hn == *$loc* ]] || [ "$hn" == "" ]; then
hq=0
fi

GN=""
if [ "$zq" ] && [ `echo "$zq >= $hq"|bc` -eq 1 ] && [ `echo "$zq >= $cq"|bc` -eq 1 ] ; then 
GN=`echo $zn`
fi

if [ "$cq" ] && [ `echo "$cq >= $hq"|bc` -eq 1 ] && [ `echo "$cq >= $zq"|bc` -eq 1 ]; then 
GN=`echo $cn`
fi

if [ "$hq" ] && [ `echo "$hq >= $zq"|bc` -eq 1 ] && [ `echo "$hq >= $cq"|bc` -eq 1 ]; then 
GN=`echo $hn`
fi

echo "$bid,$gid,$GN" >> /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/02.filter1/merge.result/$out
done
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/02.filter1/merge.result/$out|awk -F, '{if($3!="") print $0}' > /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/02.filter1/merge.result/$out.clean
