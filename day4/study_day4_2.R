rm(list=ls()
ls()
## 시각화에 특화된 ggplot
## 데이터필터, 그룹등에 특화된 dplyr
## 텍스트 빈도수 시각화에 특화된 wordcloud

df = read.csv('./data_r/cust_order_data.csv',sep='\t',encoding='ANSI',stringsAsFactors=TRUE)
df
df = df[df$SEX != "*",]
head(df,10)

# 성별 구매 건수
sex1 = subset(df,select = c(ORDER_DATE,SEX,QTY))
sex1 # 구매일자, 성별, 구매 건수만 추출하여 별도의 프레임을 만든다.

install.packages('lubridate') # lubridate 라이브러리 설치
library(lubridate)

sex2 = cbind(sex1, month = month(sex1$ORDER_DATE))
head(sex2,5) # 

install.packages('reshape2')
library(reshape2)

dcast(sex2, SEX ~ month,value.var = "QTY", sum)


 changeGender = function(x) { if (x[2] == "M") { return("male") } else 
{ return("female") } }
sex2$gender = apply(sex2,2,changeGender)
head(sex2)

library(ggplot2)
qplot(month,data=sex2, geom="bar",fill=gender)##
ggplot(sex2,aes(month))+geom_bar()+facet_wrap(~gender)

## 연령대 구매 건수
age1 = subset(df, select=c(ORDER_DATE,AGE,QTY))
head(age1)
age2 = cbind(age1, month = month(age1$ORDER_DATE))
dcast(age2, AGE~month, value.var = "QTY", sum)
age2 = cbind(age2, ages = paste(age2$AGE,"대"))

qplot(month,data=age2,geom="bar",fill=ages)
ggplot(age2,aes(month)) + geom_bar() + facet_wrap(~age)###


sexage1 = subset(df,select=c(ORDER_DATE,SEX,AGE,QTY))
head(sexage1)

library(plyr)
sexage2 = ddply(sexage1, .(ORDER_DATE,SEX,AGE), summarize, Sum_F=sum(QTY))
head(sexage2)

sexage3 = cbind(sexage2, month=month(sexage2$ORDER_DATE))
sexage3 = cbind(sexage3, ages=paste(sexage3$AGE,"대"))
head(sexage3)

ggplot(sexage3,aes(month))+geom_bar()+facet_wrap(~SEX+ages)

sexage2 = ddply(sexage1, .(ORDER_DATE,AGE,SEX), summarise, Sum_F=sum(QTY))
sexage3 = cbind(sexage2, month=month(sexage2$ORDER_DATE))
sexage3 = cbind(sexage3, ages=paste(sexage3$AGE,"대"))

ggplot(sexage3,aes(month))+geom_bar()+facet_wrap(~ages+SEX)

cust1 = subset(df, select=c(ORDER_DATE,CUST_SERIAL_NO,PRICE))
head(cust1)
cust2 = cbind(cust1, month=month(cust1$ORDER_DATE))
nrow(cust2)
cust3 = ddply(cust2, .(CUST_SERIAL_NO,month),summarize,Sum_F=sum(PRICE))
nrow(cust3)
head(cust3)
df2 = cbind(df, month=month(df$ORDER_DATE))
aggdata = aggregate(PRICE~CUST_SERIAL_NO+month,data=df2,sum)
aggdata = cbind(aggdata, real_month=paste(aggdata$month,"월"))
head(aggdata)
