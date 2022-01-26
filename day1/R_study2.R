iris[, c(1:2)]
iris[, c(1, 3, 5)]
iris[, c('Sepal.Length', 'Species')] # nolint
iris[1:5, ]
iris[1:5, c(1, 3)]

# 1. 작업자료 다운로드
#    부산광역시_현대미술관 관람객수.csv
# 2. R에서 csv로 읽기
#    df = read.csv('.......csv') # nolint
# 3. 구조파악 => str(df) : 타입,행, 열의갯수
# 4. 데이터샘플을 확인 => head(df,10)
# 5. 데이터의 기본 기술통계 => summary(df)
# 6. 빈도수계산 => summary(factor(df[,1]))