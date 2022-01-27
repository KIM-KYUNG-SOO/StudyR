dir()
install.packages('cowsay')
library(cowsay)
byNameList = c('cat','cow','ghost')

?say # 해당패키지의 도움말

for (byName in byNameList){
	say('heoo', by = byName)
}

for (index in 1:length(byNameList)) {
	say('heoo', by = byNameList[index])
}

#########################################################

install.packages('reshape2')
library('reshape2')

# 자료 파악 : 변수의 성격과 해설
# total_bill : 전체지불비용
# tip : tip비용
# sex : 성별(카드사용자인지, 인풋대상자인지...)
# smoker : 흡연석/비흡연석
# day : 요일
# time : 방문시간, 오전/오후시간
# size : 방문인원
# -> 일잘하는 직원에게 팁이 많이 나오는 자리로 배치등
# -> 일잘하는 직원에게 월급을 더 줘야하는가?
# 상기와 같이 데이터 set을 파악해야하는 이유에 대해서 생각해야함

# 결측치 확인
sum(is.na(tips))
unique(tips[,2])
unique(tips[,3])
unique(tips[,4])
unique(tips[,5])

# 가설과 검증
class(tips[,3])

for (i in 1:length(tips)){
	if (class(tips[,i]) == 'factor'){
	print(unique(tips[,3]))
	}
}

# 1번가설: 성별(x값, 독립변수)에 따르는 tips(y값, 종속변수)의 비용은 같다.
# 	0가설(귀무가설)
# 	검증을 통해서 비용은 같다 => 귀무가설 선택
# 	비용이 다르다 => 귀무가설 기각/대립가설 선택
# 	pvaluse를 통해서 확인함.(by통계)
# 일반적인 가설검증은 데이터집계를 통해서 비교

str(tips)
table(tips[,3]) # 성별의 빈도수, 전체데이터에서 발생횟수
table(tips[,3:7]) # 명목형 변수를 결정하고 다시 데이터셋, 여기서는 3~7까지를 명목변수로 결정

for(i in c(3:7)){
	print(paste('---',names(tips)[i],'---'))
	print(table(tips[,i]))
}

din = subset(tips, time == 'Dinner')
lun = subset(tips, time == 'Lunch')

table(tips$time)
table(din$day)
table(lun$day)

table(tips$time)
colMeans(din[c('total_bill','tip','size')])
colMeans(lun[c('total_bill','tip','size')])
# 평균값이 크게 차이가 나이 않을 수 있다.
# 평균값에서 얼마나 떨어져 있나(편차, 분산이 의미가 있을 수 있다.)

colSums(din[c('total_bill','tip','size')])
colSums(lun[c('total_bill','tip','size')])

par(mfrow = c(2,1))
plot(din$tip)
plot(lun$tip)
# 좋은데이터는 편향과 분산이 평균에 밀집해 있어야 함

summary(lun)
tmp = subset(lun, tip >=4)
summary(tmp)
# 인원사이즈가 클수록 팁 금액에도 차이가 있다.

tmp = subset(tips, day == 'Fri')
summary(subset(tips, day == 'Fri'))
table(tmp$size)\

# 성별에 따라서 데이터의 차이를 보자
man = subset(tips, sex == 'Male')
wom = subset(tips, sex == 'Female')
table(tips$sex)
summary(man)
summary(wom)
# 남자가 여자에 비해 인원수가 2배차이가 있지만 tip의 평균이 2배차이가 나지는 않는다.

summary(man$tip)
summary(wom$tip)
colSums(man[c('total_bill','tip','size')])
colSums(wom[c('total_bill','tip','size')])

# 데이터가 확인할 가치가 있는가?? -> 정규분포의 형태를 띈다.
# 히스토그램작성 -> 평균, 분산, 분포도를 확인한다.

tips
plot(tips[,1])
# x축은 기본값 인덱스번호로 들어간다.
head(tips[,1])

plot(tips[,1], tips[,2])
plot(tips[,7], tips[,1])

str(tips)
colNum = c(1,2,7)
par(mfrow = c(3,1))
for (i in colNum){
	plot(tips[,i],main = names(tips)[i])
}

mtcars
str(mtcars)
plot(mtcars)
plot(mtcars[c(1,3,5,6)])

# 피어슨 상관계수(-1 ~ 1사이값)
cor(mtcars[,c(1,3,5,6)]) # 문자데이터가 들어가있으면 에러가뜸

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(mtcars, histogram=TRUE, pch=19)

# 머신러닝(기계학습)
# 독립변수들과 종속변수들의 연관패턴을 찾는것
# 분석을 통한 예측, 분류

# 독립변수(x)끼리는 상관도가 너무 높으면 안됨...
# 상관도가 너무 높은 경우를 다중공선성이라함.
# 다중공선성은 VIF(분산팽창지수)로 10이상 나오는 걸 의미
# 이런경우 x변수를 제거하고, VIF보고, x변수 제거하고....
# 반복해서 결과를 도출해야한다.


# 인공지능 -> 
# 머신러닝(기계가 학습하여 모델을 생성하고 새로운 데이터를 예측하거나 분류)
# 그중 사진, 오디오, 비디오등의 비정형데이터는 양이 엄청많음.
# 이러한 비정형데이터에 특화된 분석은 인공신경망을 이용하고 이를 딥러닝이라고 함.

# 빅카인즈 개체명분석\

tips
boxplot(tip~day, data=tips)
토요일은 왜???

tmp = subset(tips,day =='Sat')
par(mfrow=c(2,2))
boxplot(tip~size, data = tmp)
boxplot(tip~sex, data = tmp)
boxplot(tip~smoker, data = tmp)
boxplot(tip~time, data = tmp)



boxplot(tips$tip)
tt = subset(tips, tip<5)
summary(tt)
boxplot(tt$tip)

str(tt)
boxplot(tip~day, data=tt)