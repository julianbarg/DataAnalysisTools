#' Show a preview of a dataframe, even a high-dimensional one. In practical terms, the function is a wrapper around glimpse.
#' 
#' The first n columns and last m columns are shown. This avoids clutter in a workbook e.g., when a dataframe has > 100 columns.
#'
#' @param df Any nonempty dataframe.
#' @param first The numbers of columns, starting from the left of the dataframe, to be shown.
#' @param last THe number of columns, starting from the right of the dataframe, to be shown.
#' @return Returns the dataframe without all columns that contain the string.
#' @importFrom dplyr glimpse
#' @export
#' @examples
#' quick_look(mtcars)

quick_look <- function(df, first=5, last=3){
  len <- length(df)
  if (len > first+last){
    dplyr::glimpse(df[, c(1:first, (len-last + 1):len)])
  } else {
    dplyr::glimpse(df)
  }
}