Coallo <- grep("[Cc]oal",as.character(SCC$Short.Name))
CoalIndex <-unique(SCC$SCC[Coallo])
Coallo2 <- NA
for(i in 1:length(CoalIndex)){
  Coallo2 <-  c(Coallo2 ,which(NEI$SCC==CoalIndex[i]))
}
Coallo2 <- as.numeric(Coallo2[-1])
CoalNEI <- NEI[Coallo2,]
YearIndex <- c(1999,2002,2005,2008)
P4table <- matrix(NA,ncol = 2,nrow = 4)
for(i in 1:4){
  lo <- which(CoalNEI$year==YearIndex[i])
  Elo <- sum(CoalNEI$Emissions[lo])
  P4table[i,1] <- Elo 
  P4table[i,2] <- YearIndex[i]
}
colnames(P4table) <- c("Emissions","year") 
P4table <- as.data.frame(P4table)

png("plot4.png",width = 480,height = 480,units = "px")
barplot(names.arg=P4table$year,P4table$Emissions/1000,xlab = "Year", ylab=expression('Coal Combustion-related Emission  (tons/year)'))
dev.off()