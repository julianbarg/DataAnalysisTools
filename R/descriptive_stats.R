#' Generates the most common descriptive statistics tables.
#' 
#' @param x Any nonempty dataframe.
#' @param drop character or vector: Columns not to be included in the descriptive statistics table.
#' @param factor_expand Should factors automatically be expanded into multiple dummy variables? When factor_expand = FALSE, factor variables will instead be transformed into numeric.
#' @param summary_position Where should the summary statistics be positioned. Supports "left", "bottom", "top", and "right".
#' @param half_empty When half_empty = TRUE, the top right half of the table will automaticall be filled with empty cells.
#' @exclude
#' @return A data.frame with mean, standard deviation, and correlation table.
#' @example
#' descriptive_stats(mtcars)

# descriptive_stats(x, drop, factor_expand = TRUE, summary_position = "left", half_empty = TRUE){
#   output
# }