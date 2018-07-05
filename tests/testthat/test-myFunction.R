a <- c(1, 2, 3)
b <- c(4, NA, 6)
c <- c(7, 8, 9)
df <- data.frame(a, b, c)
build_NA(df)

d <- c(1, 2, 3)
build_NA(d)

df2 <- data.frame()
build_NA(df2)