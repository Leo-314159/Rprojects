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
library(tidyverse)
library(penguins)
library(palmerpenguins)
print(palmerpenguins,10)
library(palmerpenguins)
print(palmerpenguins)
library("palmerpenguins")
print("palmerpenguins")
print(penguins)
#Missing values in R
mean(penguins$body_mass_g)
#missing values will result in NA when doing math ops
mean(penguins$body_mass_g, na.rm = TRUE)
#Funcion na.rm remueve los NA de la columna
penguins %>%
filter(!is.na(body_mass_g))
#filtrando los NA fuera de la columna
penguins%>%
  filter(is.na(body_mass_g))
#filtra los que si son NA ^
penguins%>%
  group_by(species)%>%
  summarise(mean_body_mass = mean(body_mass_g,na.rm =TRUE))
#Using summarise and group_by ^

penguins%>%
  filter(!is.na(body_mass_g))%>%
  group_by(species) %>%
  summarise(mean_body_mass = mean(body_mass_g),
            sd_body_mass = sd(body_mass_g),
            sample_size = n())
#Summarising the same coulumn using different statistics ^
#Arriba solo debemos agregar mas tipos en group_by y nos deja summarise diferentes tipos

#Ejercicios

#Using group_by() and summarise(), calculate the mean and standard deviation for bill length, as well as the sample size, for combination of sex and year. Ensure that you handle data points with missing data for bill length properly.

penguins%>%
  filter(!is.na(bill_length_mm))%>%
  group_by(sex,year)%>%
  summarise(mean_bill_length = mean(bill_length_mm),
            sd_bill_length = sd(bill_length_mm),
            sample_size =n())

#Using the iris dataset that comes built-in with R, calculate the mean petal length and median petal width for each of the three iris species using group_by() and summarise().

iris%>%
  filter(!is.na(Petal.Length & Petal.Width))%>%
  group_by(Species)%>%
  summarise(mean_petal_length = mean(Petal.Length),
            median_petal_width = median(Petal.Width))

#Selecting columns by their names
penguins%>%
  select(species, sex, body_mass_g)

#Removing columns using '-'

penguins %>%
  select(-island, -flipper_length_mm, -sex)

#Using starts_with(), ends_with() and contains()

#Keep only columns whose names starts with 'bill'
penguins%>%
  select(starts_with("bill"))

#Keep only columns whose name ends with "mm"
penguins %>%
  select(ends_with("mm"))

#Keep only columns whose name contains an underscore
penguins%>%
  select(contains("_"))

#Using arrange()
penguins%>%
  select(species,sex,body_mass_g)%>%
  arrange(body_mass_g)

#Arranging multiple columns
penguins%>%
  select(species,sex,body_mass_g)%>%
  arrange(sex,body_mass_g)

#Arranging data in descending order
penguins%>%
  select(species,sex,body_mass_g)%>%
  arrange(desc(body_mass_g))

#Using mutate()
penguins%>%
  mutate(penguin_ID = 1:n())%>%
  print(width = Inf)

#Adding a new column and modifying existing ones - using select() to discard some columns
penguins %>%
  mutate(log_body_mass = log(body_mass_g),
         flipper_length_cm = flipper_length_mm/10,
         bill_area = bill_length_mm*bill_depth_mm)%>%
  select(species,sex,log_body_mass,flipper_length_cm,bill_area)

#Changing an existing column
penguins%>%
  mutate(year = as.factor(year))

#Using replace()
penguins%>%
  mutate(bill_length_mm = replace(bill_length_mm,bill_length_mm>40,99))

#Replacing NA but first converting to character
penguins %>% 
  mutate(
    sex = as.character(sex),
    sex = replace(sex, is.na(sex), "Unknown"))
#Exercises

#For the iris data built in to R, use select() to get a data frame that only contains the species and the petal length.
iris%>%
  select(Species, Petal.Length)

#Using select() and starts_with(), select the two columns from iris that relate to the petals.
iris%>%
  select(starts_with("petal"))

#Using select() and ends_with(), select the two columns from iris that relate to width.
iris%>%
  select(ends_with("width"))

#Using arrange(), sort the iris dataset in order of petal length, from largest in the first row to smallest in the last row.
iris%>%
  select(Petal.Length)%>%
  arrange(desc(Petal.Length))


#Using mutate(), create a new column in iris called petal_area by multiplying petal length and width together, and another new column sepal_ratio which is equal to sepal length divided by sepal width.
iris%>%
  mutate(petal_area = Petal.Length*Petal.Width, sepal_ratio = Sepal.Length/Sepal.Width)

#create a new column for log biill lengths
penguins%>%
  mutate(log_bill_length = log(bill_length_mm))%>%
select(log_bill_length)


#The year column contains the values 2007, 2008, or 2009. Using mutate() and replace(), modify the year column so that instead of 2007 it now says Year 1, instead of 2008 it says Year 2, and instead of 2009 it says Year 3.
penguins%>%
  mutate(year = replace(year,year == 2007,1))


#Quiz 2 - calculate the mean petal length for 'versicolor'
iris%>%
  group_by(Species)%>%
summarise(mean_petal_length = mean(Petal.Length))
