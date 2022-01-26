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

######################################
## 컬럼명 정리
## names(df) 작업해서 인덱싱번호에다 컬럼명 변경
## names(df) = c('','','','').......

names(df)
names(df)[25]='제한속도factor'
names(df)
names(df)[1] = paste(names(df)[1],'-kim',sep='') #R은 문자열 연결을 +로 못함
names(df)[1] = '무인교통단속카메라번호'

######################################
## 필요한 컬럼만 모아서 별도의 데이터셋 제작
## 첫번째: 불필요한 컬럼을 제거함으로서 수행속도를 높임
## 두번째: 분석하고자 하는 내용에 맞게끔 새로운 데이터프레임 구성
str(df)
df1 = df[,c(2,3,4,7,11,13,14,16)]
str(df1)
df2 = df[,c(10,11,13,14)] # 위경도로 지도그리고 싶다면
#########################################################
## 조건에 맞는 자료만 필터링 해서 새로운 데이터셋 제작
## subset으로

str(df1)
#미션, 단속구분을 unique하게 받아봄
unique(df$단속구분)

#subset을 이용하여서 단속구분이 1인 자료만 필터링 해보세요
head(subset(df1, 단속구분 == '1'),10)
#제한속도가 50인 자료만 필터링
head(subset(df1, 제한속도 == 50),10)
#단속구분이 1제외하고 필터링
head(subset(df1, 단속구분 != 1),10)
#단속구분이 1이면서 (&) 시군구명이 '경기도'인 자료
subset(df1, 단속구분 == '1' & 시군구명 == '경기도')
#단속구분이 1이면서 (&) 시도명이 '경기도'인 자료
subset(df1, 단속구분 == '1' & 시도명 == '경기도')

#########################################################
## 조건에 맞는 자료만 필터링 해서 새로운 데이터셋 제작
시도.경기도 = subset(df1, 시도명 == '경기도')
table(df1$시군구명)

################################################
## 자료셋을 새로 제작해서 csv로 저장하기
unique(df1$시도명)

부산 = subset(df1, 시도명 == '부산광역시')
unique(부산$시군구명)


## R에서 for
sido = unique(df1$시도명)
cnt = length(sido)

for (index in 1:cnt){
	tmp = subset(df1, 시도명 == sido[index])

	fileName = paste('./저장/',sido[index],'.csv',sep='')
	write.csv(tmp,fileName)
} 

names(df1)
colbunho = 2
folderName = paste('./저장/', names(df)[colbunho],sep='')
dir.create(folderName)

saveFile = paste('./저장/', folderName)