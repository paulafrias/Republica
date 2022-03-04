library(kableExtra)
library(tidyverse)
library(reshape2)

# Definindo diretório

setwd("C:\\Users\\46853970\\Documents\\Republica")


rem_servidor_federal <- read.csv2("5233-liquidosexoraca.csv", encoding = "UTF-8")

# Conhecendo a base de dados

names(rem_servidor_federal)
head(rem_servidor_federal)
summary(rem_servidor_federal)
dim(rem_servidor_federal)


## Resolvendo o problema de raça e sexo na mesma coluna

rem_servidor_federal$cod_graf <- rem_servidor_federal$sexo_raça #manter código para grafico
rem_servidor_federal <- rem_servidor_federal %>%  separate(sexo_raça, c('Sexo', 'Raça'))

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


# taxa de crescimento ano a ano, em relação a média total anterior, em relação a própria categoria

## Calcular diferença entre grupos ano a ano





# Descrição dos dados

# Média por raça


model <-  glm(liquido ~ Sexo + Raça, data = rem_servidor_federal)

# Gráfico de tendências 

library(plotly)  

save(rem_servidor_federal,file="base.Rdata")

x =  ggplot( rem_servidor_federal , aes(x=ano,y=liquido,colour = cod_graf))+ 
  geom_line(size = 1.0)+geom_point(size=2.5)+ylab("")+ theme_classic()+ylab ("Remuneração líquida mensal")+xlab ("Ano")+
  scale_x_continuous(breaks = c(1999:2020))

# x = x %>% style(hoverinfo = "x")



ggplotly(x)  
  
  
 
