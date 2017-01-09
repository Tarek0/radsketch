
#### Subsetting a data frame by column type #####


x <- data.frame(v1=1:20,v2=1:20,v3=1:20,v4=letters[1:20])
nums <- sapply(x, is.numeric)
tt <- x[!nums] # else
num <- x[sapply(x, is.numeric)]
nonnum <- x[!sapply(x, is.numeric)]

num <- train[sapply(train, is.numeric)]
nonnum <- train[!sapply(train, is.numeric)]

colSums(sapply(train[sapply(train, is.numeric)], is.na))
colSums(sapply(train[!sapply(train, is.numeric)], is.na))


# create function

fx <- function(x)
{
  x^2
}

# plot function 

plot(fx(1:10), main = "scatter plot", xlab = "x", ylab = "function - squared")
plot(fx(1:10), main = "line plot", type="l", lty=2) 


p <- recordPlot(plot(fx(1:10), main = "scatter plot")) # store plot

hist(fx(1:10))
p_hist <- recordPlot(hist(fx(1:10)))


install.packages("ggplot2")
library(ggplot2)

