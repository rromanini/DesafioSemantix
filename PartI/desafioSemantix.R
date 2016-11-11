if(!require(igraph)){
  install.packages("igraph")
  library(igraph)
}

#Download do arquivo contendo os links
destfile="./edges.dat"
fileURL = "https://raw.githubusercontent.com/rromanini/DesafioSemantix/master/PartI/edges.dat";
download.file(fileURL,destfile=destfile,method="auto")

#Leitura dos vertices
vertices <- read.csv("./edges.dat" ,sep = " ",header = FALSE)

#Criação da rede a partir dos vertices
net <-graph_from_data_frame(d=vertices,directed = T)

#Plotagem da rede
l <- layout_with_fr(net)
l <- norm_coords(l, ymin=-1, ymax=1, xmin=-1, xmax=1)

plot(net,edge.arrow.size=.05,vertex.size=10,
     edge.curved=0.2,
     vertex.frame.color="black",
     vertex.color="green",
     vertex.label.cex=0.5,rescale=F, layout=l*1.2)

#Calculo de "closeness"
closeness(net, mode="out")
