% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/present_table.R
\name{present_table}
\alias{present_table}
\title{Present a stylish table}
\usage{
present_table(data, measure, caption)
}
\arguments{
\item{data}{The data set to be formatted}

\item{measure}{The measure chosen for the heading of the table as a character vector, can be \code{"cases"} or \code{"deaths"}}

\item{caption}{The desired caption for the table entered as a character string.}
}
\value{
A formatted kable of the original data set entered
}
\description{
Creates a formatted and styled table to display COVID19 data using the kableExtra package
}
