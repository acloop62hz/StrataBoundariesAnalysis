table=$1
list=$2

#get length of all hits of each gene;notice that "done < tmp" is necessary
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/01.preparation/pre_gene_table/$table |while read i
do
bid=`echo $i|cut -d, -f1`; gid=`echo $i|cut -d, -f2`
grep "$gid" /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/Repeats/results/$bid/$bid.w.cds.out > /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/03.filter_TE/repeat_idf/tmp
sum=0
while read j
do
a=`echo $j|awk '{print $6}'`; b=`echo $j|awk '{print $7}'`
let sum=sum+b-a
done < /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/03.filter_TE/repeat_idf/tmp
echo "$bid,$gid,$sum" >> /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/03.filter_TE/repeat_idf/$list.repeat.check
done
#get length of each gene
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/01.preparation/spelist/$list|while read i
do 
/share/app/seqkit/0.14.0-dev/seqkit fx2tab --length --name /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/Wcds/$i.w.cds >> /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/03.filter_TE/repeat_idf/$list.lengthinfo
done
#from calculate qcovs
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/03.filter_TE/repeat_idf/$list.repeat.check |while read i
do 
bid=`echo $i|cut -d, -f1`; gid=`echo $i|cut -d, -f2`
l=`echo $i|cut -d, -f3`
al=`grep "$gid" /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/03.filter_TE/repeat_idf/$list.lengthinfo|cut -f2`
qc=`echo "scale=2;$l/$al" | bc`
echo "$bid,$gid,$qc" >> /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/03.filter_TE/repeat_idf/$list.qc.info
done
#filter
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/03.filter_TE/repeat_idf/$list.qc.info|awk -F, '{if($3>=0.5) print $2}' >> /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/03.filter_TE/repeat_idf/$list.repeatlist
