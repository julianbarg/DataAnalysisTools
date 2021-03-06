% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/microplots.R
\name{plot_bars}
\alias{plot_bars}
\title{Plot bargraphs}
\usage{
plot_bars(df, numcols = colnames(df))
}
\arguments{
\item{df}{Any non-empty dataframe.}

\item{numcols}{Columns to be visualized. By default, will visualize all columns that are either character or factor.}
}
\value{
One bargraph for each character or factor variable in \code{df}.
}
\description{
Creates bargraphs for all character columns in the provided dataframe.
}
\examples{
Titanic_df <- as.data.frame(Titanic)
plot_bars(Titanic_df)
}
\references{
https://www.edx.org/course/principles-of-machine-learning-r-edition
}
