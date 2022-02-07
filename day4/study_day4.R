## 메모리 제거
rm(list = ls())

## 확인
ls()
df = read.csv('./data_r/cust_order_data.csv',sep='\t',encoding='ANSI')

##factor가


## 총데이터 갯수(행과 열의 갯수 확인)
str(df) #열:16, 행:510470

## 각 변수의 성격확인
# CUST_SERIAL_NO: int
# SEX: chr
# AGE: chr
# REG_DATE: chr
# ORDER_DATE: chr
# ORDER_HOUR: chr
# ORDER_WEEKDAY
# IS_WEEKEND: logi
# GOODS_CODE: int
# LGROUP: int
# MGROUP: int
# SGROUP: int
# DGROUP: int
# GOODS_NAME: chr
# PRICE: int
# QTY: int

## 위로 3개의 자료만 읽기
head(df,3)

## 변수명만 출력
colnames(df)

df1 = df[,3:16]
write.csv(df1, '작업자료.csv')
str(df1) 

## 결측치 확인: 결측치가 없는 것으로 확인됨
is.na(df)
summary(df)
sum(is.na(df))
length(df)
for(i in 1:length(df)){
	print(sum(is.na(df[,i])))
}

## GOODS_NAME값의 '#NAME?'NA로 대체하기 위하여
## df$GOODS_NAME을 summary하여서 #NAME?가 있는지를 확인하여봄

summary(df$GOODS_NAME)
length(subset(df,GOODS_NAME == '#NAME?')) # 16개

## GOODS_NAME의 '#NAME?'을 NA로 대체
replace(df$GOODS_NAME, df$GOODS_NAME == 'NA', NA) -> df$GOODS_NAME
length(subset(df,GOODS_NAME == NA))

library(Amelia)
missmap(df)

df = df1[complete.cases(df),]
nrow(subset(df,df1$GOODS_NAME=='#NAME?'))

# 결측치 유무 확인(시각화)
missmap(df1)


str(df)
levels(df$GOODS_NAME)
class(df[,12])


## 풀이
# 파일을 불러올때 chr-> Factor로 바꿔서 불러옴
df = read.csv('./data_r/cust_order_data.csv',sep='\t',encoding='ANSI',stringsAsFactors() = TRUE)

str(df)

tmp = data.frame(table(df[,1]))
head(tmp)
summary(tmp$Freq)
boxplot(tmp$Freq)

table(df[,5]) # 빈도수를 보려할때

boxplot(df[,16])
# 히스토그램도 봐야함