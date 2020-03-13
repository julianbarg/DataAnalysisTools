#' Exclude empty observations
#'
#' @param df Dataframe
#' @param columns Columns to be considered
#'
#' @return The dataframe, where observations are removed if they are completely empty or 0
#' @export
#'
#' @examples
#' df <- data.frame(a = c(0, 2, 0),
#' b = c(0, 3, 0),
#' c = c(NA, 1, 2))
#' exclude_empty_observations(df, c("a", "b", "c"))

exclude_empty_observations = function(df, columns) {
  na_or_0 <- function(df, column) {
    (is.na(df[column]) | df[column] == 0)
  }
  incomplete <- purrr::reduce(columns, 
                              function(x, y) {x & na_or_0(df[y])}, 
                              .init = c(T))
  df[!incomplete, ]
}

