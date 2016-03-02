
# prompt

> Dynamic R Prompt

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![Linux Build Status](https://travis-ci.org//prompt.svg?branch=master)](https://travis-ci.org//prompt)
[![Windows Build status](https://ci.appveyor.com/api/projects/status/github//prompt?svg=true)](https://ci.appveyor.com/project//prompt)
[![](http://www.r-pkg.org/badges/version/prompt)](http://www.r-pkg.org/pkg/prompt)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/prompt)](http://www.r-pkg.org/pkg/prompt)

![](/inst/prompt-screenshot-png)

Set the R prompt dynamically, from a function. The package contains some
examples. The prompt on the screenshot has:
* The status of the last command (success or failure).
* The status of the parallel worker processes used by
  [https://github.com/gaborcsardi/parr](parr).
* The amount of memory allocated by the current R process.
* The name of the R package being developed using
  [https://github.com/hadley/devtools](devtools).
* Name of the active git branch.
* State of the git working tree (needs pushes, pulls, and/or dirty).

## Installation

```r
devtools::install_github("/prompt")
```

## Usage

Use the `prompt_fancy` prompt, as on the screenshot, or create your own.

```r
library(prompt)
set_prompt(prompt_fancy)
```

## License

MIT © Gábor Csárdi
