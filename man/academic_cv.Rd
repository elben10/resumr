% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/academic_cv.R
\name{academic_cv}
\alias{academic_cv}
\title{Academic looking resume}
\usage{
academic_cv(...)
}
\arguments{
\item{...}{Arguments to \code{rmarkdown::pdf_document}}
}
\value{
R markdown format to pass to \code{\link[rmarkdown:render]{render}}
}
\description{
Rmarkdown template for creating a nice looking resume adapted from
\href{http://www.rpi.edu/dept/arc/training/latex/resumes/}{Rensselaer Polytechnic Institute}.
}
\examples{
\dontrun{
rmarkdown::draft("MyCV.Rmd", template = "academic_cv", package = "resumr")
}
}
