#Niko Airamo 11.11.2018
#Some random file.
library(dplyr)
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
#Someone got 0 points LOL
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

analysis<-c("Age","gender","Attitude","deep", "deep", "stra", "surf", "Points")
learn14 <- select(lrn14,one_of(analysis))


setwd("d:/koulujutut/opendata/iods-project/data/")
write.table(learn14,file="learn14.txt") 
test<-read.table("learn14.txt")



