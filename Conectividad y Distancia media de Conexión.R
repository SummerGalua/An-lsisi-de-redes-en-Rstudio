#Generamos el grafo 
datos <- data.frame(readxl::read_excel("C:/PATH", sheet = "Nombre de la página de excel"))
SN <-data.frame(datos$Origen.entidad,datos$Destino.entidad)
g <- igraph::graph.edgelist(as.matrix(SN), directed = FALSE) 

#Graficamos el Grafo
networkD3::simpleNetwork(SN[],fontSize = 10, linkDistance = 1,charge = -4)

#Cálculo de conectividad
k <- mean(igraph::degree(g))
igraph::E(g)$weight<- datos$Distancia..km.
distancia_media_de_conexión <- sum(igraph::distances(g))/ (2 * sum(seq(1,dim(igraph::distances(g))[1]-1,1)))

#Identificación del arco más largo
maxdist<-max(igraph::distances(g))
sp <- igraph::shortest.paths(g, v = "Nodo inicial", to = "Nuevo Laredo")
gsp <- igraph::get.shortest.paths(g, from = "Nodo inicial",to = "Nodo final")
igraph::V(g)[gsp$vpath[[1]]]





