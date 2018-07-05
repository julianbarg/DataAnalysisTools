#' Provide statistics on misssing data in dataframes.
#'
#' @param df Any non-empty dataframe.
#' @return A dataframe with multiple rows of statistics on the input dataframe. The layout is such that mutliple of the returned dataframes can be concatenated to give a quick overview over the missing data in multiple dataframes. Function returns name of the dataframe, and for each variable (column) the number of NAs, total number of observations (rows), and percentage of missing data. Missing data must be formated to R NA values.  \code{x}
#' @export

build_NA <- function(df){
  name <- deparse(substitute(df))
  na_count <- data.frame(sapply(df, function(y) sum(is.na(y))))
  na_count$df <- name
  na_count$variable <- rownames(na_count)
  na_count['NAs'] <- na_count[1]
  na_count <- na_count[,-1]
  na_count$observations <- nrow(df)
  na_count$perc <- na_count$NAs / na_count$observations
  return(na_count)
}