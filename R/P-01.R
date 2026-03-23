# Este script provisório serve para podew visualizar o que foi criado de variaveis nos arquivos csv.
# A fim de ffazer uma inspeção melhor de seus conteúdos e melhorar cada vez mais o entendimento

library(tidyverse)

esp <- read_csv("data/dict/species_ref.csv")
glimpse(esp)

alometria <- read_csv("data/dict/methods_alometries.csv")