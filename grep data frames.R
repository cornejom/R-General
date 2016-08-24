#Print column name and number of all character columns in a data frame and the sum of grepl
# on each such column.
#Args: 'pattern' is the regular expression to feed to grepl. 'df' is the data frame in which
# to look.

grepl.sum.df = function(pattern, df) {
  for (i in 1:ncol(df)) {
    if (is.character(data[[i]])) {
      print(paste("Field:", i, ":", sum(grepl(pattern, df[[i]])), ":", names(df)[i]))
    }
  }
}