#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer({
  function(input, output, session) {
    
    ## Variables de entorno
    col_fichero = 1 ## Columna para buscar nombre fichero
    col_finder = 'index' ## Columna en finder para buscar imagenes en carpeta
    
    ## Variables para identificar productos y sus imágenes
    prod_pet <- c('individual', 'a_bordo', 'llavero', 'prod_especial')
    len_arnes <- list.files("./images/arnes")
    len_trailla <- list.files("./images/trailla")
    len_collarDog <- list.files("./images/collar_perro")
    len_collarCat <- list.files("./images/collar_gato")
    len_pechera <- list.files("./images/pechera")
    len_portabolsas <- list.files("./images/porta_bolsas")
    len_mono <- list.files("./images/monos") #************
    len_cepillo <- list.files("./images/cepillo")
    len_individual_gato <- list.files("./images/individual_gato")
    len_llavero_gato <- list.files("./images/llavero_gato")
    len_abordo_gato <- list.files("./images/a_bordo_gato")
    len_placa <- list.files("./images/placa")
    
    
    breed <- reactiveFileReader(
      intervalMillis = 4000,
      session = session,
      filePath = './files/dog_breed.csv',
      readFunc = read.csv
    ) 
    
    finder <- reactiveFileReader(
      intervalMillis = 100000,
      session = session,
      filePath = './files/razas_clasificador con productos.csv',
      readFunc = read.csv
    )
    
    #******************************************
    # image1 sends pre-rendered images
    #******************************************
    output$image1 <- renderImage({
      
      ## La columna 5 nos da el producto 1
      folder1 <- as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), 5])
      
      switch(folder1,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collar_perro = {aleatorio = sample(len_collarDog, 1)},
             collar_gato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)},
             monos = {aleatorio = sample(len_mono, 1)},
             cepillo = {aleatorio = sample(len_cepillo, 1)},
             individual_gato = {aleatorio = sample(len_individual_gato, 1)},
             llavero_gato = {aleatorio = sample(len_llavero_gato, 1)},
             a_bordo_gato = {aleatorio = sample(len_abordo_gato, 1)},
             placa = {aleatorio = sample(len_placa, 1)}
             
      )
      
      ## La columna 4 nos da la raza homologada
      file1 <- ifelse(folder1 %in% prod_pet, 
                      as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder1, "/", file1, ".jpg"),
        filetype = "image/jpeg",
        alt = paste0("./images/", folder1, "/", file1, ".jpg"),
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
    
    #******************************************
    # image2 sends pre-rendered images
    #******************************************
    output$image2 <- renderImage({
      
      ## La columna 6 nos da el producto 2
      folder2 <- as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), 6])
      
      switch(folder2,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collar_perro = {aleatorio = sample(len_collarDog, 1)},
             collar_gato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)},
             monos = {aleatorio = sample(len_mono, 1)},
             cepillo = {aleatorio = sample(len_cepillo, 1)},
             individual_gato = {aleatorio = sample(len_individual_gato, 1)},
             llavero_gato = {aleatorio = sample(len_llavero_gato, 1)},
             a_bordo_gato = {aleatorio = sample(len_abordo_gato, 1)},
             placa = {aleatorio = sample(len_placa, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file2 <- ifelse(folder2 %in% prod_pet, 
                      as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder2, "/", file2, ".jpg"), 
        filetype = "image/jpeg",
        alt = paste0("./images/", folder2, "/", file2, ".jpg"),
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
    
    #******************************************
    # image3 sends pre-rendered images
    #******************************************
    output$image3 <- renderImage({
      
      ## La columna 7 nos da el producto 3
      folder3 <- as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), 7])
      
      switch(folder3,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collar_perro = {aleatorio = sample(len_collarDog, 1)},
             collar_gato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)},
             monos = {aleatorio = sample(len_mono, 1)},
             cepillo = {aleatorio = sample(len_cepillo, 1)},
             individual_gato = {aleatorio = sample(len_individual_gato, 1)},
             llavero_gato = {aleatorio = sample(len_llavero_gato, 1)},
             a_bordo_gato = {aleatorio = sample(len_abordo_gato, 1)},
             placa = {aleatorio = sample(len_placa, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file3 <- ifelse(folder3 %in% prod_pet, 
                      as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder3, "/", file3, ".jpg"), 
        filetype = "image/jpeg",
        alt = paste0("./images/", folder3, "/", file3, ".jpg"),
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
    
    #******************************************
    # image4 sends pre-rendered images ####
    #******************************************
    output$image4 <- renderImage({
      
      ## La columna 8 nos da el producto 4
      folder4 <- as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), 8])
      
      switch(folder4,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collar_perro = {aleatorio = sample(len_collarDog, 1)},
             collar_gato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)},
             monos = {aleatorio = sample(len_mono, 1)},
             cepillo = {aleatorio = sample(len_cepillo, 1)},
             individual_gato = {aleatorio = sample(len_individual_gato, 1)},
             llavero_gato = {aleatorio = sample(len_llavero_gato, 1)},
             a_bordo_gato = {aleatorio = sample(len_abordo_gato, 1)},
             placa = {aleatorio = sample(len_placa, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file4 <- ifelse(folder4 %in% prod_pet, 
                      as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder4, "/", file4, ".jpg"), #"./images/arnes/ARNES_002.jpg",
        filetype = "image/jpeg",
        alt = paste0("./images/", folder4, "/", file4, ".jpg"),
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
    
    #******************************************
    # image5 sends pre-rendered images
    #******************************************
    output$image5 <- renderImage({
      
      ## La columna 9 nos da el producto 5
      folder5 <- as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), 9])
      
      switch(folder5,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collar_perro = {aleatorio = sample(len_collarDog, 1)},
             collar_gato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)},
             monos = {aleatorio = sample(len_mono, 1)},
             cepillo = {aleatorio = sample(len_cepillo, 1)},
             individual_gato = {aleatorio = sample(len_individual_gato, 1)},
             llavero_gato = {aleatorio = sample(len_llavero_gato, 1)},
             a_bordo_gato = {aleatorio = sample(len_abordo_gato, 1)},
             placa = {aleatorio = sample(len_placa, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file5 <- ifelse(folder5 %in% prod_pet, 
                      as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder5, "/", file5, ".jpg"), #"./images/arnes/ARNES_002.jpg",
        filetype = "image/jpeg",
        alt = paste0("./images/", folder5, "/", file5, ".jpg"),
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
    
    #******************************************
    # image6 sends pre-rendered images
    #******************************************
    output$image6 <- renderImage({
      
      ## La columna 10 nos da el producto 6
      folder6 <- as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), 10])
      
      switch(folder6,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collar_perro = {aleatorio = sample(len_collarDog, 1)},
             collar_gato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)},
             monos = {aleatorio = sample(len_mono, 1)},
             cepillo = {aleatorio = sample(len_cepillo, 1)},
             individual_gato = {aleatorio = sample(len_individual_gato, 1)},
             llavero_gato = {aleatorio = sample(len_llavero_gato, 1)},
             a_bordo_gato = {aleatorio = sample(len_abordo_gato, 1)},
             placa = {aleatorio = sample(len_placa, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file6 <- ifelse(folder6 %in% prod_pet, 
                      as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder6, "/", file6, ".jpg"), #"./images/arnes/ARNES_002.jpg",
        filetype = "image/jpeg",
        alt = paste0("./images/", folder6, "/", file6, ".jpg"),
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
    
    #******************************************
    # image7 sends pre-rendered images
    #******************************************
    output$image7 <- renderImage({
      
      ## La columna 11 nos da el producto 7
      folder7 <- as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), 11])
      
      switch(folder7,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collar_perro = {aleatorio = sample(len_collarDog, 1)},
             collar_gato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)},
             monos = {aleatorio = sample(len_mono, 1)},
             cepillo = {aleatorio = sample(len_cepillo, 1)},
             individual_gato = {aleatorio = sample(len_individual_gato, 1)},
             llavero_gato = {aleatorio = sample(len_llavero_gato, 1)},
             a_bordo_gato = {aleatorio = sample(len_abordo_gato, 1)},
             placa = {aleatorio = sample(len_placa, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file7 <- ifelse(folder7 %in% prod_pet, 
                      as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder7, "/", file7, ".jpg"), 
        filetype = "image/jpeg",
        alt = paste0("./images/", folder7, "/", file7, ".jpg"),
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
    
    #******************************************
    # image8 sends pre-rendered images
    #******************************************
    output$image8 <- renderImage({
      
      ## La columna 12 nos da el producto 8
      folder8 <- as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), 12])
      
      switch(folder8,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collar_perro = {aleatorio = sample(len_collarDog, 1)},
             collar_gato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)},
             monos = {aleatorio = sample(len_mono, 1)},
             cepillo = {aleatorio = sample(len_cepillo, 1)},
             individual_gato = {aleatorio = sample(len_individual_gato, 1)},
             llavero_gato = {aleatorio = sample(len_llavero_gato, 1)},
             a_bordo_gato = {aleatorio = sample(len_abordo_gato, 1)},
             placa = {aleatorio = sample(len_placa, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file8 <- ifelse(folder8 %in% prod_pet, 
                      as.character(finder()[which(finder()['index'] == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder8, "/", file8, ".jpg"),
        filetype = "image/jpeg",
        alt = paste0("./images/", folder8, "/", file8, ".jpg"),
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
  }
})





