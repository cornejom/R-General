library(ggplot2)
numpoints = 24
df = data.frame(x=1:numpoints, y=runif(numpoints))
model = lm(y ~ x, df)
ggplot(df, aes(x, y)) + geom_point() + geom_abline(intercept=model$coefficients[1], slope=model$coefficients[2])
ggplot(df, aes(x, y)) + geom_point() + geom_abline(intercept=model$coefficients[1], slope=model$coefficients[2]) + geom_hline(yintercept=mean(df$y))
