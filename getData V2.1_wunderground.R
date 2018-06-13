library(XML)
library(RCurl) 
library(stringr)
library(foreign)

  
setwd('/Users/xn/Desktop/')
weather <- data.frame()

func.getWeather <- function(address,startyear,endyear){
  for(year in startyear:endyear){
    for(month in 10:12){
      for(day in 1:31){
      myURL <- paste0('https://www.wunderground.com/history/airport/ZUUU/',year,'/',month,'/',day,'/DailyHistory.html?req_city=',address,'&req_state=&req_statename=China&reqdb.zip=00000&reqdb.magic=339&reqdb.wmo=WZUUU')
      page <- readHTMLTable(getURL(myURL), encoding = "GBK", stringsAsFactors = F)
      
      
      a <- data.frame(page$historyTable)
      
      b <- subset(a, X.=="Mean Temperature"|X.=="Max Temperature"|X.=="Min Temperature"|X.=="Dew Point"|X.=="Average Humidity"|X.=="Maximum Humidity"|X.=="Minimum Humidity"|X.=="Precipitation"|X.=="Sea Level Pressure"|X.=="Wind Speed"|X.=="Max Wind Speed"|X.=="Visibility",
                  select =  c("X.","Actual"))
      
      # first remember the names
      n <- b$X.
      # transpose all but the first column (name)
      b <- as.data.frame(t(b[,-1]))
      colnames(b) <- n
      
      b$date <- paste0(year,'/',month,'/',day)
      
      weather <- rbind(weather,b)
      }
    }
  }
  
return(weather)
  
}

chengduW <- func.getWeather('Chengdu',2016,2016)

####################

cdw <- chengduW[c(-8,-10)]

cdw$date <- as.Date(cdw$date)

meanTemp <- gsub("°C","",cdw$`Mean Temperature`)
  cdw$meanTemp <- as.numeric(meanTemp)
maxTemp <- gsub("°C","",cdw$`Max Temperature`)
  cdw$maxTemp <- as.numeric(maxTemp)
minTemp <- gsub("°C","",cdw$`Min Temperature`)
  cdw$minTemp <- as.numeric(minTemp)
dewP <- gsub("°C","",cdw$`Dew Point`)
  cdw$dewPoint <- as.numeric(dewP)
cdw$`average_Humidity` <- as.numeric(cdw$'Average Humidity')
cdw$`max_Humidity` <- as.numeric(cdw$'Maximum Humidity')  
cdw$`min_Humidity` <- as.numeric(cdw$'Minimum Humidity')  
Precipitation <- gsub("mm","",cdw$`Precipitation`)
  cdw$precipitation <- as.numeric(Precipitation)
pressure <- gsub("hPa","",cdw$`Sea Level Pressure`)
  cdw$pressure <- as.numeric(pressure)  
cdw$wind_Speed <- as.character(cdw$`Wind Speed`)
Max_Wind_Speed <- gsub("km/h","",cdw$`Max Wind Speed`)
  cdw$maxWind <- as.numeric(Max_Wind_Speed)
Visibility <- gsub("kilometers","",cdw$`Visibility`)
  cdw$visibility <- as.numeric(Visibility)
  
chengduweather <- cdw[c(-1,-2,-3,-4,-5,-6,-7,-8,-9,-11,-10,-12)]

  write.dta(chengduweather, "/Users/xn/Desktop/cd_weather2016_10_11_12.dta")  
  
  
# save(chengduW,file="ChengduWeather2010to2017")

# load("/Users/xn/Desktop/ChengduWeather2010to2017")





