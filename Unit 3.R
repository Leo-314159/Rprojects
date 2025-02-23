library(tidyverse)
library(palmerpenguins)
#Aesthetics using ggplot
penguins%>%
  ggplot(aes(x = body_mass_g, y = flipper_length_mm))

#To create a scatter plot we need to add another line of code geom. El + es vital
penguins%>%
  ggplot(aes(x=body_mass_g,y=flipper_length_mm))+
  geom_point()

#Usando '+' podemos mejorar la visualizacion del graph
#labs() se usa para cambiar los labels de los axis x y y el titulo del graph
penguins %>%
   ggplot(aes(x = body_mass_g, y = flipper_length_mm)) +
   geom_point() +
   labs(title = "Scatterplot of data on Palmer Archipeligo penguins",
          subtitle = "Relationship between body mass and flipper length",
          caption = "Figure 1: Scatterplot showing relationship between body mass and flipper length in Palmer Archipeligo penguins.",
          x = "Body mass (grams)",
          y = "Flipper length (mm)")

#Adding a regression line using '+' and stat_smooth()
penguins %>%
  ggplot(aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_point() +
  stat_smooth(method = "lm")

penguins %>%
  ggplot(aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_point() +
  labs(title = "Scatterplot of data on Palmer Archipeligo penguins",
       subtitle = "Relationship between body mass and flipper length",
       caption = "Figure 1: Scatterplot showing relationship between body mass and flipper length in Palmer Archipeligo penguins.",
       x = "Body mass (grams)",
       y = "Flipper length (mm)")+
  stat_smooth(method = "lm")

#Excersise 1 - using Penguins and bill length and bill width

penguins%>%
  ggplot(aes(x=bill_length_mm,y=bill_depth_mm))+
  geom_point()+
  labs(x = "Bill Length (mm)", y = "Bill Depth (mm)")+
  stat_smooth(method = "lm")

#Excercise 2 - Using Iris and Petal Length and Petal Width

iris%>%
  ggplot(aes(x = Petal.Length, y = Petal.Width))+
  geom_point()+
  labs(x = "Petal Length (mm)", y = "Petal Width (mm)")+
  stat_smooth (method = "lm")
