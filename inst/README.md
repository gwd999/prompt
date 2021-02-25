
# prompt

> Dynamic R Prompt

<!-- badges: start -->
[Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![R build status](https://github.com/r-lib/prompt/workflows/R-CMD-check/badge.svg)](https://github.com/r-lib/prompt/actions)
[![](http://www.r-pkg.org/badges/version/prompt)](http://www.r-pkg.org/pkg/prompt)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/prompt)](http://www.r-pkg.org/pkg/prompt)
<!-- badges: end -->

![](/inst/prompt-screenshot.png)

Set the R prompt dynamically, from a function. The package contains some
examples. The prompt on the screenshot has:
* The status of the last command (success or failure).
* The amount of memory allocated by the current R process.
* The name of the R package being developed using
  [devtools](https://github.com/hadley/devtools).
* Name of the active git branch.
* State of the git working tree (needs pushes, pulls, and/or dirty).

## Installation

Once on CRAN, install the package with:

```r
install.packages("prompt")
```

## Usage

Use the `prompt_fancy` prompt, as on the screenshot, or create your own.

```r
library(prompt)
set_prompt(prompt_fancy)
```

## License

MIT © Gábor Csárdi
