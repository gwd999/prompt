
# prompt

> Dynamic R Prompt

<!-- badges: start -->
[![Lifecycle Status](https://lifecycle.r-lib.org/articles/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![R build status](https://github.com/gaborcsardi/prompt/workflows/R-CMD-check/badge.svg)](https://github.com/gaborcsardi/prompt/actions)
<!-- badges: end -->

Set the R prompt dynamically, from a function. The package contains some
examples.

## Examples

![](https://user-images.githubusercontent.com/660288/109298654-3b181a80-7834-11eb-985e-a8f58ff553c7.png)

This prompt has
* The status of the last command (success or failure).
* The amount of memory allocated by the current R process.
* The name of the R package being developed using
  [devtools](https://github.com/r-lib/devtools).
* Name of the active git branch.
* State of the git working tree (needs pushes, pulls, and/or dirty).

![](https://user-images.githubusercontent.com/660288/109363294-83632700-788c-11eb-897b-fa1e4a752a45.png)

A [powerline](https://github.com/powerline/powerline) clone, that also
shows the current working directory.

## Installation

Install the package from CRAN, as usual:

```r
install.packages("prompt")
```

## Usage

Use one of the pre-defined prompts, as on the screenshots, or create your own.
You can set the prompt in your `.Rprofile`. Maybe you only want to do this
in interactive mode:

```r
if (interactive()) prompt::set_prompt(prompt::prompt_fancy)
```

or the powerline prompt:

```r
if (interactive()) prompt::set_prompt(prompt::make_prompt_powerline())
```

## License

MIT © Gábor Csárdi
