#' Delete columns or rows containing the provided string.
#' 
#' THe provided dataframe is returned with out any of the columns or rows that contain the specified string.
#'
#' @param x Any nonempty dataframe.
#' @param string The string to be matched.
#' @param delete Should matched columns, or matched rows be deleted. Default is "columns".
#' @param exclude Exclude specific column named here. 
#' @return Returns the dataframe without all columns that contain the string.
#' @export
#' @examples
#' delete_entries_containing(mtcars, "a", exclude = "am")
#' delete_entries_containing(mtcars, "Toyota", delete = "columns")

delete_entries_containing <- function(x, string, delete = "columns", exclude = c()) {
  stopifnot(class(string) == "character", length(string) == 1)
  if (delete == "columns") {
    delete_columns <- names(x)[grepl(string, names(x)) & !(names(x) %in% exclude)]
    output <- x[,!names(x) %in% delete_columns]
  }
  else if (delete == "rows") {
    delete_rows <- rownames(x)[grepl(string, rownames(x)) & !(rownames(x) %in% exclude)]
    output <- x[!rownames(x) %in% delete_rows, ]
  }
  else if (!delete %in% c("rows", "columns")) {
    stop("Variable delete must be either \"columns\" or \"rows\".")
  }
  output
}
