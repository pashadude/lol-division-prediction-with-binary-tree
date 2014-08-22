library(caret)
library (kernlab)
library(ggplot2)
dataset <- read.csv("/home/proveyourskillz/Desktop/trees/userdata.csv", header=T, row.names=1)
inTrain<-createDataPartition(dataset$League,p=3/4)[[1]]
training<-dataset[inTrain,]
testing<-dataset[-inTrain,]
modFit<-train(League~.,method="rpart",data=training)
print(modFit$finalModel)
install.packages("rattle")
install.packages("rpart.plot")
library(rattle)
fancyRpartPlot(modFit$finalModel)

