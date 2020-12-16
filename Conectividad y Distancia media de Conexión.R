#Generamos el grafo 
datos <- data.frame(readxl::read_excel("Vías_Ferrocarriles.xlsx"))
SN <-datos[1:2]

#Original 
g <- igraph::graph.edgelist(as.matrix(SN), directed = FALSE) 

#Graficamos el Grafo

networkD3::simpleNetwork(SN[],fontSize = 20, linkDistance = 1)

#Cálculo de conectividad (Promedio de aristas por nodo)
k <- mean(igraph::degree(g))

#Cálculo de la distancia media de conexión

igraph::E(g)$weight<- datos$Distancia
distancia_media_de_conexión <- sum(igraph::distances(g))/ (2 * sum(seq(1,dim(igraph::distances(g))[1]-1,1)))




