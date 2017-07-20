#Loading data set
R = read.csv("file path")
#Looking at the data and first few values
str(R)
head(R)
#Converting data set into time series data set
R_ = ts(R,frequency=12,start=c(1987,1)) #Starting from first month of 1987
#Plot time series to see which model to fit
plot(R_)  #Here the seasonality is increasing with time
#To reduce the magnitude of seasonality we will transform the time series
R_1 = log(R_)
#Looking at first few figures of data set to see if magnitude reduces
head(R_1)
#Plotting the time series after reducing magnitude
plot(R_1)
#We will use triple exponential smoothing here because the time series has trend and seasonality
R_1_forecast = HoltWinters(R_1)
#Plot R_1_forecast to predicted and actual
plot(R_1_forecast)
#Let see what alpha, beta and gamma values the model suggest
R_1_forecast
#The algorithm has given weightage only to recent past because trend before it is not needed
#Let us make the forecast
library(forecast)
R_future = forecast:::forecast.HoltWinters(R_1_forecast, h=60)
#Plotting forecast for next 60 periods
plot(R_future)
#Checking for qnorm
qqnorm(R_future$residuals) #Everything seems good here as residuals have stayed on a straight line along the diagonal
plot(R_future$residuals) #Everything seems good here as not more than spike has crossed the significance margin
hist(R_future$residuals) #Everything seems good here as residuals are following close to normal distribution
