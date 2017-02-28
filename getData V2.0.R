library(XML)

# setwd('/Users/xn/Desktop/')
AQI <- data.frame()
fun.tqhb <- function(address,startyear,endyear){
  for(y in startyear:endyear){
    for(month in 01:2){
      ym <- y*100+month
      URL <-  paste0('http://www.tianqihoubao.com/aqi/',address,'-',ym,'.html')
      AQI_one <- readHTMLTable(URL, encoding = "GBK", stringsAsFactors = F)[[1]]
      # print(AQI_one)
      AQI <- rbind(AQI,AQI_one)
      # print(AQI)
    }
  }
  # write.csv(AQI,file=paste0(address,startyear,'-',endyear,'.csv'),fileEncoding = 'UTF-8')
}


fun.tqhb('beijing',2016,2016)
