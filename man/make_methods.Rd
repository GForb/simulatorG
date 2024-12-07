% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make_methods.R
\name{make_methods}
\alias{make_methods}
\title{make_methods
Create  a list of method objects for use with the simulator package}
\usage{
make_methods(methods, labels = methods)
}
\arguments{
\item{methods}{A list containing the methods to be made}

\item{labels}{A list containing the labels for each method. If empty defaults to method names.}
}
\value{
Function returns a list of method objects
}
\description{
make_methods
Create  a list of method objects for use with the simulator package
}
\examples{
make_methods(list(example), list("this is an example method"))
}
