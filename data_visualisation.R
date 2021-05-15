library(psych)
library(ggplot2)

#Probability Density Funciton with histogram and normal fit
multi.hist(df_vis, main = NULL, dcol = c("blue", "red"),
           dlty = c("solid", "solid"), bcol = "linen")


#histogram with mean line
for (i in 1:ncol(df_vis)){
  
  title_val <- paste("Histogram and Mean of ",colnames(df_vis[i])) 
  hist_plot<-ggplot(df_vis, aes(x=df_vis[,i])) + 
    geom_histogram(binwidth=0.5,color="darkblue", fill="lightblue",
                   linetype="solid")+
    labs(title=title_val,x=colnames(df_vis[i]), y = "Frequency")+
    theme_classic() +
    geom_vline(aes(xintercept=mean(df_vis[,i])),
               color="red", linetype="dashed", size=1)
  
  print(hist_plot)
}

drawBoxP <- function(df){
  for (i in 1:ncol(df)){  
    title_val <- paste("Boxplot with Outliers of ",colnames(df[i])) # paste("Boxplot without Outliers of ",colnames(df[i]))
    
    box_plot <- ggplot(df, aes(x='', y= df[,i])) + 
      geom_boxplot(outlier.color = "red", outlier.shape = 19,
                   outlier.size = 1.5, outlier.stroke = 0.5) + 
      labs(title=title_val,x=colnames(df[i]), y = "Frequency") + 
      geom_jitter(shape=16, position=position_jitter(0.2)) #with jitter
    print(box_plot)
  }  
}
#boxplot with outliers
drawBoxP(df_vis)
