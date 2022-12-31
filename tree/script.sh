-----set_w_genelist------
cat genelist_est |while read i; do grep -w "$i" list1125_name_unified.csv |cut -d, -f1,2,3,4 > list.info/$i.w.txt; done
-----grep_w_for_blast----
cat b10kid |while read i; do cat ../genelist3 |while read j; do grep "$i" $j.info|cut -d, -f4 > tmp; cat tmp|while read k;do /share/app/seqkit/0.14.0-dev/seqkit grep -p "$k" ../../../source/gene_annotation/Wcds/$i.w.cds >> b10k/$i.w.fa;done;done;done
----mkdb_v4-----
/share/app/ncbi-blast-2.2.31+/bin/makeblastdb -in /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/Zcds/ACC-002.z.cds -parse_seqids -dbtype nucl -out /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/base/ACC-002.zcds
-----blast------
/share/app/ncbi-blast-2.2.31+/bin/blastn -db /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/base/APP-038.zcds -query /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/tree/list.info/b10k/APP-038.w.fa -evalue 0.00001 -word_size 8 -out /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/tree/blast_z/APP-038.tmp -outfmt "6 delim=, qseqid sseqid pident length qcovs qstart qend sstart send evalue bitscore"
------Wfz-------
cat genelist3 |while read i; do cat list.info/$i.info|while read j; do bid=`echo $j|cut -d, -f1`; gid=`echo $j|cut -d, -f4`; zid=`grep "$gid" blast_z/$bid.tmp|sort -k 5nr -k 3nr|head -n 1|cut -f2`; echo "$j,$zid" >> list.info/$i.z.txt; done; done
------rename------
cat genelist_est |while read i; do cat $i.info|while read j; do bid=`echo $j|cut -d, -f1`; od=`echo $j|cut -d, -f2`; n=`echo $j|cut -d, -f3|sed 's/ /_/g'`; wid=`echo $j|cut -d, -f4`; zid=`echo $j|cut -d, -f5`; /share/app/seqkit/0.14.0-dev/seqkit grep -p "$wid" ../../source/gene_annotation/Wcds/$bid.w.cds|sed "s/$wid/$od.$n.w.$wid/g" >> fasta/$i.s1.fa; /share/app/seqkit/0.14.0-dev/seqkit grep -p "$zid" ../../source/gene_annotation/Zcds/$bid.z.cds|sed "s/$zid/$od.$n.z.$zid/g" >> fasta/$i.s1.fa; done;done
-------mafft------
/share/app/mafft/7.471/bin/mafft --auto /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/tree/0113/fasta2/LHFPL2.s5.fa > /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/tree/results2/LHFPL2.s4.out
------trim-------
/hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/software/trimal-1.4.1/source/trimal  -gt 0.2 -in results3/VCP.out -out results3/VCP.phy
------iqtree-----
/ldfssz1/ST_DIVERSITY/PUB/USER/fangqi/local/bio-tool/iqtree-2.1.3/bin/iqtree2 -s /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/tree/results2/LHFPL2.phy -bb 1000 -o emu.Z -T AUTO
