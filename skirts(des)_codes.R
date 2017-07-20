#Loading data set
R = read.csv("file path")
#Converting data set into time series data set
R_ = ts(R,start=c(1866)) #Starting from 1866
#Plot time series to see which model to fit
plot(R_)  
#We will use double exponential smoothing here because the time sereis has trend that too not in consistent direction
R_forecast = HoltWinters(R_, gamma = F)
#Plot R_forecast to predicted and actual
plot(R_forecast)
#Let see what alpha and beta values the model suggest
R_forecast
#The algorithm has given higher weightage to recent past because it is more relevant to our future prediction
#Let us make the forecast
library(forecast)
R_future = forecast:::forecast.HoltWinters(R_forecast, h=5)
#Plotting forecast for next 5 periods
plot(R_future)
#Checking residuals for accuracy
qqnorm(R_future$residuals) #Everything seems good here as residuals have stayed on a straight line along the diagonal
plot(R_future$residuals) #Everything seems good here as not more than spike has crossed the significance margin
hist (R_future$residuals) #Everything seems good here as residuals are following close to normal distribution
