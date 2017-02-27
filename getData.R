library(XML)
fun.tqhb <- function(URL){
 readHTMLTable(URL, encoding = "GBK", stringsAsFactors = F)[[1]]
}

AQI_BJ_201310 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201310.html")
AQI_BJ_201311 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201311.html")
AQI_BJ_201312 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201312.html")

AQI_BJ_201401 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201401.html")
AQI_BJ_201402 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201402.html")
AQI_BJ_201403 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201403.html")
AQI_BJ_201404 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201404.html")
AQI_BJ_201405 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201405.html")
AQI_BJ_201406 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201406.html")
AQI_BJ_201407 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201407.html")
AQI_BJ_201408 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201408.html")
AQI_BJ_201409 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201409.html")
AQI_BJ_201410 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201410.html")
AQI_BJ_201411 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201411.html")
AQI_BJ_201412 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201412.html")

AQI_BJ_201501 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201501.html")
AQI_BJ_201502 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201502.html")
AQI_BJ_201503 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201503.html")
AQI_BJ_201504 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201504.html")
AQI_BJ_201505 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201505.html")
AQI_BJ_201506 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201506.html")
AQI_BJ_201507 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201507.html")
AQI_BJ_201508 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201508.html")
AQI_BJ_201509 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201509.html")
AQI_BJ_201510 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201510.html")
AQI_BJ_201511 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201511.html")
AQI_BJ_201512 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201512.html")

AQI_BJ_201601 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201601.html")
AQI_BJ_201602 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201602.html")
AQI_BJ_201603 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201603.html")
AQI_BJ_201604 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201604.html")
AQI_BJ_201605 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201605.html")
AQI_BJ_201606 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201606.html")
AQI_BJ_201607 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201607.html")
AQI_BJ_201608 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201608.html")
AQI_BJ_201609 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201609.html")
AQI_BJ_201610 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201610.html")
AQI_BJ_201611 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201611.html")
AQI_BJ_201612 <- fun.tqhb(URL = "http://tianqihoubao.com/aqi/beijing-201612.html")

#join years' datas
#合并年数据
AQI_BJ_2013 <- rbind(
  AQI_BJ_201310,AQI_BJ_201311,AQI_BJ_201312
)

AQI_BJ_2014 <- rbind(
  AQI_BJ_201401,AQI_BJ_201402,AQI_BJ_201403,AQI_BJ_201404,
  AQI_BJ_201405,AQI_BJ_201406,AQI_BJ_201407,AQI_BJ_201408,
  AQI_BJ_201409,AQI_BJ_201410,AQI_BJ_201411,AQI_BJ_201412
)
AQI_BJ_2015 <- rbind(
  AQI_BJ_201501,AQI_BJ_201502,AQI_BJ_201503,AQI_BJ_201504,
  AQI_BJ_201505,AQI_BJ_201506,AQI_BJ_201507,AQI_BJ_201508,
  AQI_BJ_201509,AQI_BJ_201510,AQI_BJ_201511,AQI_BJ_201512
)
AQI_BJ_2016 <- rbind(
  AQI_BJ_201601,AQI_BJ_201602,AQI_BJ_201603,AQI_BJ_201604,
  AQI_BJ_201605,AQI_BJ_201606,AQI_BJ_201607,AQI_BJ_201608,
  AQI_BJ_201609,AQI_BJ_201610,AQI_BJ_201611,AQI_BJ_201612
)

#join all datas
#合并全部数据
AQI_BJ_14_16 <- rbind(AQI_BJ_2014,AQI_BJ_2015,AQI_BJ_2016)
