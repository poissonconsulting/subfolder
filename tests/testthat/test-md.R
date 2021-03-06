context("md")

test_that("md_files works", {
  main <- file.path(system.file(package = "subfoldr"), "output")

  files <- md_files(headings = list(character(0)),
                    drop = list(character(0), character(0), "data2"),
                    main = main, sub = "", nheaders = 1L, header1 = 3L, locale = "en", class = "tables",
                    is_report = TRUE)

  files <- names(files)

  expect_identical(files, c("### First", "", ""))

  files <- md_files(headings = list(character(0)),
                    drop = list(character(0), character(0), "data2"),
                    main = main, sub = "", nheaders = 2L, header1 = 4L, locale = "en", class = "tables",
                    is_report = TRUE)

  files <- names(files)

  expect_identical(files, c("#### First\n##### 2nd", "##### Second", ""))

  files <- md_files(headings = list(character(0), c("second" = "Word 2", "2nd" = "Letter 2")),
                    drop = list(character(0), character(0), "data2"),
                    main = main, sub = "", nheaders = 2L, header1 = 4L, locale = "en", class = "tables",
                    is_report = TRUE)

  files <- names(files)

  expect_identical(files, c("#### First\n##### Word 2", "", "##### Letter 2"))
})

test_that("md_transfers works", {
  main <- file.path(system.file(package = "subfoldr"), "output")

  transfers <- md_transfers(headings = list(character(0)), drop = list(character(0)), main = main,
               sub = "first/second", report = "report", locale = "en", class = "tables", is_report = NA)

  expect_identical(length(transfers), 4L)
  expect_match(transfers[1], "output/tables/first/second/data2.csv$")
  expect_identical(names(transfers[1]), "report/tables/first/second/data2.csv")
})

test_that("md_tables works", {
  main <- file.path(system.file(package = "subfoldr"), "output")

  md_tables <- md_tables(headings = list(character(0), c("second" = "Word 2", "2nd" = "Letter 2")),
                         drop = list(character(0), character(0), "data2"),
                         main = main, report = NULL, locale = "en")

  expect_identical(checkr::check_string(md_tables), md_tables)
})

test_that("md_templates works", {
  main <- file.path(system.file(package = "subfoldr"), "output")

  reset_template_number()

  md_templates <- md_templates(headings = list(character(0), c("second" = "Word 2", "2nd" = "Letter 2")),
                               drop = list(character(0), character(0), "data2"),
                               main = main, report = NULL, nheaders = 1L, locale = "en")

  expect_identical(md_templates, "### First\n```\n.\nmodel{\ndo stuff\n}\n\n..\n```\nTemplate 1. \n")

  md_templates <- md_templates(headings = list(character(0), c("second" = "Word 2", "2nd" = "Letter 2")),
                               drop = list(character(0), character(0), "data2"),
                               nheaders = 2L,
                               main = main, report = NULL, locale = "en")

  expect_identical(md_templates, "### First\n#### Letter 2\n```\n.\nmodel{\ndo stuff\n}\n\n..\n```\nTemplate 2. \n")
})

test_that("md_plots works", {
  main <- file.path(system.file(package = "subfoldr"), "output")

  md_plots <- md_plots(headings = list(character(0), c("second" = "Word 2", "2nd" = "Letter 2")),
                       drop = list(character(0), character(0), "data2"),
                       main = main, report = NULL, nheaders = 1L, locale = "en")

  expect_match(md_plots, "^### First\n\n<figure>\n<img alt = \"")
  expect_match(md_plots, "first/2nd/third/cyl_mpg.png\" width = \"100%\">\n<figcaption>Figure 1. a fine plot.</figcaption>\n</figure>")

  md_plots3 <- md_plots(headings = list(character(0), c("second" = "Word 2", "2nd" = "Letter 2")),
                       drop = list(character(0), character(0), "data2"),
                       main = main, report = NULL, nheaders = 3L, locale = "en")

  expect_match(md_plots3, "### First\n#### Letter 2\n##### Third\n\n<figure>\n<img alt = \"")
})

test_that("md_table works", {
  main <- file.path(system.file(package = "subfoldr"), "output")

  reset_table_number()

  expect_identical(md_table("data3", main = main, sub = "first/second", report = NULL), "")

  expect_identical(md_table("data2", "New Table", main = main, sub = "first/second", report = NULL),
                   "\n\nTable 1. New Table.\n\n|  a|\n|--:|\n|  3|\n|  4|\n")

  expect_identical(md_table("data2", main = main, sub = "first/second", report = NULL),
                   "\n\nTable 2. A table.\n\n|  a|\n|--:|\n|  3|\n|  4|\n")
})

test_that("md_plot works", {
  main <- file.path(system.file(package = "subfoldr"), "output")

  reset_plot_number()

  expect_identical(md_plot("cyl_mpg2", main = main, sub = "first/2nd/third", report = NULL), "")

  expect_identical(md_plot("cyl_mpg", "New Plot", main = main, sub = "first/2nd/third", report = NULL),
                   "\n\n<figure>\n<img alt = \"plots/first/2nd/third/cyl_mpg.png\" src = \"plots/first/2nd/third/cyl_mpg.png\" title = \"plots/first/2nd/third/cyl_mpg.png\" width = \"100%\">\n<figcaption>Figure 1. New Plot.</figcaption>\n</figure>")
})

test_that("md_template works", {
  main <- file.path(system.file(package = "subfoldr"), "output")

  expect_identical(md_template("template", main = main, sub = "first/2nd/third", report = NULL), "")

  expect_identical(md_template("template_2", "New Plot", main = main, sub = "first/2nd/third", report = NULL),
                   "\n```\n.\nmodel{\ndo stuff\n}\n\n..\n```\nTable 3. New Plot.\n")
})

