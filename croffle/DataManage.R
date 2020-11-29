## Set directory & load packages
setwd("~/Lecture/RTHON2020/croffle/data")
library(plyr)        ## rbind.fill
library(readxl)      ## read_excel
library(magrittr)    ## %>%


## CSV & XLSX list
csvlist <- list.files(pattern = "csv")
xlsxlist <- list.files(pattern = "xlsx")


## Read csv

all.csv <- lapply(csvlist, read.csv, check.names = F) %>% rbind.fill   ## check.names = F, 원래컬럼이름 그대로(. 없음)
all.csv$`합계 길이` <- as.numeric(gsub('\\([^)]*\\)', "", all.csv$`합계 길이`))  ## 괄호안 숫자 지우고 숫자형으로

all.xlsx  <- lapply(xlsxlist, read_excel, na = "-") %>% rbind.fill


## Final
road <- rbind.fill(all.csv, all.xlsx)
road <- data.frame(road, check.names = F)


## 광역자치단체, 시도, 소재지 합쳐서 `지역` 으로
road$sido <- ifelse(!is.na(road$광역자치단체), road$광역자치단체,
                  ifelse(!is.na(road$시도), road$시도,
                         ifelse(!is.na(road$소재지), road$소재지, NA)))


road$지역 <- paste(road$sido, road$시군구, sep = " ")
road$지역 <- gsub("NA |NA NA| NA", NA, road$지역)   ## NA 처리


## 필요없는 열 지우기
var.exclude <- c("광역자치단체", "시도", "소재지", "시군구", "sido", "...2", "...8")
road <- road[, setdiff(names(road), var.exclude)]


usethis::use_data(road)
