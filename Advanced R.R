###Chapter on Non-Standard Evaluation

##Capturing Expressions

#Exercise 1: create wrapper for deparse that always return a single string.
g <- function(x) {
  out = deparse(substitute(x))
  paste0(out, collapse = "")
}

#Exercises 2.
 #Function 'as.Date.default uses substitute() to convert argument x into the name of 
 #the argument the function was called with ... then uses deparse() to convert that name
 #into a string for inclusion in error message.

#Exercises 3?
aq = airquality
names(aq)[5] = paste0(sample(LETTERS, 501, replace = TRUE), collapse = "")
names(aq)[5]
pairwise.t.test(aq$Ozone, aq$VQEEVTBPWWHSWVCVXONSTRMPUSBNTAIWGPXKSEVHCGNQFAJRHJSDRDHZKCJJJTKBLGVLHZMUJSZEHWHHQUNUFSYSGAFUBPKZSMRGIVKVVPABHYCJZFURIOQLSIKUZHOTYTATPRFRHMIZUYULUAOBXNRGVPEZKOLFTJIHKWCVHMMEVCVSESXBWIMOMPFQSTFZTITFQRXBTJVASDAYFTXDMQMZFTWXHFGHJMASFSKZEEWGGSMPZXKTDPVQTDKCQYDDHNZUEWPTAQQQJDBXYHXYICOWXQDZEZLGSCGWCHYKYJGVATJVWEWVULSLVVRQYLYMMSSNBXIBOXZSQQCOAYJDSLCCMXZANDGIOJTVWZTKVEYLUKPBEVWAJAOGLOTJXWCPDCKPSTUGYEYFYANZVVWWKDJWUZMAEZIQCIGLINXWBBRDHQJEPITCHQONLOUFOQICJETTPLMXDDUHXURSFJSMQBTICPYAQRFXJHKVPDMJQDVNMSFJCIENB)

debug(pairwise.t.test)
pairwise.t.test(
  c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
  c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
)


substitute(c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1))  #Line breaks after 20th value.
deparse(substitute(c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)))
deparse(substitute(c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)), width.cutoff = 300)
nchar('c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)')
object.size('c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)')

x = rnorm(100)
g = gl(2, 1, 100)
`a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q + r + s + t + u + v + w + x + y + z` <- g
pairwise.t.test(x, `a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q + r + s + t + u + v + w + x + y + z`)
object.size(`a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q + r + s + t + u + v + w + x + y + z`)

#Exercises 4?
f <- function(x) substitute(x)
g <- function(x) deparse(f(x))

##Section on Subset

#Ex 2
s2 <- function(x, condition) {
  condition_call <- substitute(condition)
  r <- eval(condition_call, x)
  x[r, , drop=F]
}

#Ex. 3
s3 <- function(x, condition) {
  condition_call <- substitute(condition)
  r <- eval(condition_call, x)
  r <- !is.na(r) &  r == TRUE #An alternative: r[is.na(r)] <- FALSE
  x[r, , drop=F]
}

#Ex. 4 ... use quote instead of substitute. Doesn't work well.
s4 <- function(x, condition) {
  condition_call <- quote(condition)
  r <- eval(condition_call, x)
  r <- !is.na(r) &  r == TRUE #An alternative: r[is.na(r)] <- FALSE
  x[r, , drop=F]
}

#Ex5. How does variable selection work?

select <- function(df, vars) {
  vars <- substitute(vars)
  var_pos <- setNames(as.list(seq_along(df)), names(df))
  pos <- eval(vars, var_pos)
  df[, pos, drop = FALSE]
}

select(mtcars, -cyl)
select(mtcars, wt:vs) #Note that : operator is equivalent to seq(from, to), which works fine here because each list element is integer vector of length 1.


##Scoping Issues

#Ex.1
so = function(...){
  substitute(order(...))
}
