data("mtcars")
build_NA(mtcars)

gender <- as.factor(sample(c("m", "f"), 100, replace = TRUE))
build_NA(gender)

empty_dataframe <- data.frame()
build_NA(empty_dataframe)

m <- matrix(1:4, nrow = 2)
build_NA(m)
rownames(m) <- c("row1", "row2")
build_NA(m)

atomic <- 5
build_NA(atomic)

N <- NA
build_NA(N)
