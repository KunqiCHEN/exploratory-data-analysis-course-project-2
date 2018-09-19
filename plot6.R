MotorLA <- NEI[NEI$fips=="06037" & NEI$type=="ON-ROAD",  ]
YearIndex <- c(1999,2002,2005,2008)
P6table <- matrix(NA,ncol = 2,nrow = 4)
for(i in 1:4){
  lo <- which(MotorLA$year==YearIndex[i])
  Elo <- sum(MotorLA$Emissions[lo])
  P6table[i,1] <- Elo 
  P6table[i,2] <- YearIndex[i]
}
colnames(P5table) <- c("Emissions","year") 
P5table <- as.data.frame(P5table)
colnames(P6table) <- c("Emissions","year") 
P6table <- as.data.frame(P6table)

P6table$city <- rep("Los Angeles County",nrow(P6table))
P5table$city <- rep("Baltimore City",nrow(P5table))

P6table <- rbind(P5table,P6table)
P6table$Emissions <- as.numeric(as.character(P6table$Emissions))
P6table$year <- as.character(P6table$year)
# png("plot5.png",width = 480,height = 480,units = "px")
# barplot(names.arg=P6table$year,P6table$Emissions/1000,xlab = "Year", ylab=expression('MotorLA Vehicle-related Emission in Baltimore  (tons/year)'))
# dev.off()
library(ggplot2)

png("plot6.png",width = 480,height = 480,units = "px")
ggplot(P6table,aes(y=Emissions,x=year))+geom_bar(stat="identity")+facet_wrap(~city)
dev.off()