#' Adjust print options for a dataframe in jupyter lab using kable.
#'
#' Workaround for using kable styling in jupyter lab.
#'
#' @param df The dataframe to print
#' @param ... Arguments to be passed through to \link[kableExtra]{kable_styling}.
#' @import dplyr
#' @export
#' @examples
#' jupyter_styling(mtcars, font_size=14)

jupyter_styling <- function(df, ...){
  kableExtra::kable(df) %>%
    kableExtra::kable_styling(...) %>%
    as.character() %>%
    IRdisplay::display_html()
}