#install.packages('WDI')
options(scipen = 999)

library(WDI)
library(tidyverse)


Base_de_importacao_e_exportacao <- c("NE.IMP.GNFS.CD","NE.EXP.GNFS.CD")

dados_exportacao_importacao_all <- WDI(country = "all", indicator = Base_de_importacao_e_exportacao,  start = 2022, end = 2022)%>% 
  na.omit()

dados_exportacao_importacao_BR <- WDI(country = "BR", indicator = Base_de_importacao_e_exportacao)%>% 
  na.omit()


