library(tidyverse)

data(mtcars)
summary(mtcars)

glimpse(mtcars)

mtcars %>%
  select(cyl, mpg) %>%
  summarise(av_cyl = mean(cyl), sd_cyl = sd(cyl))

mtcars %>%
  group_by(vs) %>%
  summarise(mean(mpg))