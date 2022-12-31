spe=$1
#01.get Wgff
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/full_annotations/$spe/$spe.homolog.gff|grep -w -f /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/Wlist/$spe.w.list > /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/Wgff/$spe.w.gff
