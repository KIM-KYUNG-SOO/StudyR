# 콘솔창에 커서를 두고
# 파일 - 작업디렉토리변경 / setwd로 작업디렉토리 설정할 수 있음

dir() # 파이썬 os.listdir or glob와 같다.
# csv자료의 가장 윗자료를 필드명으로 가져옴


df = read.csv("부산광역시_현대미술관 관람객 수_20201231.csv")
str(df)
head(df)
names(df)
summary(df)

# 자료만 연도만 출력ｄｆ
str(df)
df$연도ｄｄｄｄ
df[, 1]
min(df[, 1])

# 미션 연도와 관람객수만 출력
df[, c(1, 3)]
head(df, 10)
tail(df, 12)
df[[1:3], [3]]

df[is.na(df)] = 0 #NA값을 0으로 대체
df
is.na(df[3])
summary(df)

df
#화면분할
par(mfrow=c(3,1)) #차트창을 닫거나,
#par(mfrow=c(1,1))만날때까지 유지


index=1
barplot(table(is.na(df[1], main='연도')))
#barplot(table(is.na(df[index], main=names(df)[index])))
barplot(table(is.na(df[2], main='월')))
barplot(table(is.na(df[3], main='관람객수')))

#그래프제목
title
main


year = split(df,df$연도)
year
year[[3]]
str(year)

index = 1
yearData = year[[index]]
yearData
title = year[[index]][1,1]
title
plot(yearData$월, yearData$관람객수, main=title)