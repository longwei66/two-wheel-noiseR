## Data Configuration

## Noise Sensors List



# Noise sensors data
uriNoiseSensor <-
	data.table(
		dataset = c("noise.average", "noise.mini", "noise.maxi", "noise.sensor.list"),
		url = c(
			"https://opendata.paris.fr/explore/dataset/place-de-la-nation-bruit-valeur-moyenne/download/?format=csv&use_labels_for_header=true",
			"https://opendata.paris.fr/explore/dataset/place-de-la-nation-mesures-de-bruit-valeur-minimum/download/?format=csv&use_labels_for_header=true",
			"https://opendata.paris.fr/explore/dataset/place-de-la-nation-mesure-de-buit-valeur-maximum/download/?format=csv&use_labels_for_header=true",
			"https://opendata.paris.fr/explore/dataset/place-de-la-nation-emplacements-capteurs-bruits/download/?format=csv&use_labels_for_header=true"
			),
		destination.file = c("noise-average.csv", "noise-mini.csv", "noise-maxi.csv", "noise-sensor-list.csv")
		)
uriNoiseSensor$file.path <- paste("./data/source/", uriNoiseSensor$destination.file, sep = "")

