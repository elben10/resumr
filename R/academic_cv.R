#' Academic looking resume
#'
#' Rmarkdown template for creating a nice looking resume adapted from
#' \href{http://www.rpi.edu/dept/arc/training/latex/resumes/}{Rensselaer Polytechnic Institute}.
#' @export
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R markdown format to pass to \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyCV.Rmd", template = "academic_cv", package = "resumr")
#' }
academic_cv <- function(...) {
  template <- pdf_file("resources", "template.tex")
  file.copy(pdf_file("skeleton", "res.cls"), ".")
  knit_engines$set(section = section)
  inherit_pdf_document(..., template = template)
}

section <- function(options) {
  title <- if(is.null(options$title)) "" else options$title
  subtitle <- if(is.null(options$subtitle)) "" else options$subtitle
  date <- if(is.null(options$date)) "" else options$date
  subdate <- if(is.null(options$subdate)) "" else options$subdate


  l1 <- ""
  l2 <- ""
  if (any(c(title, date) != "")) {
    l1 <- sprintf("%s\\null\\hfill %s", title, date)
  }

  if (any(c(subtitle, subdate) != "")) {
    l1 <- paste0(l1, "\\\n")
    l2 <- sprintf("%s\\null\\hfill %s", subtitle, subdate)
  }

  l3 <- ifelse(isTRUE(options$break_sections), "\n\n", "\\\n")
  l4 <- paste0(options$code, collapse = "\n")
  if(is.null(options$code)) {
    paste0(l1, l2, "\\\n", collapse = "\n")
  } else {
    paste0(l1, l2, l3, l4, collapse = "\n")
  }
}

md_to_tex <- function(str) {
  tmp <- tempfile(fileext = ".md")
  write(str, tmp)
  res <- system2("pandoc", args = sprintf("%s --to latex --listings", as.character(tmp)), stdout = TRUE)
  res <- paste0(res, collapse = "\n")
  unlink(tmp)
  res
}

pdf_file <- function(...) {
  system.file("rmarkdown", "templates", "academic_cv", ..., package = "resumr")
}

inherit_pdf_document <- function(...) {
  fmt <- rmarkdown::pdf_document(...)
  fmt$inherits <- "pdf_document"
  fmt
}
