# Create Line Chart

# convert factor to numeric for convenience 
saturation$Genotype <- as.numeric(saturation$Genotype) 
saturation$Reads <- as.numeric(saturation$Reads)
saturation$Genes <- as.numeric(saturation$Genes)
ntrees <- max(saturation$Genotype)

# get the range for the x and y axis 
xrange <- range(saturation$Reads) 
yrange <- range(saturation$Genes) 

# set up the plot 
plot(xrange, c(12000, 22000), type="n", xlab="Million Reads", ylab="Expressed Genes" ) 
colors <- rainbow(ntrees) 
linetype <- c(1:ntrees) 
plotchar <- seq(18,18+ntrees,1)

# add lines 
for (i in 1:ntrees) { 
  tree <- subset(saturation, Genotype==i) 
  lines(tree$Reads, tree$Genes, type="b", lwd=1.5,
        lty=linetype[i], col=colors[i], pch=plotchar[i]) 
} 

# add a title and subtitle 
title("Saturation Curve (stringent critera)", "(50bp, HiSeq)")

# add a legend 
legend(xrange[2]-3, yrange[1]+1900, 1:ntrees, cex=0.8, col=colors,
       pch=plotchar, lty=linetype, title="Gen/Tissue")