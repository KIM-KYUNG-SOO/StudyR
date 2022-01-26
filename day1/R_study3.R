# 리스트, 펙터 정리
# R에는 내장데이터를 많이 제공한다.
# 자동차 연비와 관련된 내장된 mtcars

mtcars #read 없는 자료는 내장자료
str(mtcars)
mtcars[1:5,]
head(mtcars,3)
summary(mtcars)
plot(mtcars$cyl)

summary(mtcars$cyl)
summary(factor(mtcars$cyl))

# 아래 3가지는 같은 명령이다.
names(summary(factor(mtcars$cyl)))
levels(factor(mtcars$cyl)) # levels, summary는 자동정렬되어 나옴
unique(mtcars$cyl) # 맨 위에있는 데이터부터 중복제거하며 내려옴

tmp = summary(factor(mtcars$cyl))
tmp
names(tmp) = c('cyl:4','cyl:6','cyl:8')
tmp

# split(자료, 기준) 작업하면 리스트화됨
tmp = split(mtcars, mtcars$cyl)
str(tmp)
tmp[[1]]
split(tmp[[1]],tmp[[1]]$am) 
#split(tmp[[1]],tmp[[1]][9]) 위와 동일값