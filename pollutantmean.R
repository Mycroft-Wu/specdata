pollutantmean <- function(directory, pollutant, id = 1:332){
    if(directory=="specdata"){
      directory <- ("/Users/wuzhonghao/Downloads/specdata")
    }#读入文件夹
    file_list <- list.files(directory, full.names = TRUE)#读入全部csv文件
    dat <- data.frame()
    for(i in id){
        dat <- rbind(dat, read.csv(file_list[i]))
    }
    mean(dat[, pollutant], na.rm=TRUE)
}
  