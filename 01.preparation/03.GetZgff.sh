spe=$1
#03.get Zgff
cat /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/full_annotations/$spe/$spe.homolog.gff|grep -w -f /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/Zlist/$spe.z.list > /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/Zgff/$spe.z.gff
