
grey <- function() {
  crayon::make_style("grey70")
}

#' A fancy prompt, showing probably too much information
#'
#' It also uses color, on terminals that support it.
#' Is shows: \itemize{
#'   \item Status of last command.
#'   \item Memory usage of the R process.
#'   \item Package being developed using devtools, if any.
#'   \item Git branch and state of the working tree if within a git tree.
#' }
#'
#' @param expr Evaluated expression.
#' @param value Its value.
#' @param ok Whether the evaluation succeeded.
#' @param visible Whether the result is visible.
#'
#' @family example prompts
#' @importFrom crayon green red blue
#' @export

prompt_fancy <- function(expr, value, ok, visible) {

  status <- if (ok) green(symbol$tick) else red(symbol$cross)

  mem <- memory_usage()$formatted

  pkg <- paste(devtools_packages(), collapse = "+")

  git <- git_info()

  emo <- has_emoji()

  paste0(
    "\n",
    status, " ",
    grey()(mem),
    if (nchar(pkg)) if (emo) " \U1F4E6 " else " / ",
    blue(pkg),
    if (nzchar(git)) if (emo) " \ue0a0 " else " / ",
    grey()(git),
    "\n",
    symbol$pointer,
    " "
  )
}

git_info <- function() {
  if (attr(git("--version"), "status") != 0) return("")
  if (!is_git_dir()) return("")

  paste0(
    git_branch(),
    git_dirty(),
    git_arrows()
  )
}

has_emoji <- function() {
  l10n_info()$`UTF-8`
}
