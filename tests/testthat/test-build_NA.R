# Test for dataframe.
expected_output_mtcars <-
  data.frame(
    source = "mtcars",
    variable = c(
      "mpg",
      "cyl",
      "disp",
      "hp",
      "drat",
      "wt",
      "qsec",
      "vs",
      "am",
      "gear",
      "carb"
    ),
    NAs = 0L,
    observations = 32L,
    perc_NA = 0,
    stringsAsFactors = FALSE
  )
data("mtcars")
expect_equal(build_NA(mtcars), expected_output_mtcars)

# Test for factor. Supposed to work but throw a warning.
expected_output_gender <-
  data.frame(
    source = "gender",
    variable = "gender",
    NAs = 0,
    observations = 100,
    perc_NA = 0,
    stringsAsFactors = FALSE
  )
gender <- as.factor(sample(c("m", "f"), 100, replace = TRUE))
expect_warning(build_NA(gender),
               "Input must data.frame. Output might not be meaningful.")
expect_equal(build_NA(gender), expected_output_gender)

# Test for empty dataframe. Supposed to work but throw a warning.
empty_dataframe <- data.frame()
expect_warning(build_NA(empty_dataframe))
expect_true(nrow(build_NA(empty_dataframe)) == 0)

# Test for matrix. Supposed to work but throw a warning.
expected_output_matrix <- 
  data.frame(
    source = "m",
    variable = 1:2,
    NAs = 0L,
    observations = 2L,
    perc_NA = 0,
    stringsAsFactors = FALSE
  )
m <- matrix(1:4, nrow = 2)
expect_warning(build_NA(m))
expect_equal(build_NA(m), expected_output_matrix)
rownames(m) <- c("row1", "row2")
expected_output_matrix$variable <- c("row1", "row2")
expect_equal(build_NA(m), expected_output_matrix)

# Test for atomic. Supposed to work but throw a warning.
expected_output_atomic1 <-
  data.frame(
    source = "atomic1",
    variable = "atomic1",
    NAs = 0L,
    observations = 1L,
    perc_NA = 0,
    stringsAsFactors = FALSE
  )
atomic1 <- 5
expect_warning(build_NA(atomic1))
expect_equal(build_NA(atomic1), expected_output_atomic1)

expected_output_atomic2 <-
  data.frame(
    source = "atomic2",
    variable = "atomic2",
    NAs = 0L,
    observations = 1L,
    perc_NA = 0,
    stringsAsFactors = FALSE
  )
atomic2 <- TRUE
expect_equal(build_NA(atomic2), expected_output_atomic2)

# Test for NA as input Supposed to work but throw a warning.
expected_output_NA <-
  data.frame(
    source = "N",
    variable = "N",
    NAs = 1L,
    observations = 1L,
    perc_NA = 1,
    stringsAsFactors = FALSE
  )
N <- NA
expect_warning(build_NA(N))
expect_equal(build_NA(N), expected_output_NA)


# When input is function, expect empty output and warning.
testfunction <- function(x)
  (x * 2)
expect_warning(build_NA(testfunction))
expect_true(nrow(build_NA(testfunction)) == 0)
            