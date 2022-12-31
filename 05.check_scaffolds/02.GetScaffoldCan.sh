list=$1
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/01.preparation/spelist/$list|while read i;
do
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/results/chickenZ/$i.spe.txt|cut -d, -f1|sort|uniq > /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/05.check_scaffolds/tmp;
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/results/zebrafinchZ/$i.spe.txt|cut -d, -f1|sort|uniq > /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/05.check_scaffolds/tmp2;
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/05.check_scaffolds/tmp|while read j;
do
echo "$i,$j" >> /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/05.check_scaffolds/chickenZ.hits;
done;
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/05.check_scaffolds/tmp2|while read j;
do
echo "$i,$j" >> /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/05.check_scaffolds/zebrafinchZ.hits;
done;
done
