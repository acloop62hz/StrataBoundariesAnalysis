list=$1
#03.grep_all_genes
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/01.preparation/spelist/$list|while read i
do 
grep ">" /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/Wcds/$i.w.cds|sed 's/>//g' > /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/01.preparation/tmp
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/01.preparation/tmp|while read j
do
 echo "$i,$j" >> /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/01.preparation/pre_gene_table/$list.table
done
done
