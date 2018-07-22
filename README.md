
<!-- README.md is generated from README.Rmd. Please edit that file -->
DataAnalysisTools
=================

[![Travis-CI Build Sta3tus](https://travis-ci.org/julianbarg/DataAnalysisTools.png?branch=master)](https://travis-ci.org/julianbarg/DataAnalysisTools) [![Coverage Status](https://coveralls.io/repos/github/julianbarg/DataAnalysisTools/badge.svg?branch=master&service=github&ts=1)](https://coveralls.io/github/julianbarg/DataAnalysisTools?branch=master&service=github&ts=1) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/julianbarg/DataAnalysisTools?branch=master&svg=true)](https://ci.appveyor.com/project/julianbarg/DataAnalysisTools)

Convenient and simple data analysis tools for day-to-day use. Mostly to get a first look at data attributes. Output is usually structured to allow for rowbinding, to allow for comparison of different data sets or subsets/versions.

Installation
------------

You can install DataAnalysisTools from github with:

``` r
# install.packages("devtools")
devtools::install_github("julianbarg/DataAnalysisTools")
```

Example
-------

The functions in DataAnalysisTools cover everyday tasks carried out by data scientists and provide for easy-to-read code from the get-go.

``` r
build_NA <- DataAnalysisTools::build_NA
NA1 <- build_NA(mtcars)
NA2 <- build_NA(cars)
NA_statistics <- rbind(NA1, NA2)
NA_statistics
#>    source variable NAs observations perc_NA
#> 1  mtcars      mpg   0           32       0
#> 2  mtcars      cyl   0           32       0
#> 3  mtcars     disp   0           32       0
#> 4  mtcars       hp   0           32       0
#> 5  mtcars     drat   0           32       0
#> 6  mtcars       wt   0           32       0
#> 7  mtcars     qsec   0           32       0
#> 8  mtcars       vs   0           32       0
#> 9  mtcars       am   0           32       0
#> 10 mtcars     gear   0           32       0
#> 11 mtcars     carb   0           32       0
#> 12   cars    speed   0           50       0
#> 13   cars     dist   0           50       0
```
