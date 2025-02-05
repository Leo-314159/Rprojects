test_dataset <- read_csv(student_performance)
library(tidyverse)
test_dataset <- read.csv(student_performance.csv)
getwd()
test_dataset <- read.csv(C:\Users\leogo\Desktop\Proyectos\R\Practicas\student_performance.csv)
test_dataset <- read.csv("student_performance.csv")
test_dataset
test_dataset <- read_csv("student_performance.csv")
test_dataset
write_csv(iris,"iris_copy.csv")
number_feet <- 6
number_inches <- 1
height_in_inches <- number_feet * 12 + number_inches
height_in_inches
my_brothers <- 3
# my_brothers <- 1
# my_sisters <- 1
my_sisters <- 2
my_brothers + my_sisters
big_vector <- c(1:100)
sum(big_vector)
mean(big_vector)
num_vector <- c(42,3.141,99,1234)
median(num_vector)
number <- c(10, 11, 12, 13)
letter <- c("A", "B", "C", "D")
status <- c(TRUE, FALSE, TRUE, TRUE)
my_data_frame <- data.frame(number, letter, status)
my_data_frame[3,1]
view(test_dataset)
numeric_vector <- c(1:10)
mean(sqrt(numeric_vector))
numeric_vector %>% sqrt () %>% mean
str(penguins)
library(palmerpenguins)
str(penguins)
penguins %>%
  filter (species == "Chinstrap")
1 == 1
#Filtering all setosa data
iris %>%
  filter(Species == "setosa")
view(iris)
iris %>%
  filter(Species != "versicolor")
iris %>%
  filter(Petal.Length <= 1.4)
iris %>%
  filter(Petal.Length >= 1.5 & Species == "setosa")
iris %>%
  filter (Petal.Length > 5 & Species != "versicolor")%>%
  filter (Species != "virginica")
