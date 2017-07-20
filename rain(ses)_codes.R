#Loading data set of rain recorded over years
R = read.csv("file path")
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
#Plotting future_rain to see confidence intervals for prediction
plot(future_rain)
#Checking how model is doing using residuals. For better predictions residuals should be around mean 0
plot(future_rain$residuals) #Everything looks good here
#Plotting residuals qqnorm function
qqnorm(future_rain$residuals) #Residuals should be on straight line along the diagonal
#plotting histograms to check if residuals are close to normal or not
hist(future_rain$residuals) 
#Seems everything is good SES looks best fit for this dataset
