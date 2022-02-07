rm(list=ls())
ls()
df = read.csv('./data_r/cust_order_data.csv',sep='\t',encoding='ANSI',stringsAsFactors=TRUE)

str(df)

tmp = data.frame(table(df[,1]))
head(tmp)
summary(tmp$Freq)
boxplot(tmp$Freq)

table(df[,5]) # 빈도수를 보려할때

boxplot(df[,16])
# 히스토그램도 봐야함
# factor 안에있는 data_set은 level이 남아있다.
# 따라서 factor-> chr로 변환후 작업 다시 as.factor
k-ict 센터
