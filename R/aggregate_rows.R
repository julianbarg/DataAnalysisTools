#' Aggregate multiple rows into one.
#' 
#' Multiple columns are added together, or the mean is taken to create a new columns. Used can also choose to delete the original columns.
#'
#' @param x Any nonempty dataframe.
#' @param columns Names of the columns to be aggregated.
#' @param new_colname How to name the new columns
#' @param mode Choose "sum" to take sum, or "mean" to take the mean.
#' @param delete Choose TRUE to drop the original rows from the dataframe, or FALSE to retain them.
#' @return Returns the dataframe with the new column included.
#' @export
#' @examples
#' aggregate_columns(mtcars, c("vs", "cyl", "mpg"), "meaningless_mean", mode = "mean")

aggregate_columns <- function(x, columns, new_colname, mode = "sum", delete = FALSE) {
  if (mode == "sum") {
    aggregate <- function(y) (rowSums(y))
  } else if (mode == "mean") {
    aggregate <- function(y) (rowMeans(y))
  } else {
    stop("mode must be \"sum\" or\"mean\".")
  }
  x[new_colname] <- aggregate(x[,colnames(x) %in% columns])
  if (delete == TRUE) {
    x <- x[,!colnames(x) %in% columns]
  }
  x
}