## Set directory & load packages
setwd("~/Lecture/RTHON2020/croffle/data")
library(data.table)  ## rbindlist
library(readxl)      ## read_excel
library(magrittr)    ## %>%


## CSV & XLSX list
csvlist <- list.files(pattern = "csv")
xlsxlist <- list.files(pattern = "xlsx")


## Read csv

all.csv <- lapply(csvlist, read.csv, check.names = F) %>% rbindlist(fill = T)   ## check.names = F, 원래컬럼이름 그대로(. 없음)
all.csv$`합계 길이` <- as.numeric(gsub('\\([^)]*\\)', "", all.csv$`합계 길이`))  ## 괄호안 숫자 지우고 숫자형으로

all.xlsx  <- lapply(xlsxlist, read_excel, na = "-") %>% rbindlist(fill = T)


## Final
road <- rbind(all.csv, all.xlsx, fill = T, use.names = T)
road <- data.frame(road)
