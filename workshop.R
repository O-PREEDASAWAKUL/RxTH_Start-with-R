# install package 
install.packages(c("dplyr","ggplot2","readxl","tidyverse"))

library(dplyr)
library(ggplot2)
library(readxl)
library(tidyverse)

# A function
sample(x = 1:20, size = 2)
sample(1:20,2)


# The pipe
# Convert to data frame 
starwars = starwars |> 
  select(name,height,mass,hair_color,skin_color,species)|> 
  as.data.frame()
starwars

# Dimension 
starwars |> dim()
dim(starwars)

# ---- Cleaning data ----
# Counting missing value
starwars |> 
  is.na() |> 
  sum()
sum(is.na(starwars))


# Remove NA
starwars = starwars |> 
  drop_na()
starwars = starwars |> 
  drop_na()


# summary()
starwars |> 
  summary()

summary(starwars)

# summarise()

starwars |> 
  summarise(mean(height))

starwars |> 
  summarise(mean_Height = mean(height))

# across()
starwars |> 
  summarise(across(c(height,mass),
                   list(sd,mean)))

# group_by()
starwars |> 
  group_by(species) |> 
  summarise(n())

# select()
starwars |> 
  select(name, species) 

# filter
starwars |> 
  filter(species == "Human")

starwars |> 
  select(name,species,height) |> 
  filter(height > 200)

# arrange()
starwars |> 
  arrange(mass) |> 
  select(name, height, mass, species) |> 
  head(6)

starwars |> 
  arrange(desc(mass)) |> 
  select(name, height, mass, species) |> 
  head(6)

# Assignment operator

starwars = starwars |> 
  mutate(BMI = mass/(height/100)^2)

starwars |> 
  summarise(mean(BMI))

starwars |> 
  filter(height>200) |> 
  select(name, BMI)


