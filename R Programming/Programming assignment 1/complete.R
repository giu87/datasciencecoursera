complete <- function(directory, id = 1:332) {

	filenames <- list.files(path=directory, pattern="*.csv")
	l <- 1
	k <- c()
	for(i in id) {

		filename <- sprintf("%03d.csv", i)
		filepath <- paste(directory, filename, sep="/")

		## Load the data
		data <- read.csv(filepath)
		k[l] <- length(data[,2][!is.na(data[,2]) & !is.na(data[,3])])
		l <- l+1
	}
	frame <- data.frame(id=id, nobs=k)
}