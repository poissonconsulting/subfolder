# creates system files for testss
library(subfoldr)
library(ggplot2)

rm(list = ls())

data2 <- data.frame(a = 3:4)
mtcars <- datasets::mtcars

main2 <- file.path("inst", "output")
sub2 <- file.path("first", "second")

save_table(data2, caption = "A table", main = main2, sub = sub2, ask = FALSE)
save_table(mtcars, report = FALSE, main = main2, sub = sub2, ask = FALSE)
save_table(mtcars, "mtcars2", main = main2, sub = sub2, ask = FALSE)
save_table(mtcars, "mtcars3", caption = "Another table", main = main2, sub = sub2, ask = FALSE)

save_data(data2, main = main2, sub = sub2, ask = FALSE)
save_data(mtcars, main = main2, sub = sub2, ask = FALSE)
save_data(mtcars, "mtcars2", main = main2, sub = sub2, ask = FALSE)
save_data(mtcars, "mtcars3", main = main2, sub = sub2, ask = FALSE)

sub2 <- file.path("first", "2nd", "third")

save_table(mtcars, "mtcars", report = FALSE, main = main2, sub = sub2, ask = FALSE)
save_table(datasets::ToothGrowth, "TG", main = main2, sub = sub2, ask = FALSE)

save_data(mtcars, "mtcars", main = main2, sub = sub2, ask = FALSE)
save_data(datasets::ToothGrowth, "TG", main = main2, sub = sub2, ask = FALSE)

template_2 <- "model{
do stuff
}
"
save_template(template_2, main = main2, sub = sub2, ask = FALSE)

open_window()
print(ggplot(data = datasets::mtcars, aes(x = cyl, y = mpg)) + geom_point())

save_plot("cyl_mpg", caption = "a fine plot", main = main2, sub = sub2, ask = FALSE)

p1 <- ggplot2::qplot(data = mtcars, mpg, binwidth = 1)
p2 <- ggplot2::qplot(data = mtcars, mpg, binwidth = 3)
v1 <- grid::viewport(width = 0.5, height = 0.5, x = 0, y = 1, just = c("left", "top"))
v2 <- grid::viewport(width = 1, height = 0.5, x = 0.5, y = 0.5, just = c("left", "top"))
save_multiplot("mtcars_multi", main = main2, sub = sub2, ask = FALSE, plot = list(p1, p2), vp = list(v1, v2))
