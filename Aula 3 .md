#install.packages('WDI')
#install.packages('tidyverse')
#install.packages('ggplot2')
#install.packages('ggthemes')
#install.packages('scales')

options(scipen = 999)

library(WDI)
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(scales)

Base_de_importacao_e_exportacao <- c('exp'="NE.IMP.GNFS.CD",'imp'="NE.EXP.GNFS.CD")

dados_exportacao_importacao_all <- WDI(country = "all", indicator = Base_de_importacao_e_exportacao,  start = 2022, end = 2022)%>% 
  na.omit()

dados_exportacao_importacao_BR <- WDI(country = "BR", indicator = Base_de_importacao_e_exportacao)%>% 
  na.omit()

grafico_ponto_br <- 
  ggplot(data = dados_exportacao_importacao_all,
         mapping = aes(x = imp, y = exp)) +
geom_point() 

print(grafico_ponto_br)




# Criando o gráfico de dispersão e destacando o Brasil
grafico_ponto_br <- ggplot(data = dados_exportacao_importacao_all, 
                           mapping = aes(x = imp, y = exp)) +
  geom_point() +
  geom_point(data = dados_exportacao_importacao_BR, aes(x = imp, y = exp), color = "red", size = 3) +
  geom_text(data = dados_exportacao_importacao_BR, aes(x = imp, y = exp, label = "Brasil"), vjust = -1, color = "red") +
  theme_minimal() + 
  labs(title = "Importações vs. Exportações",
       x = "Importações",
       y = "Exportações")

# Exibindo o gráfico
print(grafico_ponto_br)


