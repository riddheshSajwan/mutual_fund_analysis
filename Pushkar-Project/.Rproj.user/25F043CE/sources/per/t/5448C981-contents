library(mlbench)
library(caret)
library(gridExtra)

df_train <- df_vis
colnames(df_train)[10] <- 'target_flows'

#correlation analysis
corrMat <- cor(df_train)

#printing out png of correlation matrix
png("C:\\Users\\riddh\\OneDrive\\Documents\\Projects\\Pushkar-Project\\Regression_Project\\Regression_Project\\correlationMatrix.png")
grid.table(corrMat)
dev.off()

#create regression model
mlrmodel <- lm(target_flows ~., data = df_train)
summary(mlrmodel)

#calculate accuracy of model
trainIndex = createDataPartition(df_train$target_flows, p = .80, list = FALSE)
dfObserved <- df_train[-trainIndex,]
predictionsMLR_DT = predict(mlrmodel, dfObserved[,1:9]) # or dsTest[,-10]

#accuracy using Mean Absolute Percentage Error
MAPE = function(y, yhat){
  mean(abs((y - yhat)/y))
}

AccuracyMLR = 100 - MAPE(dfObserved[,10], predictionsMLR_DT)
print(paste("Accuracy of Multiple Linear Regression is",AccuracyMLR))