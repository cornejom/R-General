myseed <- (unclass(Sys.time())*1e9 * Sys.getpid()) %% 1e9;
set.seed(myseed)