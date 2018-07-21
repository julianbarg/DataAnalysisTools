#' Plot bargraphs
#' 
#' Creates bargraphs for all character columns in the provided dataframe.
#' 
#' @references https://www.edx.org/course/principles-of-machine-learning-r-edition
#' @param df Any non-empty dataframe.
#' @param numcols Columns to be visualized. By default, will visualize all columns that are either character or factor.
#' @import ggplot2
#' @export
#' @return One bargraph for each character or factor variable in \code{df}.
#' @examples
#' Titanic_df <- as.data.frame(Titanic)
#' plot_bars(Titanic_df)

plot_bars = function(df, numcols = colnames(df)){
  options(repr.plot.width = 4, repr.plot.height = 3.5) # Set the initial plot area dimensions
  for (col in numcols) {
    if (is.character(df[,col]) | is.factor(df[,col])) {
      p = ggplot(df, aes_string(col)) + 
        geom_bar(alpha = 0.6) + 
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
      print(p)
    }
  }
}


#' Plot histogram
#' 
#' Returns a histogram for every numeric variable in the provided dataframe.
#'
#' @references https://www.edx.org/course/principles-of-machine-learning-r-edition
#' @param df Any non-empty dataframe.
#' @param numcols The names of the columns to be visualized. By default will use all numeric columns.
#' @param bins Number of bins. By default will use 10 bins.
#' @import ggplot2
#' @export
#' @return Prints on histogramfor each numeric column in the provided dataframe.
#' @examples
#' plot_hist(cars)

plot_hist = function(df, numcols = colnames(df), bins = 10) {
  options(repr.plot.width = 4, repr.plot.height = 3) # Set the initial plot area dimensions
  for (col in numcols) {
    if (is.numeric(df[,col])) {
      bw = (max(df[,col]) - min(df[,col]))/(bins + 1)
      p = ggplot(df, aes_string(col)) + 
        geom_histogram(alpha = 0.6, binwidth = bw) 
      print(p)
    }
  }
}



#' Kernel density plot
#' 
#' Visualization of the kernel density estimation. A density plot is returned for each numeric column in the provided dataframe.
#'
#' @references https://www.edx.org/course/principles-of-machine-learning-r-edition
#' @param df Any non-empty dataframe.
#' @param numcols Names of the columns to be used. By default, will use all numeric columns.
#' @import ggplot2
#' @export
#' @return Will print one density plot for the columns in \code{df}, or those selected through the parameter \code{numcols}.
#' @examples
#' plot_dist(cars)

plot_dist = function(df, numcols = colnames(df)){
  options(repr.plot.width = 4, repr.plot.height = 3) # Set the initial plot area dimensions
  for (col in numcols) {
    if (is.numeric(df[,col])) {
      p = ggplot(df, aes_string(col)) + 
        geom_density(color = 'blue') +
        geom_rug()
      print(p)
    }
  }
}




#' Plot histogram and kernel density estimation
#' 
#' A combination of \link[DataAnalysisTools]{plot_hist} and \link[DataAnalysisTools]{plot_dist}.
#'
#' @references https://www.edx.org/course/principles-of-machine-learning-r-edition
#' @param df Any non-empty dataframe.
#' @param numcols Names of columns to be used. By default uses all columns.
#' @param bins How many bins to be used for the histogram. By default, uses 10 bins.
#' @import ggplot2
#' @export
#' @return Will returned an overlayed combination of density plot and histogram for the columns in \code{df}, or those selected through the parameter \code{numcols}.
#' @examples
#' plot_hist_dens(cars)

plot_hist_dens = function(df, numcols = colnames(df), bins = 10){
  options(repr.plot.width = 4, repr.plot.height = 3) # Set the initial plot area dimensions
  for (col in numcols) {
    if (is.numeric(df[,col])) {
      bw = (max(df[,col]) - min(df[,col]))/(bins + 1)
      p = ggplot(df, aes_string(col)) + 
        geom_histogram(binwidth = bw, aes(y = ..density..), alpha = 0.5) +
        geom_density(aes(y = ..density..), color = 'blue') + 
        geom_rug()
      print(p)
    }
  }
}

#' 2d density plot
#' 
#' Creates a 2d density plot of the selected variables.
#'
#' @references https://www.edx.org/course/principles-of-machine-learning-r-edition
#' @param df Any non-empty dataframe.
#' @param col_y Column with the variable to be put on the y-axis.
#' @param cols A number of columns from the dataframe, for each of which a 2d density plot will be created. By default, will use all columns from the dataframe, except for the y-axis column.
#' @param alpha Transparency.
#' @import ggplot2
#' @export
#' @return Multiple 2d density plot, by default one for each column in the provided dataframe, with the selected y column on the y-axis.
#' @examples
#' plot_2density(mtcars, "qsec")

plot_2density = function(df, col_y, cols = NULL, alpha = 0.2) {
  if (missing(cols)) {
    cols <- colnames(df)
    cols <- cols[!cols %in% col_y]
  }
  options(repr.plot.width = 4, repr.plot.height = 3.5) # Set the initial plot area dimensions
  for (col in cols) {
    p = ggplot(df, aes_string(col, col_y)) + 
      geom_density_2d() +
      geom_point(alpha = alpha) +
      ggtitle(paste('2-D density plot of', col_y, 'vs.', col))
    print(p)
  }
}
