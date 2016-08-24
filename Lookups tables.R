#This file shows how to use a data.table for programmatic lookups and population of a vector.

library(data.table)

lu = data.table(data.frame(a=runif(15), b=runif(15)), key="a") #A lookup table.

data = data.frame(x = sample(lu$a, size=5))  #Data to lookup.

data$y1 = lu[a==data$x, b] #Lookup column 'b'.

data$y2 = lu[a==data$x, 2, with=F] #Lookup 2nd column, which happens to be 'b'.

data;lu   #View results.
