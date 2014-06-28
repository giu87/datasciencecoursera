pollutantmean <- function(directory, pollutant, id = 1:332) {

	data <- numeric()
	pp <- if(pollutant == "sulfate") 2 else 3
	for (i in id){

		path <- file_path(i)
		d <- read.csv(path)
		dd <- na.omit(d[,pp])
		data<-append(data, dd)
	}

	result <- round(mean(data, na.rm = TRUE), digits=3)
}

file_path <- function(i){

	i_string = as.character(i)
	if(i < 100)
		i_string <- paste("0", i_string, sep="")
	if(i < 10)
		i_string <- paste("0", i_string, sep="")

	i_string <- paste(directory,"/", i_string, ".csv", sep="")
}


