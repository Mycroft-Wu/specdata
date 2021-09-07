pollutantmean <- function(directory, pollutant, id = 1:332){
    file_list <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    for(i in id){
        dat <- rbind(dat, read.csv(file_list[i]))
    }
    dat_sub <- dat[which(dat[, "ID"] %in% id),]
    mean(dat_sub[, pollutant], na.rm=TRUE)
}
  