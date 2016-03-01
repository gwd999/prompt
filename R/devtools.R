
#' Example prompt that shows the package being developed with devtools
#'
#' If git is installed and the current directory is part of a git tree,
#' then also shows all information from \code{\link{prompt_git}}.
#'
#' @param ... Ignored.
#'
#' @family example prompts
#' @export

prompt_devtools <- function(...) {

  if (!using_devtools()) {
    "> "

  } else if (!is_git_dir()) {
    paste0(
      devtools_package(),
      " > "
    )

  } else {
    paste0(
      devtools_package(),
      " ",
      git_branch(),
      git_dirty(),
      git_arrows(),
      " > "
    )
  }
}

using_devtools <- function() {
  "devtools_shims" %in% search()
}

devtools_package <- function() {
  tryCatch(
    devtools::as.package(".")$package,
    error = function(e) "<unknown pkg>"
  )
}
