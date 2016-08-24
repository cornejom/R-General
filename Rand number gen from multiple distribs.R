#This file shows how to create a data frame of multiple executions of random number generation from
# beta distribution with custom parameters for each execution.  The ouput is a data frame with two
# columns: 'value' and 'group'. 'value' is a random number. 'group' is an integer indicating the
# sample to which 'value' belongs.

numgroups = 20
group = 1:numgroups
n = c(50, 65, 80, rep(100, 17))
shape1 = rep(7, numgroups)
shape2 = rep(7, numgroups)

params = data.frame(group, n, shape1, shape2)

params[8, 3:4] = c(2,10)

f = function(x) {
  df = data.frame(value=rbeta(x$n, x$shape1, x$shape2))
  df$group = x$group
  df
}

set.seed(151209)
samples = by(params, params$group, f)
samples = do.call(rbind, samples)
rownames(samples) = NULL

samples[samples$group==8, 1] = samples[samples$group==8, 1] + 0.34
samples[samples$group==15, 1] = samples[samples$group==15, 1] + 0.04