#corr
corr <- function(directory, threshold = 0) {                           #門檻defalut = 0
  CSV_files <- list.files(directory, full.names = TRUE)
  dat <- vector(mode = "numeric", length = 0)                          #設置空的numeric vector
  for (i in 1:length(CSV_files)) {
    moni_i <- read.csv(CSV_files[i])                                   #此處沒有指定id，直接以length讀長度
    csum <- sum((!is.na(moni_i$sulfate)) & (!is.na(moni_i$nitrate)))   #獲得兩側相都沒na測值的True數量
    if (csum > threshold) {                                            #超出門檻的
      tmp <- moni_i[which(!is.na(moni_i$sulfate)), ]                   #留下sulfate是True的
      submoni_i <- tmp[which(!is.na(tmp$nitrate)), ]                   #再留下nitrate是True的
      dat <- c(dat, cor(submoni_i$sulfate, submoni_i$nitrate))         #將cor()值綁長至dat vector 中
    }
  }
  dat
}
