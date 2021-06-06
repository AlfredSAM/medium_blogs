# Test multi threads for xgboost

require(xgboost)
x <- matrix(rnorm(100 * 10000), 10000, 100)
y <- x %*% rnorm(100) + rnorm(1000)

system.time({
  bst <- xgboost(
    data = x, label = y, nthread = 1,
    nround = 100, verbose = F
  )
})

system.time({
  bst <- xgboost(
    data = x, label = y, nthread = 4,
    nround = 100, verbose = F
  )
})


system.time({
  bst <- xgboost(
    data = x, label = y, nthread = 8,
    nround = 100, verbose = F
  )
})

# Test ggplot2
# Libraries
library(ggplot2)
library(dplyr)

# The dataset is provided in the gapminder library
library(gapminder)
data <- gapminder %>%
  filter(year == "2007") %>%
  dplyr::select(-year)

# Most basic bubble plot
data %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  ggplot(aes(x = gdpPercap, y = lifeExp, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_size(range = c(.1, 24), name = "Population (M)")
