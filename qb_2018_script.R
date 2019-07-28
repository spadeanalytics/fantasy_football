#### QB 2018 Actual Stats
library(rvest)
library(xml2)
library(bitops)
library(RCurl)
library(methods)
library(data.table)
library(dplyr)
library(stringr)
library(qdapRegex)
library(eply)
library(ggplot2)
library(stringr)
library(RColorBrewer)
qb_2018_url <- "https://www.pro-football-reference.com/years/2018/passing.htm"
qb_2018 <- read_html(qb_2018_url)
qb_2018 <- html_table(qb_2018)
qb_2018_table <- qb_2018[[1]]
qb_2018_table <- subset(qb_2018_table,qb_2018_table$Pos!='Pos')
qb_2018_table <- subset(qb_2018_table,qb_2018_table$Pos=='QB'|qb_2018_table$Pos=='qb')
qb_2018_table$Pos <- 'QB'
qb_2018_table <- subset(qb_2018_table,qb_2018_table$Pos=='QB'|qb_2018_table$Pos=='qb')
qb_2018_table$Player <- str_replace_all(qb_2018_table$Player, "[[:punct:]]", "")
qb_2018_table[,9:30] <- sapply(qb_2018_table[,9:30],as.numeric)