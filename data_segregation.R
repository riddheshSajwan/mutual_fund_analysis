#combining target varible (with missing values) with predictors (without missing values)
df_new <- cbind(df_vis[,1:9],df[,11])
colnames(df_new)[10] <- 'target_flows'
#test and train dataset segregation
miss_index <- which(is.na(df_new[,10])) #target variable missing values
df_train <- df_new[-miss_index,]
df_test <- df_new[miss_index,]
write.csv(df_train, "train.csv", row.names = F)
write.csv(df_test, "test.csv", row.names = F)