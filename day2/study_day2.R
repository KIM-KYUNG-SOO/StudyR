dir()
getwd()
setwd("C:/Sources/StudyR/day2")

fileName = "전국무인교통단속카메라표준데이터.csv"
df = read.csv(fileName)
head(df)
str(df)

#01, 03, 10, 9
barplot(table(df$시도명))
tmp = head(subset(df, 시도명=='10'))
str(tmp)

##시군구명이 과연 '서초구만 있나
summary(factor(tmp$소재지지번주소))
table(tmp$소재지지번주소)
unique(tmp$소재지지번주소)

## 1.character를 factor로 변환
## 시도명, 시군구명, 도로종료, 설치연도, 도로노선명
## 2. 숫자를 factor로 변환 -> 이슈-> 기존데이터에 덮어써?, 새로운데이터생성후복사?
##  - factor로 변환하는 파생변수를 생성
## 설치연도, 제한속도
df$시도명 = factor(df$시도명)
df[,3] = factor(df[,3])
df[,4] = factor(df[,4])
df[,6] = factor(df[,6])
str(df)
summary(df)
levels(df[,2])

# 파생변수생성

df$설치연도Factor = factor(df$설치연도)
df[,25] = factor(df$제한속도)
str(df)
summary(df)
plot(df[,24])

# 복습용: 메트릭스 구조가 필요한 이유
str(df)
ma = df[,c(10,11)]
head(ma)
colSums(ma)
rowSums(ma)

ncol(ma)
nrow(ma)
length(ma)
mean(ma)