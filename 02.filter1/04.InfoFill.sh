input=$1
supplement=$2

#delete non-hits
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/02.filter1/merge.result/$input|awk -F, '{if($3!="") print $0}' > /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/02.filter1/merge.result/$input.clean
#fill up other information including order,latin name,EnsemblID
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/02.filter1/merge.result/$input.clean|while IFS=',' read -r bid gid gn
do
order=`grep -w $bid $2|cut -d, -f2`
ln=`grep -w $bid $2|cut -d, -f3`
ENS=`grep -w "$gid" /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/Wgff/$bid.w.gff|grep -w "mRNA" |awk '{print $9 }'|awk -F ';' '{print $2}'|awk -F '=' '{print $2}'`
ENSs=`echo $ENS|cut -d- -f1`
echo "$bid,$order,$ln,$gid,$ENS,$gn,$ENSs" >> /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/fulfill/02.filter1/merge.result/$input.full
done
