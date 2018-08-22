library(tidyverse) #carga de paquetes que se van a utilizar 
library(dplyr)

BD<- full_join(species, parks)  #se unen ambas bases de datos
View(BD)

CatSum<- BD %>% select("Scientific Name", "Family", "Park Name", "Order", "Category", "Conservation Status") %>%  group_by(Category) %>% summarize(n= n())
View(CatSum)    
#Se seleccionan las columnas con las que se trabajaran y se pide que se agrupen por categoria
#para saber cuantas observaciones hay por la categoria.

sum<- BD %>% select("Spp", "Family", "Park.name", "Order", "Category", "Con.status")
View(sum)   
#Resumen (summary) de las columnas que se usaran de la base de datos (BD) para trabajar

BD<- BD %>% rename(Spp= `Scientific Name`)
BD<- BD %>% rename(Park.name= `Park Name`, Nombre.comun= `Common Names`)
BD<- BD %>% rename(Con.status= `Conservation Status`)
View(BD)
#Se le cambio el nombre a "Scientific Name" por que R tiene problemas con los nombres con espacio

Fam<- BD %>% select("Spp", "Family", "Park.name", "Order", "Category", "Con.status") %>%  
  group_by(Family) %>% summarize(N= n_distinct(Spp))

View(Fam)

# Selecciona las columnas a trabajar, luego agrupa los datos por familia y entrega el numero de especies por familia




##################### Existen especies que estan en mas de una categoria ###################################
Fam<- BD %>% select("Spp", "Family", "Park Name", "Order", "Category", "Conservation Status") %>%  
  group_by(Family) %>% summarize(N= n_distinct(Category)) %>% filter(N != 1)

View(Fam)
############################################################################################################


