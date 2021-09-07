#complete_demo
complete <- function(directory, id = 1:332) {
  CSV_files <- list.files(directory, full.names = TRUE)
  datadf <- data.frame()
  for (i in id) {
    moni_i <- read.csv(CSV_files[i])
    nobs <- sum(complete.cases(moni_i))      #complete.cases()可得是否為complete的邏輯vector，sum()加總True值
    tmpdf <- data.frame(i, nobs)             #將測站ID及其結果存成 df
    datadf <- rbind(datadf, tmpdf)           #將新的資料綁至新row
  }
  colnames(datadf) <- c("id", "nobs")        #將column賦名
  datadf                                     #回報
}