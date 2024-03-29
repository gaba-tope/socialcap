% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/socialcap.R
\name{socialcap}
\alias{socialcap}
\title{Enhances ggplot2 Visualizations with Social Media Handles and Icons via ggtext}
\usage{
socialcap(
  gitname = "",
  twitname = "",
  facebkname = "",
  linkedname = "",
  discdname = "",
  iconcol = "#E30b5c",
  textcol = "grey10",
  textfont = "oswald"
)
}
\arguments{
\item{gitname}{Username of Github Repository in string}

\item{twitname}{Username of Twitter in string}

\item{facebkname}{Username of Facebook in string}

\item{linkedname}{Username of LinkedIn in string}

\item{discdname}{Username of Discord in string}

\item{iconcol}{Color code for social media icon in string}

\item{textcol}{Color code for username text in string}

\item{textfont}{Font family for username text in string. Font with this family name should have been loaded in advance.}
}
\value{
A string of social media icon and username in HTML format.
}
\description{
\code{socialcap()} returns your social media info in string.
The returned string is to be an argument to \code{caption} parameter of \code{labs()} for ggplot2 system.
Currently, github, twitter, facebook, linkedin, discord accounts are supported for now.
}
\details{
The returned string should be in its Markdown/HTML/CSS language. In order to apply the string into your plots,
the following conditions should be met:
\itemize{
\item Package {ggtext} should be loaded.
\item Package {ggplot2} should be loaded, and your plot should be made with \code{ggplot()}.
\item The theme element of the caption should be \code{plot.caption = element_textbox_simple()} or \code{plot.caption = element_textbox()}.
}
}
