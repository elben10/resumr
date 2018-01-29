context("test-academic_cv.R")

test_that("multiplication works", {
  skip_on_appveyor()
  skip_on_cran()
  skip_on_travis()
  dir <- tempfile()
  dir.create(dir)
  oldwd <- setwd(dir)
  on.exit(setwd(oldwd), add = TRUE)

  # create a draft of the format
  testdoc <- "testdoc.Rmd"
  rmarkdown::draft(testdoc,
                   system.file("rmarkdown", "templates", "academic_cv",
                               package = "resumr"),
                   create_dir = FALSE,
                   edit = FALSE)
  output_file <- rmarkdown::render(testdoc)
  expect_true(file.exists(output_file))
})
