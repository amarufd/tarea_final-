# comentarios profe
for(i in 1:3){
  print(paste("http://www.garrasypatas.cl/perros/page/",i,"/",sep = ""))
  
  read_html(paste("http://www.garrasypatas.cl/perros/page/",i,"/",sep = ""))
  
  los_link_perros <- html_nodes(web_perros, '.cmsms_open_link')
  
  los_links <- html_attr(los_link_perros,"href")
  
  # extraccion de cada canino
  for(elCan in los_links){
    # extra cada perro
    print(elCan)
    adopta_perros <- elCan
    
    primer_perro<- read_html(adopta_perros)
    
    nombre <- html_nodes(primer_perro,'.project_features_item_title')
    limpio <- html_text(nombre)
    tabla1<- as.data.frame(limpio)
    
    otra_tabla <- html_nodes(primer_perro,'.project_features_item_desc' )
    tabla_limpia <- html_text (otra_tabla)
    tabla2<-as.data.frame (tabla_limpia)
    
    tablajunta <- data.frame(tabla1,tabla2)
    
  }
}

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
