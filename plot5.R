Motorlo2 <- which(NEI$type=="ON-ROAD")
MotorNEI <- NEI[Motorlo2,]
MotorBC <- MotorNEI[(which(MotorNEI$fips==24510)),]

YearIndex <- c(1999,2002,2005,2008)
P5table <- matrix(NA,ncol = 2,nrow = 4)
for(i in 1:4){
  lo <- which(MotorBC$year==YearIndex[i])
  Elo <- sum(MotorBC$Emissions[lo])
  P5table[i,1] <- Elo 
  P5table[i,2] <- YearIndex[i]
}
colnames(P5table) <- c("Emissions","year") 
P5table <- as.data.frame(P5table)

png("plot5.png",width = 480,height = 480,units = "px")
barplot(names.arg=P5table$year,P5table$Emissions/1000,xlab = "Year", ylab=expression('Motor Vehicle-related Emission in Baltimore  (tons/year)'))
dev.off()