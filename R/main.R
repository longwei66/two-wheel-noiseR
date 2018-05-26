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
##
##
## =============================================================================




## =============================================================================
##	0. Configuration, libraries & source functions
## =============================================================================
source('./R/core-R/load-libraries.R')
source('./R/get-clean-data/get-online-data.R')
source('./data/source/noise-records-uri.R')


## =============================================================================
##	1. Get data
## =============================================================================

## ------------------------
##	get noise data
## ------------------------
setwd('./data/source/')
mapply(getOnlineData,uriNoiseSensor$url, uriNoiseSensor$destination.file)
setwd('../../')

myData <- lapply(uriNoiseSensor$file.path, fread)
names(myData) <- uriNoiseSensor$dataset
