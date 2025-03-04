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

library(tidyverse)
library(palmerpenguins)
#Addin colour to the graph

penguins %>%
  ggplot(aes(x = body_mass_g,
             y = flipper_length_mm,
             colour = sex)) +
  geom_point()

#Reemplazando los valores 'na' en el dataset
#Usando mutate para renombrarlos como unknown
penguins %>% 
  mutate(sex = as.character(sex),
         sex = replace(sex, is.na(sex), "Unknown")) %>% 
  ggplot(aes(x = body_mass_g, 
             y = flipper_length_mm,
             colour = sex)) + 
  geom_point()

#Usando filter para removerlos
penguins %>% 
  filter(!is.na(sex)) %>% 
  ggplot(aes(x = body_mass_g, 
             y = flipper_length_mm,
             colour = sex)) + 
  geom_point()


#Separando los graficos por especies usando 'facet_grid'
penguins %>% 
  ggplot(aes(x = body_mass_g, 
             y = flipper_length_mm,
             colour = sex)) + 
  geom_point() + 
  facet_grid(~ species)

#Lo mismo de arriba pero abora le agregamos la variable de año a facet grid
penguins %>% 
  ggplot(aes(x = body_mass_g, 
             y = flipper_length_mm,
             colour = sex)) + 
  geom_point() + 
  facet_grid(year ~ species)

#Adding shape to the different data points with 'shape'
penguins %>% 
  ggplot(aes(x = body_mass_g, 
             y = flipper_length_mm, 
             shape = sex,
             colour = species)) + 
  geom_point() 

#If we want to see a full list of avaliable colour palettes
#we need to code '?scale_colour_brewer()'
?scale_color_brewer

#Adding colour to the graph using 'scale_colour_brewer()'
penguins %>% 
  ggplot(aes(x = body_mass_g, 
             y = flipper_length_mm, 
             shape = sex,
             colour = species)) + 
  geom_point() +
  scale_colour_brewer(palette = "Set3")

#Podemos agregar temas usando 'theme()'
#hay diferentes 'theme_minimal()' 'theme_classic()' 'theme_bw()' etc
penguins %>% 
  ggplot(aes(x = body_mass_g, 
             y = flipper_length_mm,
             colour = sex)) + 
  geom_point() + 
  facet_grid(~ species) + 
  theme_linedraw()

#Excersise 1
penguins%>%
  filter(species == "Chinstrap")%>%
  ggplot(aes(x=bill_length_mm, y=bill_depth_mm,colour=sex))+
  geom_point()+
  scale_colour_brewer(palette = "Set1")+
  theme_minimal()

#Excersie 2
penguins%>%
  filter(!is.na(sex))%>%
  ggplot(aes(x=flipper_length_mm, y=bill_length_mm,colour=species))+
  geom_point()+
  scale_colour_brewer(palette = "Spectral")+
  theme_linedraw()+
  facet_grid(~sex)

#Using boxplots graphs
penguins %>%
  ggplot(aes(x = species, y = body_mass_g)) +
  geom_boxplot()


#Addin a beeswarm to the boxplot - alpha 0.7 means opacity 70%
install.packages("ggbeeswarm")
library(ggbeeswarm)

penguins %>%
  ggplot(aes(x = species, y = body_mass_g)) +
  geom_boxplot(outlier.shape = NA) +
  geom_beeswarm(alpha = 0.7, colour = "tomato")

#Multipanel graph - note fill in the boxplot
penguins %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = sex, y = body_mass_g)) +
  geom_boxplot(fill = "skyblue", outlier.shape = NA) +
  geom_beeswarm(alpha = 0.5) +
  facet_grid(year ~ species) +
  labs(caption = "Figure 1: Boxplot showing differences in body mass between sex, species, and years in the Palmer penguins dataset.",
       x = "Sex",
       y = "Body mass (grams)")

#Agrupando por especie - usamos 'fill' para colorear las boxes
penguins %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = sex, y = body_mass_g, fill = species)) +
  geom_boxplot() +
  facet_grid(~ year) 

library(tidyverse)
library(palmerpenguins)

#Making Boxplots
penguins %>%
  ggplot(aes(x = species, y = body_mass_g)) +
  geom_boxplot()

library(ggbeeswarm)

#Grouped boxplot + beeswarm using geom_point() instead of geom_beeswarm
penguins %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = sex, y = body_mass_g, fill = species)) +
  geom_boxplot(outlier.shape = NA, 
               position = position_dodge(width = 0.8)) +
  geom_point(aes(group = species), 
             alpha = 0.7,
             position = position_jitterdodge(dodge.width = 0.8, jitter.width = 0.2)) + 
  facet_grid( ~ year) 
