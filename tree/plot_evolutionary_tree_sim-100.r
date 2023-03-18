library("ggplot2")
args <- commandArgs(trailingOnly=TRUE)
idelen <- 8000
setwd("D:/大三/b10K/Rscript/result0")
file="PIC-002"
data <- read.csv(paste(file,"csv",sep='.'),header=FALSE)

#data[,7]=0
#data <- data[which(data[,4]>idelen),]
#plate <- c("#FFFF00FF","#87CEFA","#1E90FF","#0000CD","#000000")
#for (i in 1:length(data[,6])){
#  data[i,7] = plate[5-data[i,6]]
#}
#idedf <- data.frame(pos=data[,2]+50000,ide=data[,5],len=data[,4],color=data[,7])
#pdf(paste(file,"pdf",sep='.'),width=4,height=7)
#ggplot(idedf,aes(x=pos,y=ide,color=color)) + geom_point(shape=21,stroke=1,aes(size=len)) + geom_smooth(se=F,span=0.2,method='loess',col="#99d594")    + scale_y_continuous(name="ZW identity") + theme(axis.title.x=element_blank(),axis.ticks.x=element_blank(),legend.position="top",panel.border = element_blank(), panel.grid.major = element_blank(),panel.grid.minor = element_blank())
#dev.off()

idedf <- data.frame(pos=data[,2]+50000,ide=data[,5],len=data[,4])

pdf(paste(file,"pdf",sep='.'),width=4,height=7)

ggplot(idedf,aes(x=pos,y=ide)) + geom_point(shape=21,stroke=1,aes(size=len)) + geom_smooth(se=F,span=0.2,method='loess',col="#99d594")    + scale_y_continuous(name="ZW identity") + theme(axis.title.x=element_blank(),axis.ticks.x=element_blank(),legend.position="top",panel.border = element_blank(), panel.grid.major = element_blank(),panel.grid.minor = element_blank())

dev.off()













