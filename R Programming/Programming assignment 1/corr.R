corr <- function(directory, threshold = 0) {

	complete_observation <- get_observations(directory, threshold)
	
	correlations <- numeric()
	for(i in complete_observation){
	
		filename <- sprintf("%03d.csv", i)
		filepath <- paste(directory, filename, sep="/")

		## Load the data
		data <- read.csv(filepath)
		data <- na.omit(data)
		
		if(nrow(data) >= threshold) {
			c <- round(cor(data[,2], data[,3]), digits=5)
			correlations <- append(correlations, c)	
		}
	}
	correlations
}

get_observations <- function(directory, threshold){

	observations <- complete(directory)
	observations$id[observations$nobs > threshold]
}