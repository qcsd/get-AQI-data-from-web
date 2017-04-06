library(XML)
library(stringr)

######################
#   read AQI data   #
######################

# 下面一行与write.csv配套使用,控制输出位置
setwd('/Users/xn/Desktop/')
AQI <- data.frame()
fun.tqhb_AQI <- function(address,startyear,endyear){
  for(y in startyear:endyear){
    for(month in 01:12){
      ym <- y*100+month
      URL <-  paste0('http://www.tianqihoubao.com/aqi/',address,'-',ym,'.html')
      AQI_one <- readHTMLTable(URL, encoding = "GBK", stringsAsFactors = F)[[1]]
      AQI <- rbind(AQI,AQI_one)
    }
  }
  
  #return(AQI)
  write.csv(AQI,file=paste0(address,'_','AQI','-',startyear,'~',endyear,'.csv'),fileEncoding = 'UTF-8')
 }

# when need csv output
# must use "write,csv" in function
fun.tqhb_AQI('beijing',2013,2016)
fun.tqhb_AQI('chengdu',2013,2016)


# when do not need csv output
# must use "reture"in function
beijing_aqi <- fun.tqhb_AQI('beijing',2016,2016)

#############################
#   read temperature data   #
#############################

temperature_2 <- data.frame()
fun.tqhb_tem <- function(address,startyear,endyear){
  for(y in startyear:endyear){
    for(month in 9:9){
      ym <- y*100+month
      URL <-  paste0('http://www.tianqihoubao.com/lishi/',address,'/month/',ym,'.html')
      temperature_1 <- readHTMLTable(URL, encoding = "GBK", stringsAsFactors = F)[[1]]
      temperature_2 <- rbind(temperature_2,temperature_1)
    }
  }

  a1 <- word(temperature_2$气温,1)
  a2 <- word(temperature_2$气温,81)
  b1 <- str_extract(a1,'-?\\d')
  b2 <- str_extract(a2,'-?\\d')
  temperature <- data.frame(temperature_2, b1,b2)
  
  return(temperature)
  # write.csv(temperature,file=paste0(address,'_temp-',startyear,'~',endyear,'.csv'),fileEncoding = 'GBK')
  
 }


# when do not need csv output
# must use "reture"in function
beijing_t <- fun.tqhb_tem('beijing',2011,2014)  # 2015年数据抓取的表结构不同，无法运行
chengdu_t1 <- fun.tqhb_tem('chengdu',2012,2012)  


# when need csv output
# must use "write,csv" in function
fun.tqhb_tem('beijing',2016,2016) 
fun.tqhb_tem('chengdu',2011,2011)
