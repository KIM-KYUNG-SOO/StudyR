espresso <- c(4, 5, 3, 6, 5, 4, 7)
americano <- c(63, 68, 64, 68, 72, 89, 94)
latte <- c(61, 70, 59, 71, 71, 92, 88)
price <- c(2.0, 2.5, 3.0)
menu <- c('espresso', 'americano', 'latte') # nolint

cafe <- list(espresso = espresso, americano = americano,
            latte=latte,price=price,menu=menu) # nolint

cafe
str(cafe)
summary(cafe)

cafe$menu <- factor(cafe$menu)
str(cafe)
cafe$price
names(cafe$price) = cafe$menu
cafe$price
names(cafe$price)
str(cafe)

cafe$price[2]
cafe$price[3]