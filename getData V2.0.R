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

temperature <- data.frame()
fun.tqhb_tem <- function(address,startyear,endyear){
  for(y in startyear:endyear){
    for(month in 1:12){
      ym <- y*100+month
      URL <-  paste0('http://www.tianqihoubao.com/lishi/',address,'/month/',ym,'.html')
      temperature_one <- readHTMLTable(URL, encoding = "GBK", stringsAsFactors = F)[[1]]
      temperature <- rbind(temperature,temperature_one)
    }
  }
   return(temperature)
 }

# 提取最高气温和最低气温
fun.tem_str <- function(data_in,data_var){
  a1 <- word(data_var,1)
  a2 <- word(data_var,81)
  b1 <- str_extract(a1,'-?\\d')
  b2 <- str_extract(a2,'-?\\d')
  data_in <- data.frame(data_in, b1,b2)
  return(data_in)
  # write.csv(data_in,file=paste0(data_in,'-',startyear,'~',endyear,'.csv'),fileEncoding = 'UTF-8')
}

# when do not need csv output
# must use "reture"in function
beijing_t1 <- fun.tqhb_tem('beijing',2011,2014)  # 2015年数据抓取的表结构不同，无法运行
beijing_temp <- fun.tem_str(beijing_t,beijing_t$气温)


# when need csv output
# must use "write,csv" in function
fun.tem_str((beijing_t,beijing_t$气温)) 

