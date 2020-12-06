#install.packages(c("rgdal", "RColorBrewer", "sp", "GISTools", "classInt", "maptools", "ggplot2", "rworldmap", "spplot"))
  
library("dplyr")
library("rgdal")
library("RColorBrewer")


EU_NUTS <- readOGR(dsn = "G:/Projects/visualization/NUTS_2021/data", layer = "NUTS_RG_01M_2021_4326_LEVL_3")
#plot(EU_NUTS)

country <- substring(as.character(EU_NUTS$NUTS_ID), 1, 2)
map <- c("AT")
map_nuts <- EU_NUTS[country %in% map,]
map_nuts@data

data <- read.csv("G:/Projects/visualization/data/deaths_aut.csv")

colPallete <- brewer.pal(n = 9, name = "YlOrRd")

data_2014 <- data %>% 
  select(TIME, GEO, Value) %>% 
  rename(year = TIME, NUTS3 = GEO, deaths = Value) %>% 
  mutate(deaths = as.numeric(gsub(",", "", deaths))) %>% 
  filter(year == "2014")
map_aut_deaths_2014 <- merge(map_nuts, data_2014, by.x="NUTS_ID", by.y="NUTS3")


data_2015 <- data %>% 
  select(TIME, GEO, Value) %>% 
  rename(year = TIME, NUTS3 = GEO, deaths = Value) %>% 
  mutate(deaths = as.numeric(gsub(",", "", deaths))) %>% 
  filter(year == "2015")
map_aut_deaths_2015 <- merge(map_nuts, data_2015, by.x="NUTS_ID", by.y="NUTS3")

data_2016 <- data %>% 
  select(TIME, GEO, Value) %>% 
  rename(year = TIME, NUTS3 = GEO, deaths = Value) %>% 
  mutate(deaths = as.numeric(gsub(",", "", deaths))) %>% 
  filter(year == "2016")
map_aut_deaths_2016 <- merge(map_nuts, data_2016, by.x="NUTS_ID", by.y="NUTS3")

data_2017 <- data %>% 
  select(TIME, GEO, Value) %>% 
  rename(year = TIME, NUTS3 = GEO, deaths = Value) %>% 
  mutate(deaths = as.numeric(gsub(",", "", deaths))) %>% 
  filter(year == "2017")
map_aut_deaths_2017 <- merge(map_nuts, data_2017, by.x="NUTS_ID", by.y="NUTS3")

data_2018 <- data %>% 
  select(TIME, GEO, Value) %>% 
  rename(year = TIME, NUTS3 = GEO, deaths = Value) %>% 
  mutate(deaths = as.numeric(gsub(",", "", deaths))) %>% 
  filter(year == "2018")
map_aut_deaths_2018 <- merge(map_nuts, data_2018, by.x="NUTS_ID", by.y="NUTS3")

spplot(map_aut_deaths_2014, "deaths", main = "Österreich 2014", sub = "Tode per NUTS3-Gebietseinheiten", col = "black", col.regions = colPallete, cuts = 8)
spplot(map_aut_deaths_2015, "deaths", main = "Österreich 2015", sub = "Tode per NUTS3-Gebietseinheiten", col = "black", col.regions = colPallete, cuts = 8)
spplot(map_aut_deaths_2016, "deaths", main = "Österreich 2016", sub = "Tode per NUTS3-Gebietseinheiten", col = "black", col.regions = colPallete, cuts = 8)
spplot(map_aut_deaths_2017, "deaths", main = "Österreich 2017", sub = "Tode per NUTS3-Gebietseinheiten", col = "black", col.regions = colPallete, cuts = 8)
spplot(map_aut_deaths_2018, "deaths", main = "Österreich 2018", sub = "Tode per NUTS3-Gebietseinheiten", col = "black", col.regions = colPallete, cuts = 8)

#plot(map_nuts, col = colorRampPalette(c("white", "red"))(nrow(map_nuts$LEVL_CODE)))
