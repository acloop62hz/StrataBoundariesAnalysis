spe=$1
#02.get Zcds
/ldfssz1/ST_DIVERSITY/PUB/USER/fangqi/local/bio-tool/cufflinks-2.2.1/gffread -g /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/xiaoman/data/01.genome/$spe.genomic.fa /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/Zgff/$spe.z.gff -x /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/Zcds/$spe.z.cds
