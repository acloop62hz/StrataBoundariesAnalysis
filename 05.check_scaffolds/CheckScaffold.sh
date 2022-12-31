#cat bid_gid |while IFS=',' read -r b g
#do 
#s=`grep -w "$g" ../../../../source/gene_annotation/Wgff/$b.w.gff|cut -f1|head -n 1`
#echo "$b,$g,$s" >> bid_gid_scf
#done
cat bid_gid_orign|while IFS=',' read -r b g
do
s=`grep -w "$g" ../../../../source/gene_annotation/Wgff/$b.w.gff|cut -f1|head -n 1`
echo "$b,$g,$s" >> bid_gid_scf.orign
done
