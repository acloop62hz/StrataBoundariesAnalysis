table=$1
out=$2


#gather info for merge
#grep genes that has hits with qcovs>=40 from 01.gene_table, merge all results to blastgn for next step filter.
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/01.preparation/pre_gene_table/$table |while IFS=',' read -r bid gid
do

#get blast results from chicken
c=`grep -w "$gid" /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/results/c825/$bid.spe.txt|awk -F, '{if($5>=40) print $0}'|head -n 1`
if [ "$c" ]; then 
cqcov=`echo $c|cut -d, -f5`
ct=`echo $c|cut -d, -f2`
cgn=`grep -w "$ct" /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/genome/chicken_cds.fa|cut -d' ' -f2|sed 's/\[//g'|sed 's/\]//g'|cut -d= -f2`
else
cqcov=0
cgn=""
fi

#get blast results from zebrafinch
z=`grep -w "$gid" /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/results/z825/$bid.spe.txt|awk -F, '{if($5>=40) print $0}'|head -n 1`
if [ "$z" ]; then
zqcov=`echo $z|cut -d, -f5`
zt=`echo $z|cut -d, -f2`
zgn=`grep -w "$zt" /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/genome/zebrafinch_cds.fa|cut -d' ' -f2|sed 's/\[//g'|sed 's/\]//g'|cut -d= -f2`
else
zqcov=0
zgn=""
fi

#get blast results from human
h=`grep -w "$gid" /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/results/h825/$bid.spe.txt|awk -F, '{if($5>=40) print $0}'|head -n 1`
if [ "$h" ]; then 
hqcov=`echo $h|cut -d, -f5`
ht=`echo $h|cut -d, -f2`
hgn=`grep -w "$ht" /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/genome/human_cds.fa|cut -d' ' -f2|sed 's/\[//g'|sed 's/\]//g'|cut -d= -f2`
else 
hqcov=0
hgn=""
fi

echo "$bid,$gid,$zqcov,$zgn,$cqcov,$cgn,$hqcov,$hgn" >> /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/02.filter1/blast_results/$out
done
