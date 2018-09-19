NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

YearIndex <- c(1999,2002,2005,2008)
P1table <- matrix(NA,ncol = 2,nrow = 4)
for(i in 1:4){
  lo <- which(NEI$year==YearIndex[i])
  Elo <- sum(NEI$Emissions[lo])
  P1table[i,1] <- Elo 
  P1table[i,2] <- YearIndex[i]
}
colnames(P1table) <- c("Emissions","year") 
P1table <- as.data.frame(P1table)

png("plot1.png",width = 480,height = 480,units = "px")
barplot(names.arg=P1table$year,P1table$Emissions/1000,xlab = "Year", ylab=expression('Aggregated Emission (tons/year)'))
dev.off()