BClo <- grep("24510",NEI$fips)
BCNEI <- NEI[BClo,]
typeBC <- unique(BCNEI$type)
P3table <- matrix(NA,ncol = 3,nrow = 16)
for(i in 1:4){
  for(j in 1:4){
    lotype <- which(BCNEI$type==typeBC[i])
    lo <- which(BCNEI$year==YearIndex[j])
    Elo <- sum(BCNEI$Emissions[intersect(lotype,lo)])
    P3table[((i-1)*4+j),1] <- Elo 
    P3table[((i-1)*4+j),2] <- YearIndex[j]
    P3table[((i-1)*4+j),3] <- typeBC[i]
  }
}
colnames(P3table) <- c("Emissions","year","type") 
P3table <- as.data.frame(P3table)
P3table$Emissions <- as.numeric(as.character(P3table$Emissions))

library(ggplot2)

png("plot3.png",width = 480,height = 480,units = "px")
ggplot(P3table,aes(y=Emissions,x=year))+geom_bar(stat="identity")+facet_wrap(~type)
dev.off()