BClo <- grep("24510",NEI$fips)
BCNEI <- NEI[BClo,]
YearIndex <- c(1999,2002,2005,2008)
P2table <- matrix(NA,ncol = 2,nrow = 4)
for(i in 1:4){
  lo <- which(BCNEI$year==YearIndex[i])
  Elo <- sum(BCNEI$Emissions[lo])
  P2table[i,1] <- Elo 
  P2table[i,2] <- YearIndex[i]
}
colnames(P2table) <- c("Emissions","year") 
P2table <- as.data.frame(P2table)
P2table$Emissions <- as.numeric(as.character(P2table$Emissions))

png("plot2.png",width = 480,height = 480,units = "px")
barplot(names.arg=P2table$year,P2table$Emissions/1000,xlab = "Year", ylab=expression('Aggregated Emission in Baltimore (tons/year)'))
dev.off()