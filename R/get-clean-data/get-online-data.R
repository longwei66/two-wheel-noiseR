
#' get online data
#' function to download data from an url
#' write in local destination
#' file does not exists
#'
#' @param source.uri a vector of file source uri
#' @param destination.file a vector of detination file names
#'
#' @return
#' @export
#'
#' @examples
getOnlineData <- function(source.uri, destination.file) {
	## start download if file do not exists
	if(!file.exists(destination.file)){
		download.file(source.uri, 
			      destination.file, 
			      method = "wget",
			      quiet = FALSE,
			      mode = "w",
			      cacheOK = TRUE)} else {
			      	message("... file exists ... SKIP")
			      }
}