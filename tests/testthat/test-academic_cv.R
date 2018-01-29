# FROM rticles https://github.com/rstudio/rticles/blob/master/tests/testthat/test_formats.R

context("test-academic_cv.R")


test_that("academic_cv works", {

  # don't run on cran because pandoc is required
  skip_on_cran()

  # work in a temp directory
  dir <- tempfile()
  dir.create(dir)
  oldwd <- setwd(dir)
  on.exit(setwd(oldwd), add = TRUE)

  # create a draft of the format
  testdoc <- "testdoc.Rmd"
  rmarkdown::draft(testdoc,
                   pdf_file(),
                   create_dir = FALSE,
                   edit = FALSE)

  # render it
  output_file <- rmarkdown::render(testdoc)
  expect_true(file.exists(output_file))
})
