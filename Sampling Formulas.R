#Finite Population Correction factor.
fpc = function(n, N) sqrt( (N-n)/(N-1) )

#Standard error of proportion with finite population correction (FPC).
se.p = function(p, n, N) sqrt( p*(1-p)/n ) * fpc(n, N)

#Standard error of mean with finite population correction (FPC).
se.mean = function(S, n, N) S/sqrt(n) * fpc(n, N)

CI = function(margin, P, conf, N) {
  qt(1 - (1 - conf)/2, )
  N /  margin^2 /norm()
}