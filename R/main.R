## =============================================================================
##
##	two-wheel-noiseR
##	are they making that much noise ?
##
##	Objective
##	-----------------
##	two-wheel vehicule are booming in Paris
##	their engines could be very noisy
##	this project is an attempt to measure how much !
##	using opendata from the city of Paris
##
##
##	main.R
##	-------
##	0. Configuration, libraries & source functions
##	1. Get data
##	2. Clean data
##
## =============================================================================




## =============================================================================
##	0. Configuration, libraries & source functions
## =============================================================================
source('./R/core-R/load-libraries.R')
source('./R/get-clean-data/get-online-data.R')
source('./conf/noise-records-uri.R')


## =============================================================================
##	1. Get data
## =============================================================================

## ------------------------
##	get noise data
## ------------------------
## Download if file do not exists
setwd('./data/source/')
mapply(getOnlineData,uriNoiseSensor$url, uriNoiseSensor$destination.file)
setwd('../../')
## Load
myData <- lapply(uriNoiseSensor$file.path, fread)
names(myData) <- uriNoiseSensor$dataset


## ------------------------
##	clean noise data
## ------------------------
myData$noise.average[ , Timestamp := strptime(x = Timestamp, format = "%Y-%m-%dT%H:%M:%S+00:00")]
myData$noise.average[ , ':=' (
	year = year(Timestamp),
	month = month(Timestamp),
	day = lubridate::day(Timestamp),
	week.day = weekdays(Timestamp),
	date = lubridate::date(Timestamp),
	time = format(Timestamp, format = '%T')
)]
