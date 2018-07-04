#' Provide some NA statistics
#'
#' @param df A dataframe
#' @return A dataframe with multiple rows of statistics on the input dataframe \code{x}
#' @examples
#' 

build_NA <- function(df){
  name <- deparse(substitute(df))
  na_count <- data.frame(sapply(df, function(y) sum(is.na(y))))
  na_count$table <- name
  na_count$dataframe <- rownames(na_count)
  na_count['NAs'] <- na_count[1]
  na_count <- na_count[,-1]
  na_count$observations <- nrow(df)
  na_count$perc <- na_count$NAs / na_count$observations
  return(na_count)
}