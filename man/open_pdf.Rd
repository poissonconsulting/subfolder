% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pdf.R
\name{open_pdf}
\alias{open_pdf}
\title{Open a pdf}
\usage{
open_pdf(x, width = 6, height = width, sub = get_sub(),
  main = get_main(), ask = getOption("subfoldr.ask", TRUE), ...)
}
\arguments{
\item{x}{A string of the name of the file to create.}

\item{width}{A number indicating the width in inches.}

\item{height}{A number indicating the height in inches.}

\item{sub}{A string of the path to the directory to save the object.}

\item{main}{A string of the main subfolder.}

\item{ask}{A string indicating whether to ask before creating a sub directory.}

\item{...}{Additional arguments passed to pdf}
}
\description{
Open a pdf
}
