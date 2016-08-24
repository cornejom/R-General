#This script creates a scatter plot of dummy data along with the linear fit and confidence region.
library(ggplot2)

dat <- data.frame(xvar = runif(20), yvar = 1:20 + rnorm(20, -100,sd=100))
dat <- dat[order(dat$xvar),]

ggplot(dat, aes(x=xvar, y=yvar)) +
  geom_point() +   # Use hollow circles
  geom_smooth(method=lm) + # Add linear regression line (by default includes 95% confidence region)
  labs(title="Change in Revenue as Function of Some Predictor 'X'", x="Predictor 'X'", y="Change in Revenue ($K)") +
  theme(plot.title=element_text(size=rel(1.4)), axis.title=element_text(size=rel(1.3)), axis.text = element_text(size=rel(1.2)))

model = lm(yvar ~ xvar, dat)
model
new = data.frame(xvar=runif(20))
new = new[order(new$xvar),, drop=F]

preds = cbind(new, predict(model, interval = "confidence"))
preds = cbind(new, predict(model, newdata=new, interval = "prediction"))
row.names(preds) = NULL

preds$range = preds$upr - preds$lwr
preds[order(preds$range, decreasing=TRUE),]
