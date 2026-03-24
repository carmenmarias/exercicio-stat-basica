municipios_virgula <- read.csv("C:\\Users\\sergi\\Downloads\\municipios_virgula.csv")
View(municipios_virgula)
library(dyplr)
library(knitr)
library(kableExtra)

library(data.table)
library(dplyr)
library(tidyverse)
usethis::use_github()

df<- municipios_virgula %>%
  summarise(soma_pib = sum(pib_per_capita))
View(df)

#Usando o banco idh_municipios.csv, faça um gráfico de dispersão (geom_point()) com o IDH de educação no eixo x e 
#o IDH de renda no eixo y. Pinte os pontos por região (color = regiao). 
#Adicione rótulos nos eixos e um título informativo.

idh_municipios <- read.csv2("C:\\Users\\sergi\\Downloads\\idh_municipios.csv", fileEncoding = "latin1")
library(ggplot2)

View(idh_municipios)

library(tidyverse)
install.packages("tidyverse")

idh_municipios%>%
  ggplot(aes(y=idh_renda, x=idh_educacao, color = regiao)) +
  geom_point() +
  xlab("IDH Educação") + ggtitle("IDH Educação x IDH Renda") + ylab("IDH Renda")

#Usando o banco municipios_virgula.csv, encontre o município com o maior IDH e o município com o menor IDH.

df<- municipios_virgula%>%
  filter(idh==min(idh))
  
usethis::use_github()
install.packages("rmarkdown")    
install.packages("tinytex")
tinytex::install_tinytex()
install.packages("dplyr")
library(dplyr)

df<- municipios_virgula%>%
  filter(idh==max(idh))
