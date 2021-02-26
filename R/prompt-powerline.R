
#' This is a Powerline-like prompt
#'
#' It is inspired by the <https://github.com/powerline/powerline>
#' project. This prompt uses some Unicode glyphs that work best
#' with the fonts specifically modified for Powerline:
#' https://github.com/powerline/fonts
#'
#' @param col_mem,col_path,col_pkg,col_git Background colors for the
#' sections: allocated memory, working directory, devtools loaded
#' package(s), git info.
#' @return `make_prompt_powerline()` returns a function that you can
#' use with [set_prompt()].
#'
#' @export

make_prompt_powerline <- function(col_mem = "#404040",
                                  col_path = "#0055d4",
                                  col_pkg = "gold4",
                                  col_git= "#7d26cd") {

  bg1 <- cli::make_ansi_style(col_mem, bg = TRUE)
  bg2 <- cli::make_ansi_style(col_path, bg = TRUE)
  bg3 <- cli::make_ansi_style(col_pkg, bg = TRUE)
  bg4 <- cli::make_ansi_style(col_git, bg = TRUE)
  fg1 <- cli::make_ansi_style(col_mem)
  fg2 <- cli::make_ansi_style(col_path)
  fg3 <- cli::make_ansi_style(col_pkg)
  fg4 <- cli::make_ansi_style(col_git)
  bgr <- cli::make_ansi_style("#b90e0a", bg = TRUE)
  fgr <- cli::make_ansi_style("#b90e0a")
  bgg <- cli::make_ansi_style("green4", bg = TRUE)
  fgg <- cli::make_ansi_style("green4")

  sep <- "\ue0b0"
  ptr <- cli::symbol$pointer

  function(expr, value, ok, visible) {
    wd <- format_wd()
    mem <- memory_usage()$formatted
    git <- is_git_dir()
    if (git) {
      branch <- if (git) git_branch()
      dirty <- if (git) git_dirty()
      remote <- if (git) git_remote_status()
      stash <- git_has_stash()
      gitx <- paste0(
        if (dirty == "*") "\u002a ",
        if (stash) "\u2261 ",
        if (!is.na(remote[2]) && remote[2] > 0) paste0("\u21E3", remote[2], " "),
        if (!is.na(remote[1]) && remote[1] > 0) paste0("\u21E1", remote[1], " ")
      )
    }
    pkg <- paste(devtools_packages(), collapse = " / ")

    paste0(
      "\n",
      if (ok) paste0(bgg("  "), fgg(bg1(sep))),
      if (!ok) paste0(bgr("  "), fgr(bg1(sep))),
      bg1(" ", mem, "  "),
      bg2(fg1(sep)),
      bg2(" ", gsub("/", " / ", wd, fixed = TRUE), "  "),
      if (!git && nzchar(pkg)) fg2(sep),
      if (nchar(pkg)) paste0(bg3(fg2(sep)), bg3(" \u25a4 ", pkg, "  ")),
      if (!git) fg3(sep),
      if (git) {
        fg <- if (nzchar(pkg)) fg3 else fg2
        paste0(bg4(fg(sep)), bg4(" \ue0a0 ", branch, " ", gitx, " "), fg4(sep))
      },
      "\n",
      ptr,
      " "
    )
  }
}

format_wd <- function() {
  wd <- getwd()
  wd <- gsub("\\", "/", wd, fixed = TRUE)
  home <- path.expand("~")
  if (wd == home) {
    "~"
  } else if (substr(wd, 1, nchar(home)) == home) {
    paste0("~", substr(wd, nchar(home) + 1L, nchar(wd)))
  } else {
    wd
  }
}
