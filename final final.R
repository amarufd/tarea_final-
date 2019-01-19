# Libreria encargada de leer el html
library(rvest)

# FALTA: abrir un csv y pasarlo a data.frame

# DataFrame encargado de almacenar la informacion
datosJuntos = data.frame()


# comentarios profe
for(i in 1:3){
  print(paste("http://www.garrasypatas.cl/perros/page/",i,"/",sep = ""))
  
  web_perros <- read_html(paste("http://www.garrasypatas.cl/perros/page/",i,"/",sep = ""))
  
  los_link_perros <- html_nodes(web_perros, '.cmsms_open_link')
  
  los_links <- html_attr(los_link_perros,"href")
  
  # extraccion de cada canino
  for(elCan in los_links){
    # extra cada perro
    print(elCan)
    adopta_perros <- elCan
    
    primer_perro<- read_html(adopta_perros)
    
    nombre <- html_nodes(primer_perro,'.project_features_item_title')
    
    # Extraccion del texto contenido en otra_tabla con la función html_text
    # y transformación a lista de los contenidos con as.list
    limpio <- as.list(html_text(nombre))
    
    otra_tabla <- html_nodes(primer_perro,'.project_features_item_desc' )
    
    # Extraccion del texto contenido en otra_tabla con la función html_text
    # y transformación a lista de los contenidos con as.list
    tabla_limpia <- as.list(html_text(otra_tabla))
    
    # Asignación de nombres a la lista tabla_limpia, que se encuentran
    # almacenados en la variable limpio
    names(tabla_limpia) <- limpio
    
    # Creacio de dataframe a partir de los datos de la variable tabla_limpia
    tablajunta <- as.data.frame(tabla_limpia)
    
    # Union de dataFrames
    datosJuntos <- rbind(datosJuntos,tablajunta)
    
  }
}

### FALTA: Unificar registros nuevos con los del CSV


### FALTA: Guardar la infomación en CSV



#### Esto ya no es necesario

tablajunta <- as.data.frame(t(tablajunta[,-1]))

adopta_perros <-"http://www.garrasypatas.cl/project/afortunado/"

primer_perro<- read_html(adopta_perros)

nombre <- html_nodes(primer_perro,'.project_features_item_title')
limpio <- html_text(nombre)
tabla1<- as.data.frame(limpio)

otra_tabla <- html_nodes(primer_perro,'.project_features_item_desc' )
tabla_limpia <- html_text (otra_tabla)
tabla2<-as.data.frame (tabla_limpia)

tablajunta <- data.frame(tabla1,tabla2)

