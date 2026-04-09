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
  ggplot(aes(y=idh_2010, x=municipio, color = regiao)) +
  geom_col() +
  xlab("municipio") + ggtitle("municipio x IDH 2010") + ylab("IDH 2010")

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

#criando branche
install.packages("usethis")
git --version


#aula 08/04
set.seed(42)

# População: renda e acesso à internet (correlacionados)
renda <- rgamma(100000, shape = 2, rate = 1) * 1500
prob_internet <- pmin(renda / max(renda) + 0.2, 1)
tem_internet <- rbinom(100000, 1, prob_internet)

# Parâmetro verdadeiro
cat("Renda média da população:", round(mean(renda)), "\n")
cat("Renda média de quem tem internet:", round(mean(renda[tem_internet == 1])), "\n")

# Simular 1.000 pesquisas de cada tipo
n <- 200  # <-- MUDE AQUI: tente 50, 200 e 1000
medias_aleatoria <- replicate(1000, mean(sample(renda, n)))
medias_conveniencia <- replicate(1000, mean(sample(renda[tem_internet == 1], n)))

# Comparar lado a lado
par(mfrow = c(1, 2))
hist(medias_aleatoria, breaks = 30, main = "Amostra Aleatória",
     xlab = "Média amostral", col = "steelblue", xlim = range(c(medias_aleatoria, medias_conveniencia)))
abline(v = mean(renda), col = "red", lwd = 2, lty = 2)

hist(medias_conveniencia, breaks = 30, main = "Amostra de Conveniência",
     xlab = "Média amostral", col = "salmon", xlim = range(c(medias_aleatoria, medias_conveniencia)))
abline(v = mean(renda), col = "red", lwd = 2, lty = 2)