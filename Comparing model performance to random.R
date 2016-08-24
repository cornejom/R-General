
sim = replicate(1000, rbinom(108, 1, .5))
avgs = apply(sim, 2, mean)
hist(avgs)
sum(dbinom(0:56, 108, 0.5))

sim = replicate(1000, rbinom(108, 1, .5))
