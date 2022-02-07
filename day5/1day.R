getwd()
library(readxl)

exam <- read.csv("./Data/csv_exam.csv")
exam

## 불러온 데이터를 확인하기

head(exam)
tail(exam)
# 기본 상위, 하위 6개를 보여줌
head(exam, 10)
tail(exam, 10)

View(exam)
# V는 대문자로 써야함

dim(exam) #데이터구조, 차원을 알려줌
str(exam)
summary(exam)
# 문자값이 있는 컬럼은 배제한다


mpg <- as.data.frame(ggplot2::mpg)
# ggplot2의 mpg 데이터를 데이터 프레임 형태로 불러오기
# 내장되어있는 파일의 경우 위와같이 데이터프레임형태로만든다
mpg
head(mpg,10)
str(mpg)
summary(mpg)

install.packages("dplyr")
library(dplyr)
# 데이터 전처리(Preprocessing)- dplyr패키지

df_raw <- data.frame(var1 = c(1,2,1), var2 = c(2,3,2))
df_raw
df_new <- df_raw

df_new <- rename(df_new, v2 = var2)
# 컬럼명의 변경
df_new

df <- data.frame(var1 = c(4,3,8), var2 = c(2,6,1))
df

# var_sum 파생변수 생성
df$var_sum <- df$var1 + df$var2
df$var_meam <- (df$var1 + df$var2)/2
# df$칼럼명
df

mpg
mpg$total <- (mpg$cty + mpg$hwy)/2
# 통합 연비 변수 생성
head(mpg)
mean(mpg$total)
summary(mpg$total)
hist(mpg$total) # 히스토그램 생성

mpg$test <- ifelse(mpg$total >= 20, "pass","fail")
head(mpg,20)

table(mpg$test)

library(ggplot2)
qplot(mpg$test)
qplot(mpg$test)
# 연비 합격 빈도 막대 그래프 생성

mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total > 20,"B","C"))
head(mpg,10)
qplot(mpg$grade)
table(mpg$grade)

midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
tail(midwest)
View(midwest)
dim(midwest)
str(midwest)

# 2,3번문제
head(midwest)
midwest <- rename(midwest, total = poptotal)
midwest <- rename(midwest, asian = popasian)
midwest$per <- (midwest$asian / midwest$total)*100

# 4번문제
mean(midwest$per)
midwest$x1 <- ifelse(midwest$per > mean(midwest$per),"large","small")

# 5번문제
table(midwest$x1)
qplot(midwest$x1)

# 자유자재로 데이터 가공하기(filtering)
exam
exam %>% filter(class == 1)
# %>% 단축키 Ctrl+Shift+M
# 해석은 ~중에서로 한다
# exam변수중에서~

exam %>% filter(class != 1)
# 1반이 아닌 나머지반

exam %>% filter(class == 1 & math >= 50)
# 여러 조건을 충족하는 행 추출하기 'AND'

exam %>% filter(math >= 90 | english >= 50)
# 논리연산자 'OR'

exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1,3,5))
# 같은 결과값이다.

class1 <- exam %>% filter(class == 1)
mean(class1$math)


# 1번문제: 배기량이 4이하인 제품이 연비가 높다
mpg
mpg1 <- mpg %>% filter(displ <= 4)
mpg1
mean(mpg1$hwy)
mpg2 <- mpg %>% filter(displ >= 5)
mean(mpg2$hwy)

# 2번문제: toyota가 도시연비가 높다
mpg3 <- mpg %>% filter(manufacturer == "audi")
mpg4 <- mpg %>% filter(manufacturer == "toyota")
mean(mpg3$cty)
mean(mpg4$cty)

# 3번문제
mpg5 <- mpg %>% filter(manufacturer == "chevrolet" 
                       | manufacturer == "ford" 
                       | manufacturer == "honda")
mean(mpg5$hwy)

exam %>% select(math)
# 특정칼럼(math)만 추출

exam %>% select(class, math,english)
# 여러 칼럼 추출하기

exam %>%  select(-math)
# 특정칼람만 제외하기

exam %>%  select(-math, -english)
# 여러개의 칼럼 제외하기

# class가 1인행만 추출한 다음 english 추출
exam %>% 
  filter(class == 1) %>% 
  select(english)

exam %>% 
  select(id, math) %>% 
  head

# 1번문제
mpg6 <- mpg %>% select(class,cty)

# 2번문제
df_suv <- mpg6 %>% filter(class == "suv")
df_compact <- mpg6 %>% filter(class == "compact")
mean(df_suv$cty)
mean(df_compact$cty)
