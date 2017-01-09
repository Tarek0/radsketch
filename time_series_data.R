data()

airpassengers <- data(AirPassengers)
head(AirPassengers)


plot(AirPassengers)


install.packages("zoo")
library(zoo)

prices <- c(132, 130, 120, 129, 130)
dates <- as.Date(c("2010-01-04", "2010-01-05", "2010-01-06", "2010-01-07", "2010-01-08"))

ibm.daily <- zoo(prices, dates)
print(ibm.daily)

#extract data
coredata(ibm.daily)

#extract date or time
index(ibm.daily)

plot(ibm.daily, screens = c(1,2))


kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)

kingstimeseries <- ts(kings)
kingstimeseries

births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
birthstimeseries <- ts(births, frequency=12, start=c(1946,1))
birthstimeseries



#### expsmooth package ####

install.packages("expsmooth")
library(expsmooth)

data(package = "expsmooth", unemp.cci)
data(package = .packages(all.available = TRUE)) # show all datasets from all packages
data(package = "expsmooth")
try(data(package = "expsmooth") )  # list the data sets in the rpart package


plot(unemp.cci[,1:2],main="Unemployment and the CCI",xlab="Year")
cci <- ts(unemp.cci[,"cci"],start=c(1997))
plot.ts(cci)

#Single exponential smoothing
cci.ses<- HoltWinters(cci, beta=FALSE, gamma=FALSE)
cci.ses
plot(cci.smes$fitted)


#double exponential smoothing
cci.double <- HoltWinters(cci, gamma=FALSE)
cci.double
plot(cci.double)
plot(cci.double$fitted)


#### forecast package #### 
install.packages("forcast")
library(forecast)

AirPassengers
# Fit model to first few years of AirPassengers data
air.model <- Arima(window(AirPassengers,end=1956+11/12),order=c(0,1,1),
                   seasonal=list(order=c(0,1,1),period=12),lambda=0)

plot(forecast(air.model,h=48))
lines(AirPassengers)
