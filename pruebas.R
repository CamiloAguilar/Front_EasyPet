shiny::runApp("Front_ProPet", launch.browser = TRUE)


setwd("./Front_ProPet")
breed <- read.csv("./files/dog_breed.csv")
class(breed$breed[1]); breed$breed[1]

finder <- read.csv("./files/razas_clasificador con productos.csv")

finder[which(finder$index == (breed$breed[1])),1]


## Variables de entorno
prod_pet <- c('individual', 'a_bordo', 'llavero')
len_arnes <- list.files("./images/arnes")
len_collarDog <- list.files("./images/collar_perro")
len_collarCat <- list.files("./images/collar_gato")
len_pechera <- list.files("./images/pechera")
len_portabolsas <- list.files("./images/porta_bolsas")
len_trailla <- list.files("./images/trailla")



folder <- as.character(finder[which(finder$breed == as.character(breed$breed[1])), 6])
folder

switch(folder,
       arnes = {aleatorio = sample(len_arnes, 1)},
       trailla = {aleatorio = sample(len_trailla, 1)},
       collarperro = {aleatorio = sample(len_collarDog, 1)},
       collargato = {aleatorio = sample(len_collarCat, 1)},
       pechera = {aleatorio = sample(len_pechera, 1)},
       porta_bolsas = {aleatorio = sample(len_portabolsas, 1)}
)
aleatorio

## La columna 4 nos da la raza homologada
file <- ifelse(folder %in% prod_pet, as.character(finder[which(finder$breed == as.character(breed$breed[1])), 4]),
               unlist(strsplit(aleatorio, "\\."))[1])
file

src = paste0("./images/", folder, "/", file, ".jpg")
src
