mtcars
boxplot(mtcars$mpg)

par(mfrow = c(2,1))
boxplot(mtcars$mpg ~ mtcars$gear)

plot(mtcars$mpg, mtcars$gear)
cor(mtcars$mpg, mtcars$gear)
# 양의 상관도를 보이지만, 상관관계가 그리 높진 않다.

par(mfrow = c(2,1))
boxplot(mtcars$mpg ~ mtcars$vs)
plot(mtcars$mpg, mtcars$vs)
cor(mtcars$mpg, mtcars$vs)

par(mfrow = c(2,1))
boxplot(mtcars$mpg ~ mtcars$am)
plot(mtcars$mpg, mtcars$am)
cor(mtcars$mpg, mtcars$am)
# 변속기 종류에 따라 연비가 달라지며, 스틱=1이 연비가 높은것으로 보임

boxplot(mtcars)
str(mtcars)
# 각 variable이 같은 범주안에 있지 않기 때문에
# 일부 데이터는 한 화면에서 확인이 어렵다.

# scale
tmp = scale(mtcars)
summary(tmp)
boxplot(tmp)