plot(c(1,2,3))
install.packages("languageserver")
a = c('�ϴ�', '����','����','��','��','��')
b = table(a)
install.packages('wordcloud')
library(wordcloud)
b
wordcloud(names(b), b, min.freq = 1)
