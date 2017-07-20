#Loading data set of rain recorded over years
R = read.csv("C:\\Users\\Admin\\Desktop\\Blog post\\R (Edvancer)\\Data\\Data\\rain.csv")
#Converting R data set into a time series data set
R_ = ts(R, start=c(1813)) #Yearly data starting from 1813 (external information)
#Plot R_
plot(R_)
#Since the plot shows no trend and seasonality we shall proceed with single exponential smoothing
Rain_forecast = HoltWinters(R_,beta = F, gamma = F)
Rain_forecast
plot(Rain_forecast) #Plot the predicted & Actual values
install.packages('forecast')
library(forecast) #Install library
#Forecasting rain for 5 future periods ahead
future_rain = forecast:::forecast.HoltWinters(Rain_forecast, h = 5)
#Plotting in graph to see confidence intervals for prediction
plot(future_rain)
#Checking how model is doing using residuals. For better predictions residuals should be around mean 0
plot(future_rain$residuals)
qqnorm(future_rain$residuals) #Should be on straight line along the diagonal
hist(future_rain$residuals) #Checking if residuals are close to normal or not
#Seems everything is good SES looks best fit for this dataset