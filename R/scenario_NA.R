#' Compare the number of missing variables for different scenarios.
#' 
#' @param x Any nonempty dataframe.
#' @param index Column used to create different scenarios. Column must be formatted as factor.
#' @param exclude should the statistics be created for each group individually (FALSE), or for the scenario that the group is excluded (TRUE).
#' @param drop Should any groups be dropped (when exclude = TRUE is selected, this drops the scenario of the group being excluded).
#' @param add_stat Additional statistics that should be included. Works with functions such as "mean" or "sd".
#' @exclude
#' @return A dataframe with origin of data, number of NAs, number of observations, and % missing data for each group (as specified in \code{index}) in \code{x}. The output is designed so that that mutliple of the returned dataframes can be concatenated to give a quick overview over the missing data in multiple dataframes. Function returns name of the dataframe, and for each variable (column) the number of NAs, total number of observations (rows), and percentage of missing data. Missing data must be formated to R NA values.
#' @example
#' mtcars$gear <- as.factor(mtcars$gear)
#' scenario_NA(mtcars, gear, exclude = TRUE, drop = 5, ad_stat = sd)

# scenario_NA(x, index, exclude = FALSE, drop, add_stat){
#   output
# }