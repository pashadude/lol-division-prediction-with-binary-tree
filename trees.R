install.packages("rattle")
install.packages("rpart.plot")

library(caret)
library (kernlab)
library(ggplot2)
library(rattle)


dataset <- read.csv("/home/proveyourskillz/Desktop/trees/userdatatree.csv", header=T, row.names=1)
inTrain<-createDataPartition(dataset$League,p=3/4)[[1]]
training<-dataset[inTrain,]
testing<-dataset[-inTrain,]
modFit<-train(League~.,method="rpart",data=training)
print(modFit$finalModel)
fancyRpartPlot(modFit$finalModel)
predict(modFit,newdata=testing)
