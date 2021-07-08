# Code for `cornellcolors` R package.
# Code is adopted from Cianna Bedford-Peterson's `inauguration` R package.
# Source code: https://github.com/ciannabp/inauguration
# Please find the copyright description from Cianna Bedford-Peterson's R package at the end of this file.


#' List of color palettes.
#'
#' Use \code{\link{render_cornell_colors}} to construct palettes of desired length.
#'
#' @export
cornell_palettes <- list(
  classic = c("#B31B1B", "#FFFFFF", "#222222", "#5E3920", "#89572E", "#000000"),
  secondary = c("#F7F7F7", "#A2998B", "#9FAD9F"),
  accents = c("#006699", "#6EB43F", "#F8981D", "#EF4035", "#073949"),
  malott = c("#86B5B6", "#E1DBCB", "#B06F3E", "#A79C8E", "#88B49F", "#696049"),
  brb = c("#AD6556", "#7B7B80", "#F1BA47", "#BCC0C4", "#9B5113")
)

#' Cornell colors palette rendering
#'
#' @param n Number of colors desired. Most palettes have 3-5 colors. Most color
#'   schemes are derived from \href{https://brand.cornell.edu/design-center/colors/}.
#'   If omitted, uses all colors.
#' @param name Name of color palette. Choices are:
#'   \code{classic}, \code{secondary}, \code{accents}, \code{malott}, \code{brb}
#' @importFrom graphics rgb rect par image text
#' @return A vector of colors.
#' @export
#' @keywords colors
#' @examples
#' render_cornell_colors("classic")
#' render_cornell_colors("malott", 3)
render_cornell_colors <- function(name, n) {

  pal <- cornell_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (n > length(pal)) {
    stop("Number of colors requested is larger than the chosen palette can provide.")
  }

  out <- pal[1:n]

  structure(out, class = "palette", name = name)
}


#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, col = "#32373D")
}


# MIT License

# Copyright (c) 2021 Cianna Bedford-Petersen

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
