
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- Use `devtools::build_readme()` to generate .md from the .Rmd file. -->

# socialcap

<!-- badges: start -->

[![R-CMD-check](https://github.com/gaba-tope/socialcap/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/gaba-tope/socialcap/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The `socialcap` package is designed to provide an easy and efficient way
to include social media handles with corresponding icons in the captions
of ggplot2 plots. <br> By using the socialcap function, users can:

1.  Add their social media usernames (GitHub, Twitter, Facebook,
    LinkedIn, Discord) along with stylish icons directly to their plots.
2.  Customize the appearance of these handles, including text color and
    font, to match the aesthetic of their visualizations.

This package was largely inspired from [Nicola
Rennie](https://nrennie.rbind.io/)’s post, [Adding social media icons to
charts with
{ggplot2}](https://nrennie.rbind.io/blog/adding-social-media-icons-ggplot2/).

The icons of social media are obtained from the ‘Font Awesome 6 Free’
font, which is included in this package. ‘Font Awesome 6 Free’ font
files follow the [SIL OFL license](https://openfontlicense.org/) as
explained in their [website](https://fontawesome.com/license/free)
(accessed in 2024-01-18).

## Installation

### Installation from GitHub

Developmental version of `socialcap` can be directly installed from
GitHub by executing:

``` r
devtools::install_github("gaba-tope/socialcap")
```

### Loading the Package

After installation, you may load `socialcap` into R session with:

``` r
library(socialcap)
```

You are now ready to use `socialcap` to enhance your ggplot2
visualizations with social media information.

## Requirement

The returned string should be written in HTML language. In order to
apply the string into your plots, the following conditions should be
met:

- Package {ggtext} should be loaded.
- Package {ggplot2} should be loaded, and your plot should be made with
  `ggplot()`.
- The theme element of the caption should use ggtext elements
  (i.e. `plot.caption = element_textbox_simple()` or
  `plot.caption = element_textbox()`).

## Example

These are basic examples which show you how to use the function
`socialcap()`.

``` r
library(socialcap)
library(showtext)
#> Loading required package: sysfonts
#> Loading required package: showtextdb
library(ggplot2)
library(ggtext)

## basic example code
# Call socialcap function:
social_caption <- socialcap::socialcap(gitname = "gaba-tope", twitname = "@tope_ezia")
#> NOTE: text_font 'oswald' familiy is not loaded. Make sure the font family is loaded
#> before calling ggplot().
#> ------- Caption Generated -------
social_caption
#> [1] "<span style='color: #E30b5c;font-family:\"Font_Awesome_6_Brands_reg\";'>&#xf09b;</span> <span style='color: grey10; font-family:\"oswald\";'>gaba-tope</span> <span style='color: #E30b5c;font-family:\"Font_Awesome_6_Brands_reg\";'>&#xf099;</span> <span style='color: grey10; font-family:\"oswald\";'>@tope_ezia</span>"

# Caption for the Plot
data_caption <- "Data : My Own Data"
plot_caption <- paste(data_caption, "<br> Graphic:", social_caption)

# Apply to Plot
font_add_google(name = "Oswald", family = "oswald")
showtext_auto()

plot <- ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  geom_point() +
  labs(caption = plot_caption) +
  theme(plot.caption = element_textbox(size = 15,
                                       family = "oswald",
                                       hjust = 0)
        )

plot
```

<img src="man/figures/README-example-1.png" width="100%" />
