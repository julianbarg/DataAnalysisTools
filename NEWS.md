# DataAnalysisTools 0.0.0.9900

## quick_look

A wrapper around dplyr::glimpse. For wide dataframes with too many columns to reasonably look at. A compromise between the head and glimpse function. Only shows a limited amount of columns from the left and the right of the dataframe, but prints those sideways to allow the reader to see more of the actual data.