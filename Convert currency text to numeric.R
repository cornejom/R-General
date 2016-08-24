#Convert currency text values, with dollar signs and parentheses for negative values, to numeric.
CurrTextToNum = function(x) {
  x = gsub("\\$|,|)", "", x)
  x = gsub("\\(", "-", x)
  as.numeric(data.raw$ActivityValue)
}