df = matrix(rnorm(10^7), ncol = 10)
df = data.frame(df)
df$tot = rowSums(df)
apply(df, 2, mean)
vars = apply(df, 2, var)
vars[11] - sum(vars[1:10]) #Difference between total variance and sum of the variances.
sqrt(vars[11])
