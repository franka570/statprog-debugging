# 4)
install.packages("palmerpenguins")
library(palmerpenguins)
head(penguins)

library(tidyverse)
adeline <- penguins %>% filter(species == "Adelie")
library(ggplot2)
ggplot(adeline, aes(x=bill_length_mm, y=bill_depth_mm)) +
  geom_point() +
  labs(title="Bill Length vs. Bill Depth for Adelie Penguins",
       x="Bill Length (mm)",
       y="Bill Depth (mm)")


penguins %>%
  group_by(species) %>%
  summarise(mean_bill_length = mean(bill_length_mm, na.rm=TRUE),
             median_bill_length = median(bill_length_mm, na.rm=TRUE),
             sd_bill_length = sd(bill_length_mm, na.rm=TRUE))

penguins %>% pivot_longer(cols = c(bill_length_mm, bill_depth_mm,
                                   flipper_length_mm, body_mass_g),
                          names_to = "feature",
                          values_to = "value") %>%
  ggplot(aes(x=species, y = value)) +
  geom_boxplot() +
  facet_wrap(~ feature, scales="free_y") +
  labs(title="Boxplots of Penguin Features by Species",
       x="Species",
       y="Value")

