qt(0.975, 1000)  #yields 1.795885 ... works like lookup up in t-distribution table. Known as inverse distribution function.

pt(1.96, 1000)  #yields 0.95 ... cumulative distribution given the critical statistic
pt(3, 100)      #One side probability at 3 sigma

#To find 2-sided confidence at s standard errors:
s = 3
n = 25

1 - (1 - pt(s, n)) * 2 #Or ... simplify algrebraicly as ... 2 * pt(s, n) - 1
2 * pt(s, n) - 1