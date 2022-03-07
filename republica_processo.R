
install.packages("kableExtra")
install.packages("tidyverse")
install.packages("reshape2")
install.packages("plotly")  

library(kableExtra)
library(tidyverse)
library(reshape2)
library(plotly) 


# Lendo a base
rem_servidor_federal <- read.csv2("5233-liquidosexoraca.csv", encoding = "UTF-8")

# Conhecendo a base de dados

names(rem_servidor_federal)
head(rem_servidor_federal)
summary(rem_servidor_federal)
dim(rem_servidor_federal)


## Resolvendo o problema de raça e sexo na mesma coluna

rem_servidor_federal$cod_graf <- rem_servidor_federal$sexo_raça #manter código para grafico

rem_servidor_federal <- rem_servidor_federal %>%  separate(sexo_raça, c('Sexo', 'Raça')) # Fazer uma coluna para cada variável

# Conferindo categorias das variáveis sexo e raça: 

table(rem_servidor_federal$Sexo,rem_servidor_federal$Raça)

# Unificar as flexões de gênero da variável raça


rem_servidor_federal$Raça <- ifelse(rem_servidor_federal$Raça %in% c("Branca","Branco"),"Branca","Negra")

table(rem_servidor_federal$Sexo,rem_servidor_federal$Raça) #Conferindo


#Algumas análises gerais

max(rem_servidor_federal[rem_servidor_federal$cod_graf == "Mulher Negra",]$liquido)
max(rem_servidor_federal[rem_servidor_federal$cod_graf == "Mulher Branca",]$liquido)
max(rem_servidor_federal[rem_servidor_federal$cod_graf == "Homem Negro",]$liquido)
max(rem_servidor_federal[rem_servidor_federal$cod_graf == "Homem Branco",]$liquido)

min(rem_servidor_federal[rem_servidor_federal$cod_graf == "Mulher Negra",]$liquido)
min(rem_servidor_federal[rem_servidor_federal$cod_graf == "Mulher Branca",]$liquido)
min(rem_servidor_federal[rem_servidor_federal$cod_graf == "Homem Negro",]$liquido)
min(rem_servidor_federal[rem_servidor_federal$cod_graf == "Homem Branco",]$liquido)


## Médias de cada grupo

mean(rem_servidor_federal[rem_servidor_federal$cod_graf == "Mulher Negra",]$liquido)
mean(rem_servidor_federal[rem_servidor_federal$cod_graf == "Mulher Branca",]$liquido)
mean(rem_servidor_federal[rem_servidor_federal$cod_graf == "Homem Negro",]$liquido)
mean(rem_servidor_federal[rem_servidor_federal$cod_graf == "Homem Branco",]$liquido)




# taxa de crescimento ano a ano, em relação a média total anterior, em relação a própria categoria


homem_branco = rem_servidor_federal %>% filter(cod_graf=="Homem Branco") %>% mutate(taxa_cresc = (liquido - lag(liquido))/(lag(liquido))*100)
homem_negro = rem_servidor_federal %>% filter(cod_graf=="Homem Negro") %>% mutate(taxa_cresc = (liquido - lag(liquido))/(lag(liquido))*100)
mulher_branca = rem_servidor_federal %>% filter(cod_graf=="Mulher Branca") %>% mutate(taxa_cresc = (liquido - lag(liquido))/(lag(liquido))*100)
mulher_negra = rem_servidor_federal %>% filter(cod_graf=="Mulher Negra") %>% mutate(taxa_cresc = (liquido - lag(liquido))/(lag(liquido))*100)


# Juntando os grupos
rem_servidor_federal <- rbind(homem_branco,
                              homem_negro,
                              mulher_branca,
                              mulher_negra)


# Salvando em Rdata

save(rem_servidor_federal,file="base.Rdata")


