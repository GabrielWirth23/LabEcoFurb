---
title: "Gabriel Wirth"
format: html
editor: visual
---

```{r}
#| label: load-packages
#| include: false

library(tidyverse)
library(palmerpenguins)
```

```{r}
#| label: load-data
#| include: false

#cógigo de carregamento dos dados
library(WDI)
library(dplyr)
library(ggplot2)

# Definir os códigos para as variáveis
vars <- c(
  'Taxa de Desemprego' = "SL.UEM.TOTL.ZS",
  'Pobreza Extrema' = "SI.POV.DDAY")

dados_br <- WDI(country = 'BR', indicator = vars, start = 2000, end = 2023) %>% na.omit()

  



```

```{r}
#| label: load-data2
#| include: false


library(WDI)
library(dplyr)
library(ggplot2)
library(ggrepel)

# Definir os códigos para as variáveis
vars <- c(
  'Taxa de Desemprego' = "SL.UEM.TOTL.ZS",
  'Pobreza Extrema' = "SI.POV.DDAY"
)

# Baixar os dados
dadosall3 <- WDI(country = "all", indicator = vars, start = 2015, end = 2015) %>% na.omit()

# Lista de países europeus
paises_europeus <- c(
  "Albania", "Andorra", "Armenia", "Austria", "Azerbaijan", "Belarus", "Belgium", 
  "Bosnia and Herzegovina", "Bulgaria", "Croatia", "Cyprus", "Czech Republic", 
  "Denmark", "Estonia", "Finland", "France", "Georgia", "Germany", "Greece", 
  "Hungary", "Iceland", "Ireland", "Italy", "Kazakhstan", "Kosovo", "Latvia", 
  "Liechtenstein", "Lithuania", "Luxembourg", "Malta", "Moldova", "Monaco", 
  "Montenegro", "Netherlands", "North Macedonia", "Norway", "Poland", "Portugal", 
  "Romania", "Russia", "San Marino", "Serbia", "Slovakia", "Slovenia", "Spain", 
  "Sweden", "Switzerland", "Turkey", "Ukraine", "United Kingdom", "Vatican City"
)

# Filtrar os dados apenas para os países da Europa
dados_europa <- dadosall3 %>% 
  filter(country %in% paises_europeus)



# Filtrar os países com as 10 maiores taxas de desemprego para rotular
dados_europa_top10 <- dados_europa %>% 
  arrange(desc(`Taxa de Desemprego`)) %>% 
  head(10)



```

## Meet Quarto

Quarto enables you to weave together content and executable code into a finished document. To learn more about Quarto see <https://quarto.org>.

```{r}
#| label: graf
#| warning: false
#| echo: false

 # Gráfico temporal para o Brasil
  ggplot(dados_br, aes(x = year, y = `Pobreza Extrema`)) +
    geom_line(color = "red", linewidth = 1) +
    labs(title = "Evolução da Pobreza Extrema no Brasil, 2000 até 2023", x = "Ano", y = "Pobreza Extrema (%)")
  

```

\

## Meet the penguins

![](https://raw.githubusercontent.com/quarto-dev/quarto-web/main/docs/get-started/hello/rstudio/lter_penguins.png){style="float:right;" fig-alt="Illustration of three species of Palmer Archipelago penguins: Chinstrap, Gentoo, and Adelie. Artwork by @allison_horst." width="401"}

The `penguins` data from the [**palmerpenguins**](https://allisonhorst.github.io/palmerpenguins "palmerpenguins R package") package contains size measurements for `{r} nrow(penguins)` penguins from three species observed on three islands in the Palmer Archipelago, Antarctica.

The plot below shows the relationship between flipper and bill lengths of these penguins.

```{r}
#| label: plot-penguins
#| warning: false
#| echo: false

# Gráfico com menos rótulos (apenas 10 países)
ggplot(dados_europa, aes(x = `Taxa de Desemprego`, y = `Pobreza Extrema`, label = country)) +
  geom_point(alpha = 0.5, color = "blue") +
  geom_text_repel(data = dados_europa_top10, aes(label = country), size = 3, box.padding = 0.5, 
                  point.padding = 0.5, max.overlaps = 10) +  # Rotular apenas os 10 países
  labs(title = "Relação entre Desemprego e Pobreza Extrema na Europa", 
       x = "Taxa de Desemprego (%)", y = "Pobreza Extrema (%)") +
  theme_minimal()

```
