% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/md.R
\name{md_templates}
\alias{md_templates}
\title{Markdown Templates}
\usage{
md_templates(sub = get_sub(), main = get_main(),
  report = get_report(), headings = list(character(0)),
  drop = list(character(0)), nheaders = 0L, header1 = 3L,
  locale = "en", ask = getOption("subfoldr.ask", TRUE))
}
\arguments{
\item{sub}{A string of the path to the subfolders to save the object (by default = "").}

\item{main}{A string of the main subfolder.}

\item{report}{A string indicating the report folder to copy the csv files.}

\item{headings}{A list of named character vectors.}

\item{drop}{A list of character vectors specify the subfolders to drop.}

\item{nheaders}{An count of the number of headings to assign headers to.}

\item{header1}{A count of the heading level for the first header.}

\item{locale}{A string of the locale.}

\item{ask}{A string indicating whether to ask before creating a sub directory.}
}
\value{
A string of the report templates in markdown format ready for inclusion in a report.
}
\description{
Returns a string of templates in markdown format ready for inclusion in a report.
}
