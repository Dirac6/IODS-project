#Niko Airamo 11.11.2018
library(dplyr)
library(ggplot2)
students2014 <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/learning2014.txt", sep=",", header=TRUE)
students2014
#There's 7 variables and 166 observations. It tells aswerers gender,age, global attitude towards statistics, deep learning,
#strategic learning, surface learning and exam points.

p1<-ggplot(students2014, aes(y = stra,x=points))+ geom_point()
p2<-ggplot(students2014, aes(y = surf,x=points))+ geom_point()
p3<-ggplot(students2014, aes(y = deep,x=points))+ geom_point()
p4<-ggplot(students2014, aes(y = age,x=points))+ geom_point()
p5<-ggplot(students2014, aes(y = gender,x=points))+ geom_point()
p6<-ggplot(students2014, aes(y = attitude,x=points))+ geom_point()
p1
p2
p3
p4
p5
p6
#The clearest correlation is between attitude and exam points, otherwise the correlation is small or nonexistent.
?lm
fit <- lm(points ~ attitude + stra + age, data = students2014)
summary(fit)
#There's correlation between exam points and all of the above variables if we use 90% confidence interval. 

#Clearly good attitude attitude yields better exam results, strategic thinking is helpful in studying and young people 
#have access fresher brains.
#Everything is from top to bottom
#coefficients: Esimate: value of alpha, beta1, beta2, beta3 in linear regression
#            : std is the error term
#            : t-value is the t-value for the variable
#            : Pr(>|t|) is the probability of the variable being greater than absolute value of critical t-value
# for a certain confidence level.

fit <- lm(points ~ attitude + stra+age, data = students2014)
par(mfrow = c(2,2))
plot(fit, which = c(1,2,5))
#Linear regression assumes that there's a linear correlation between the lefthand term (in this case points)
#and the righthand terms (in this case attitude, strategic learning and age) and assumes that there's an error term
#which can be interpret as random noise or something that's not taken into account on questionaire.
#Each of the explanatory variable has coefficient that we try to find.
#Residuals vs Fitted and Residuals vs Leverage seem random and Normal Q-Q seems like there's a clear correlation.