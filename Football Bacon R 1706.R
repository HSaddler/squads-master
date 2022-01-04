setwd("C:/Users/henri/Downloads/squads-master/data2")

# install.packages("dplyr")                                         # Install dplyr package
# install.packages("plyr")                                          # Install plyr package
# install.packages("readr")                                         # Install readr package
# install.packages("tidyverse")
# install.packages("tidygraph")
# install.packages("ggplot2")
# install.packages("ggraph")
# install.packages("visNetwork")
# install.packages("network")
# install.packages("igraph")
# install.packages("rmarkdown")
# install.packages("shiny")
# install.packages('rsconnect')
# install.packages('pacman')
# install.packages('remotes')

library("dplyr")                                                  # Load dplyr package
library("plyr")                                                   # Load plyr package
library("readr")
library("tidyverse")
library("tidygraph")
library("ggplot2")
library("ggraph")
library("visNetwork")
library("network")
library("rmarkdown")
library("shiny")
library("igraph")


# df <- list.files(path="C:/Users/henri/Downloads/squads-master/data2", full.names = TRUE) %>% 
  # lapply(read_csv) %>% 
  # bind_rows 

# View(df)

csv_files <- dir(pattern='*.csv$', recursive = T)

for(i in 1:length(csv_files)) {
  if(i == 1)
    df <- read.csv(csv_files[i])
  else
    df <- rbind(df, read.csv(csv_files[i]))
}

df$squad <- paste(df$club_name,df$season)

# kb_distance <- function(pair_graph) {
  
#  distance <- pair_graph %>%
#    activate(edges) %>%
#    as_tibble() %>%
#    summarise(n()) %>%
#    pull()
    
#    return(distance)
      
#}
#
# kb_plot <- function(pair_graph) {
#
# plot <- pair_graph %>%
#  ggraph(layout ="nicely") +
#  geom_edge_fan(
#    aes(
#      label = paste0("{", package, "}"),
#      family = "mono"
#    ),
#    edge_colour = "grey90",
#    label_colour = "grey50",
#    angle_calc = "none"
#  ) +
#  geom_node_point() +
# geom_node_text(
#    aes(label = name),
#    repel = TRUE,
#    family = "sans"
#  ) +
#  theme_graph()

# return(plot)
# 
# }

data <- data.frame(link = df$squad,node = df$player_name)
nodes.df = data.frame(id = 1:length(unique(data$node)), label = sort(unique(data$node)))

temp.links = as.character(unique(data$link))

links.df = data.frame(t(sapply(temp.links, function(x) c(x, unlist(select(filter(data, link == x), node))) )))

links2.df <-  data.frame()
colnames(links2.df) = c('label', 'from', 'to')

links.df$width = 1

links.df = merge(aggregate( width ~ from + to , links.df , sum), aggregate( label ~ from + to, links.df, function(x) paste0(x, collapse=' + ')))

# for (i in 1:unique(data$link)) {
#   
# }

# visNetwork(nodes.df, links.df) %>% visLayout(randomSeed = 123)

nodes <- data.frame(id = unique(df$player_name))
View(nodes)
# nodes <- as.data.frame(unique(df$player_name))
# edges <- as.data.frame(unique(df$squad))
edges <- data.frame(from = c(1,2), to = c(1,3))

# visNetwork(nodes, edges, width = "100%")


nodes <- rbind(data,unique(df$squad))

View(unique(df$squad))

df0 <- data.frame(squad_player = c(df$player_name, unique(df$squad)))

node_list <- tibble(id = df0)
edge_list <- tibble(from = c(df$player_name), to = c(df$squad))

# network <- visNetwork(nodes = node_list, edges = edge_list, width = "100%")

shortest_paths

g <- graph_from_data_frame(d = edge_list, directed = FALSE)
print(g)
plot(g)

shortest_paths(g, from = "Lionel Messi", to = "Didier Drogba", output = "both")

# runExample("07_widgets")

# runExample("01_hello")


