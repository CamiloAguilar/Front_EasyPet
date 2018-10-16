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
    col_fichero = 4 ## Columna para buscar nombre fichero
    prod_pet <- c('individual', 'a_bordo', 'llavero')
    len_arnes <- list.files("./images/arnes")
    len_collarDog <- list.files("./images/collar_perro")
    len_collarCat <- list.files("./images/collar_gato")
    len_pechera <- list.files("./images/pechera")
    len_portabolsas <- list.files("./images/porta_bolsas")
    len_trailla <- list.files("./images/trailla")
    
    
    breed <- reactiveFileReader(
      intervalMillis = 1,
      session = session,
      filePath = './files/dog_breed.csv',
      readFunc = read.csv
    ) 
    
    finder <- reactiveFileReader(
      intervalMillis = 1000,
      session = session,
      filePath = './files/razas_clasificador con productos.csv',
      readFunc = read.csv
    )
    
    #******************************************
    # image1 sends pre-rendered images
    #******************************************
    output$image1 <- renderImage({
      
      ## La columna 5 nos da el producto 1
      folder1 <- as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), 5])
      
      switch(folder1,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collarperro = {aleatorio = sample(len_collarDog, 1)},
             collargato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file1 <- ifelse(folder1 %in% prod_pet, 
                      as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder1, "/", file1, ".jpg"), #"./images/arnes/ARNES_002.jpg",
        filetype = "image/jpeg",
        alt = "my doggy_1",
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
    
    #******************************************
    # image2 sends pre-rendered images
    #******************************************
    output$image2 <- renderImage({
      
      ## La columna 6 nos da el producto 2
      folder2 <- as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), 6])
      
      switch(folder2,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collarperro = {aleatorio = sample(len_collarDog, 1)},
             collargato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file2 <- ifelse(folder2 %in% prod_pet, 
                      as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder2, "/", file2, ".jpg"), #"./images/arnes/ARNES_002.jpg",
        filetype = "image/jpeg",
        alt = "my doggy",
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
    
    #******************************************
    # image3 sends pre-rendered images
    #******************************************
    output$image3 <- renderImage({
      
      ## La columna 7 nos da el producto 3
      folder3 <- as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), 7])
      
      switch(folder3,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collarperro = {aleatorio = sample(len_collarDog, 1)},
             collargato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file3 <- ifelse(folder3 %in% prod_pet, 
                      as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder3, "/", file3, ".jpg"), #"./images/arnes/ARNES_002.jpg",
        filetype = "image/jpeg",
        alt = "my doggy",
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
    
    #******************************************
    # image4 sends pre-rendered images
    #******************************************
    output$image4 <- renderImage({
      
      ## La columna 8 nos da el producto 4
      folder4 <- as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), 8])
      
      switch(folder4,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collarperro = {aleatorio = sample(len_collarDog, 1)},
             collargato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)},
             collar = {aleatorio = sample(len_collarDog, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file4 <- ifelse(folder4 %in% prod_pet, 
                      as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), col_fichero]),
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
      folder5 <- as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), 9])
      
      switch(folder5,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collarperro = {aleatorio = sample(len_collarDog, 1)},
             collargato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file5 <- ifelse(folder5 %in% prod_pet, 
                      as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder5, "/", file5, ".jpg"), #"./images/arnes/ARNES_002.jpg",
        filetype = "image/jpeg",
        alt = "my doggy",
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
    
    #******************************************
    # image6 sends pre-rendered images
    #******************************************
    output$image6 <- renderImage({
      
      ## La columna 10 nos da el producto 6
      folder6 <- as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), 10])
      
      switch(folder6,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collarperro = {aleatorio = sample(len_collarDog, 1)},
             collargato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file6 <- ifelse(folder6 %in% prod_pet, 
                      as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder6, "/", file6, ".jpg"), #"./images/arnes/ARNES_002.jpg",
        filetype = "image/jpeg",
        alt = "my doggy",
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
    
    #******************************************
    # image7 sends pre-rendered images
    #******************************************
    output$image7 <- renderImage({
      
      ## La columna 11 nos da el producto 7
      folder7 <- as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), 11])
      
      switch(folder7,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collarperro = {aleatorio = sample(len_collarDog, 1)},
             collargato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file7 <- ifelse(folder7 %in% prod_pet, 
                      as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), col_fichero]),
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
      folder8 <- as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), 12])
      
      switch(folder8,
             arnes = {aleatorio = sample(len_arnes, 1)},
             trailla = {aleatorio = sample(len_trailla, 1)},
             collarperro = {aleatorio = sample(len_collarDog, 1)},
             collargato = {aleatorio = sample(len_collarCat, 1)},
             pechera = {aleatorio = sample(len_pechera, 1)},
             porta_bolsas = {aleatorio = sample(len_portabolsas, 1)}
      )
      
      ## La columna 4 nos da la raza homologada
      file8 <- ifelse(folder8 %in% prod_pet, 
                      as.character(finder()[which(finder()$breed == as.character(breed()$breed[1])), col_fichero]),
                      unlist(strsplit(aleatorio, "\\."))[1])
      
      return(list(
        src = paste0("./images/", folder8, "/", file8, ".jpg"),
        filetype = "image/jpeg",
        alt = "perroooooooo",
        width = 300,
        height = 400
      ))
      
    }, deleteFile = FALSE)
  }
})





