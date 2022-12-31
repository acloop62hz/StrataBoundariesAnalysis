#blast to 3 reference species
spe=$1
/ldfssz1/ST_DIVERSITY/PUB/USER/fangqi/PUB/local/basic_bio-tool/ncbi-blast-2.11.0/bin/blastn -db /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/base/chicken_cds -query /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/Wcds/$spe.w.cds -evalue 0.00001 -word_size 8 -out /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/results/c825/$spe.spe.txt -outfmt "6 delim=, qseqid sseqid pident length qcovs evalue bitscore"
/ldfssz1/ST_DIVERSITY/PUB/USER/fangqi/PUB/local/basic_bio-tool/ncbi-blast-2.11.0/bin/blastn -db /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/base/human_cds -query /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/Wcds/$spe.w.cds -evalue 0.00001 -word_size 8 -out /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/results/h825/$spe.spe.txt -outfmt "6 delim=, qseqid sseqid pident length qcovs evalue bitscore"
/ldfssz1/ST_DIVERSITY/PUB/USER/fangqi/PUB/local/basic_bio-tool/ncbi-blast-2.11.0/bin/blastn -db /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/base/zebrafinch_cds -query /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/source/gene_annotation/Wcds/$spe.w.cds -evalue 0.00001 -word_size 8 -out /hwfssz5/ST_EARTH/P18Z10200N0100/c-shenyuxuan/project/blast/results/z825/$spe.spe.txt -outfmt "6 delim=, qseqid sseqid pident length qcovs evalue bitscore"