#' Utility function for consolidating duplicates.
#'
#' @param df Dataframe to consolidate.
#' @param summary_parsing Functions to apply in the summarize function.
#' @param ... Columns by which to group for summarize.
#' @param by_cols Alternative argument to pass through the columns by which to group.
#'
#' @import dplyr
#'  
#' @export
#'
#' @examples
#' consolidate_duplicates(mtcars, list(mean_hp = rlang::quo(mean(hp))), cyl)
consolidate_duplicates <- function(df, summary_parsing, ..., by_cols = NA) {
  if (is.na(by_cols)) {by_cols <- rlang::enquos(...)}
  
  df %>%
    group_by(!!! by_cols) %>%
    summarize(!!! summary_parsing)
}
