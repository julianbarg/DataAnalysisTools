#' Set column type as stored in variable
#'
#' @param x Object to be converted.
#' @param type Type in string, e.g., "factor".
#'
#' @return Object x, converted to target type.
#' @export
#'
#' @examples
#' type <- "factor"
as.type <- function(x, type) {
  if (type == "numeric") return(as.numeric(x))
  if (type == "factor") return(as.factor(x))
  if (type == "character") return(as.character(x))
}