data <- read.csv("benchmark.csv")
print(data)

data[183,2]
data[4,2]
j = 1
new_df <- data.frame('benchmark(t)'=double(), 'benchmark(t-1)'=double(),'benchmark(t-2)'=double(),'benchmark(t-3)'=double())
                 
while ( j <= nrow(data)-3)
{
  new_df[j,1] = data[j,2]
  new_df[j,2] = data[j+1,2]
  new_df[j,3] = data[j+2,2]
  new_df[j,4] = data[j+3,2]
  j <- j + 1
}
