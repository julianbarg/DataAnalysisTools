#' Set column type as stored in variable
#' 
#' For instance to allow to return an object of the same type as was provided.
#'
#' @param x Object to be converted.
#' @param type Type in string, e.g., "factor".
#'
#' @return Object x, converted to target type.
#' @export
#'
#' @examples
#' type <- "factor"
as.type <- function(vector, type) {
  if (!(type %in% c("numeric", "factor", "character"))) return(vector)
  if (type == "numeric" & all(is.numeric(vector))) return(as.numeric(vector))
  if (type == "factor") return(as.factor(vector))
  if (type == "character") return(as.character(vector))
  return(vector)
}