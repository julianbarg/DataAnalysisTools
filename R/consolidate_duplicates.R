#' Utility function for consolidating duplicates.
#'
#' @param df Dataframe to consolidate.
#' @param summary_parsing Functions to apply in the summarize function.
#' @param ... Columns by which to group for summarize().
#' @param by_cols Alternative argument to allow for passing through the columns by which to group.
#'
#' @import dplyr
#'  
#' @export
#'
#' @examples
#' consolidate_duplicates(mtcars, list(mean_hp = rlang::quo(mean(hp))), cyl)
consolidate <- function(df, summary_parsing, ..., by_cols = NA) {
  if (is.na(by_cols)) {by_cols <- rlang::enquos(...)}
  
  df %>%
    group_by(!!! by_cols) %>%
    summarize(!!! summary_parsing)
}


#' Consolidate duplicate entries
#' 
#' Consolidates the columns for which there are summary functions provided. 
#' For columns without summary functions, non-duplicated entries retain their 
#' original value, and duplicated entries return NA.
#'
#' @param df Dataframe to consolidate.
#' @param summary_parsing Functions to apply in the summarize function.
#' @param ... Columns by which to group for (summarize).
#' @param by_cols Alternative argument to allow for passing through the columns by which to group.
#'
#' @export
#'
#' @examples
#' consolidate_duplicates(mtcars, list(wt = rlang::quo(mean(wt))), hp)
consolidate_duplicates <- function(df, summary_parsing, ..., by_cols = NA){
  if (is.na(by_cols)) {by_cols <- rlang::enquos(...)}
  
  duplicated <- duplicated(select(df, !!! by_cols), fromLast = T) | duplicated(select(df, !!! by_cols), fromLast = F)
  
  df_duplicates <- consolidate(df[duplicated, ], summary_parsing = summary_parsing, by_cols = by_cols)
  
  df <- df[!duplicated, ] %>%
    bind_rows(df_duplicates)
  return(df)
}



