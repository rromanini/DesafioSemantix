if(!require(igraph)){
  install.packages("igraph")
  library(igraph)
}

#Download the edges file
destfile="./edges.dat"
fileURL = "https://raw.githubusercontent.com/rromanini/DesafioSemantix/master/PartI/edges.dat";
download.file(fileURL,destfile=destfile,method="auto")

#Reading the vertices
vertices <- read.csv("./edges.dat" ,sep = " ",header = FALSE)

#Exploring and cleaning data
summary(vertices)

#Looking for missing values
length(which(is.na(vertices) == TRUE))


#Creating the network from the vertices
net <-graph_from_data_frame(d=vertices,directed = T)

#Plotting the network
l <- layout_with_fr(net)
l <- norm_coords(l, ymin=-1, ymax=1, xmin=-1, xmax=1)

plot(net,edge.arrow.size=.05,vertex.size=10,
     edge.curved=0.2,
     vertex.frame.color="black",
     vertex.color="green",
     vertex.label.cex=0.5,rescale=F, layout=l*1.2)

#Getting the closeness
closeness_matrix <- as.matrix(closeness(net, mode="out"))
closeness_matrix <- as.matrix(closeness_matrix[order(closeness_matrix[,1],decreasing = TRUE),])

#Add column name  
colnames(closeness_matrix) <- c("Closeness")

closeness_matrix
