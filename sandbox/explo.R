

## plot sensors by location
nation.bbox <- c(left = 2.393, bottom = 48.847, right = 2.399, top = 48.85)
map <- get_stamenmap(nation.bbox, zoom = 17, maptype =  "watercolor" #"toner-lite"  "terrain-lines" "toner-hybrid"
		     )
ggmap(map) +
	geom_point(data = myData$noise.sensor.list, aes( x = longitude, y = latitude), 
		   alpha = 0.6, col = "blue", size = 6) +
	geom_text_repel(data = myData$noise.sensor.list, aes( x = longitude, y = latitude, label = host),
			alpha = 0.6, col = "blue")



## Leaflet to visualise sensors
icon.sensor <- makeAwesomeIcon(icon= 'speedometer', library = 'ion',
				    markerColor = 'orange',
				    iconColor = 'black')

m <- leaflet(width=1400, height=1024) %>%
	# base map
	addProviderTiles("Hydda.Base") %>%
	# sensors layer
	addAwesomeMarkers(data = myData$noise.sensor.list,
			  lng=~longitude,
			  lat=~latitude,
			  popup = ~as.character(host),
			  label = ~as.character(host),
			  icon = icon.sensor
	)


## Sensors trends
h <- ggplot(data = myData$noise.average[ year == 2016 & month == 12 & week.day == "samedi"], aes(x = time, y = Value))
h <- h + geom_point( aes(col = Host))
h <- h + facet_grid(facets = Host ~ . )
ggplotly(h)
