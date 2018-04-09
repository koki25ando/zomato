setwd("/Users/KokiAndo/Desktop/R/R report/zomato-restaurants-data")
library(jsonlite)
library(tidyverse)
test <- fromJSON("file1.json")
zomato <- fread("zomato.csv", data.table = FALSE)
# (https://www.kaggle.com/shrutimehta/zomato-restaurants-data/data)

library(maps)
world.map <- map_data ("world")
ggplot() + 
  geom_map(data=world.map, map=world.map,
           aes(x=long, y=lat, group=group, map_id=region),
           fill="white", colour="black") + 
  geom_point(data = zomato, aes(x = Longitude, y = Latitude), 
             colour = "red", alpha = .3)

table(zomato$"Country Code")

australia.map <- world.map %>% filter(region == "Australia")
ggplot() + 
  geom_map(data=australia.map, map=australia.map,
           aes(x=long, y=lat, group=group, map_id=region),
           fill="white", colour="black") + 
  geom_point(data = zomato, aes(x = Longitude, y = Latitude), 
             colour = "red", alpha = .3)
