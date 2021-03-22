
is.string <- function(x) {
  is.character(x) && length(x) == 1 && !is.na(x)
}

`%||%` <- function (a, b) if (!is.null(a)) a else b

with_something <- function(set, reset = set) {
  function(new, code) {
    old <- set(new)
    on.exit(reset(old))
    force(code)
  }
}

in_dir <- with_something(setwd)

os_type <- function() .Platform$OS.type

drop_nulls <- function(x) {
  x[!vapply(x, is.null, logical(1))]
}
