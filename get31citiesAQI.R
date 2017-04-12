library(rvest)
library(xml2)
fun.geturl <- function(geturl){
  web <- read_html(geturl,encoding = "UTF-8")
  aa <- data.frame( web %>% html_nodes("table") %>% .[[1]] %>% html_table(fill = TRUE))
  return(aa)
}

a2004 <- fun.geturl("http://www.stats.gov.cn/ztjc/ztsj/hjtjzl/2004/200612/t20061212_57745.html")
a2005 <- fun.geturl("http://www.stats.gov.cn/ztjc/ztsj/hjtjzl/2005/200612/t20061205_56939.html")
a2006 <- fun.geturl("http://www.stats.gov.cn/ztjc/ztsj/hjtjzl/2006/200712/t20071210_60924.html")
a2007 <- fun.geturl("http://www.stats.gov.cn/ztjc/ztsj/hjtjzl/2007/200812/t20081205_65763.html")
a2008 <- fun.geturl("http://www.stats.gov.cn/ztjc/ztsj/hjtjzl/2008/201006/t20100617_70583.html")
a2009 <- fun.geturl("http://www.stats.gov.cn/ztjc/ztsj/hjtjzl/2009/201012/t20101203_70821.html")


b2004 <- a2004[-c(1:7),-6]
b2005 <- a2005[-c(1:6,38,39),-c(6,7)]
b2006 <- a2006[-c(1:8,40:43),-c(6,7)]
b2007 <- a2007[-c(1:11,43:46),-c(6,7)]
b2008 <- a2008[-c(1:11,43:46),-c(6,7)]
b2009 <- a2009[-c(1:11,43:46),-c(6,7)]


year=c(rep(2004,31))
c2004 <- data.frame(b2004,year)
year=c(rep(2005,31))
c2005 <- data.frame(b2005,year)
year=c(rep(2006,31))
c2006 <- data.frame(b2006,year)
year=c(rep(2007,31))
c2007 <- data.frame(b2007,year)
year=c(rep(2008,31))
c2008 <- data.frame(b2008,year)
year=c(rep(2009,31))
c2009 <- data.frame(b2009,year)

aqi0409 <- rbind(c2004,c2005,c2006,c2007,c2008,c2009)

write.csv(aqi0409,file = "aqi0409.csv",fileEncoding = 'UTF-8')
