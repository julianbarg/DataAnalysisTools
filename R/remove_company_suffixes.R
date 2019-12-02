#' Remove company suffixes from a string.
#'
#' @param string Input vector. Either a character vector, or something coercible to one.
#'
#' @return A character vector.
#' 
#' @export
#'
#' @examples
#' remove_company_suffixes(c("Enterprise Products Operating LLC", "Mercedes-Benz AG"))
remove_company_suffixes <- function(string) {
  company_suffixes <- c("LLC", "AG")
  
  company_suffixes <- c(stringr::str_to_upper(company_suffixes), 
                        stringr::str_to_lower(company_suffixes), 
                        stringr::str_to_title(company_suffixes))
  # Remove either if space before and after, or if space before and end of string ($) after.
  in_end <- sapply(company_suffixes, function(x) paste0(" ", x, "$"), USE.NAMES = FALSE)
  in_middle <- sapply(company_suffixes, function(x) paste0(" ", x, " "), USE.NAMES = FALSE)
  pattern <- paste0(c(in_end, in_middle), collapse = "|")
  
  return(stringr::str_remove_all(string, pattern = pattern))
}
