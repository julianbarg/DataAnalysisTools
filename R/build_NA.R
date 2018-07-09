#' Provide statistics on misssing data in dataframes.
#'
#' @param x Any onempty data.frame.
#' @return A dataframe with multiple rows of statistics on the input dataframe. The output is designed so that that mutliple of the returned dataframes can be concatenated to give a quick overview over the missing data in multiple dataframes. Function returns name of the dataframe, and for each variable (column) the number of NAs, total number of observations (rows), and percentage of missing data. Missing data must be formated to R NA values.  \code{x}
#' @export

build_NA <- function(x) {
  ## First line is easy way to grab the name of the input, which we will denote
  ## in the "source" column of the output.
  input_name <- deparse(substitute(x))
  output <- data.frame(matrix(ncol = 5, nrow = 0))
  colnames(output) <- c("source", "variable", "NAs", "observations",
                        "perc_NA")

  ## Extected input is type data.frame. For performence reasons, we test for and
  ## generate output for data.frame first.
  if (is.data.frame(x)) {
    if (nrow(x) == 0) {
      warning("Input must be data.frame of length > 0. Output is empty")
    } else {
      output[1:ncol(x), ] <- NA
      output$source <- input_name
      output$variable <- names(x)
      output$NAs <- sapply(x, function(y)
        sum(is.na(y)))
      output$observations <- nrow(x)
      output$perc_NA <- output$NAs / output$observations
    }
  }
  
  ## For convenience sake, code also generates output for other data types, but
  ## generates warning.
  if (!is.data.frame(x)) {
    if (is.vector(x) | is.factor(x) | is.list(x)) {
      warning("Input must be data.frame. Output might not be meaningful.")
      output[1, ] <- NA
      output$source <- input_name
      output$variable <- input_name
      output$NAs <- sum(is.na(x))
      output$observations <- length(x)
      output$perc_NA <- output$NAs / output$observations
    }
  
    else if (is.matrix(x)) {
      warning("Input must be data.frame. Output might not be meaningful.")
      output[1:ncol(x), ] <- NA
      output$source <- input_name
      output$variable <- if (!is.null(rownames(x))) {
        rownames(x)
      } else {
        1:nrow(x)
      }
      output$NAs <- apply(x, 1, function(y) sum(is.na(y)))
      output$observations <- nrow(x)
      output$perc_NA <- output$NAs / output$observations  
    }

  output
}