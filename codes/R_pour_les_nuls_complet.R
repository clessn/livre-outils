# À vous de mettre votre working directory ici
setwd("")

############################ Code Source ACMQ_UL ###############################

## Ce fichier contient toutes les notions de programmation dont vous aurez 
## besoin pour réussir le cours.

#### 1. Opérateurs ####
#### ~1.1 Opérateurs de calcul ####
## Vous pouvez utiliser R comme une calculatrice 
1+2     # l'addition
1-2     # la soustraction
1*2     # la multiplication
1/2     # la division
2^2     # L'exposant
sqrt(4) # La racine carrée
log(2)  # Le logarithme naturel
1%%2    # modulo

#### ~1.2 Opérateurs d'assignement ####
## Deux options s'offrent à vous, mais la meilleure pratique est d'utiliser <-
nbBananes <- 2
names(nbBananes) <- "banane"
nbPommes <- 5
names(nbPommes) <- "pomme"
nbPatate = 1
names(nbPatate) = "patate"
fruits <- c(nbBananes,nbPommes)
fruits

#### ~1.3 Opérateurs logiques ####
1>2  # TRUE ou FALSE?
2>=2 # TRUE ou FALSE?
1<2  # TRUE ou FALSE?
2<=2 # TRUE ou FALSE?
2==2 # TRUE ou FALSE?
2!=2 # TRUE ou FALSE?
1<2 & 1 < 0 # TRUE ou FALSE?
1<2 | 1 < 0 # TRUE ou FALSE?
1 %in% c(0,1) # TRUE ou FALSE?

#### ~1.4 Instructions de contrôle ####

if ("patate" %in% c("pomme","banane","orange")){
  fruits <- c(fruits,nbPatate)
} else if ("patate" %in% c("carotte","navet","patate")) {
  veggies <- c(nbPatate)
} else print("Les patates ne sont pas comestibles :(")

fruitsVeggies <- c(fruits,veggies)
fruitsVeggies

for (i in 1:length(fruitsVeggies)){
  visProduce <- rep(names(fruitsVeggies[i]),fruitsVeggies[i])
  print(visProduce)
}


#### 2. Structure de données ####
#### ~2.1 Types de données et constantes ####
## Lorsque l'objet est de type "character", on ne peut y assigner des opérations
## mathématiques.
veggiesName <- "carotte"
veggiesName + 1 #ERROR

nbVeggies <- "23"
nbVeggies - 2 #ERROR encore

nbVeggies <- 23
nbVeggies - 2 #mieux :)

tomatoFruit <- TRUE
potatoFruit <- FALSE
tomatoFruit + potatoFruit #Pas d'erreur, pourquoi?

myFruitsNames <- c("pomme","banane","orange","tomate")
myFruitsFactor <- factor(myFruitsNames)
myFruitsFactor #Remarquez l'ordre alphabétique des "Levels"
myFruitsFactor <- factor(myFruitsNames,levels=c("orange","pomme","banane","tomate"))
myFruitsFactor #Remarquez comment le meilleur fruit est au début!


#### ~2.2 Vecteurs ####
myFruitsNames <- c("pomme","banane","orange","tomate")

nbFruits <- c(5,2,7,1)
length(nbFruits)

names(nbFruits) <- myFruitsNames
nbFruits
class(nbFruits) #Est-ce numérique ou caractère? 

nbFruits <- c(nbFruits,"concombre"="trois")
nbFruits
class(nbFruits) #Et maintenant ?

## Opérations mathématiques sur des vecteurs
friendsAge <- c(18,21,23,24,23,22,23,20,31,26,28,35,23,22,21)

friendsAgePlusOne <- friendsAge + 1 #ajoute 1 à tous les éléments
friendsAgePlusOne - friendsAge #soustrait les éléments i de chaque vecteur

sum(friendsAge)    #retourne la somme de tous les éléments du vecteur
mean(friendsAge)   #retourne la moyenne de tous les éléments du vecteur
median(friendsAge) #retourne la médiane de tous les éléments du vecteur
range(friendsAge)  #retourne le min et le max d'un vecteur
min(friendsAge)    #retourne le min d'un vecteur
max(friendsAge)    #retourne le max d'un vecteur
sd(friendsAge)     #retourne l'écart type d'un vecteur
var(friendsAge)    #retourne la variance d'un vecteur
quantile(friendsAge)#retourne les quartiles d'un vecteur

#retourne le min, le 1er quart., la médiane, la moyenne, le 3e quartile et le max
summary(friendsAge) 

#retourne la fréquence de chaque élément unique du vecteur
table(friendsAge)

favoriteFruit <- myFruitsNames[3]
goodFruits <- myFruitsNames[1:3]
allButBananas <- myFruitsNames[c(1,3,4)]
noBananas <- myFruitsNames[-2] #est-ce qu'il y a une différence avec allButBananas?
#qu'est-ce qui arrive si on met un - devant le c ? 
allButBananas <- myFruitsNames[-c(1,3,4)]


#### ~2.3 Dataframes ####
myFavMovie <- "The Grand Budapest Hotel"
someMovies <- c(myFavMovie,"The Lord of the Rings: The Fellowship of the Ring",
                "Star Wars: Episode V - The Empire Strikes Back",
                "The Theory of Everything","Arrival","Les choristes",
                "Amadeus","Astérix & Obélix: Mission Cléopâtre",
                "De père en flic")
DataMovies <- data.frame(Title=someMovies)
for (i in 1:length(someMovies)){
  #install.packages("imdbapi") si nécessaire
  Info <- imdbapi::find_by_title(someMovies[i],include_tomatoes = FALSE, 
                                 api_key = "333f9bc4")[1,]
  if ( i == 1) {
    DataMovies <- Info
  }
  else{
    DataMovies <- rbind(DataMovies,Info)
  }
  print(DataMovies$Title[i])
}

#Je peux ajouter mon propre score à chaque film!
DataMovies$persScore <- c(9.5,9,9,8,7,8.5,8,6,5)
# C'est quoi le score IMDB de De père en flic?
DataMovies$imdbRating[DataMovies$Title=="De père en flic"]
#C'est quoi le meilleur film selon IMDB?
DataMovies$Title[DataMovies$imdbRating==max(DataMovies$imdbRating)]
#Et le pire? 
DataMovies$Title[DataMovies$imdbRating==min(DataMovies$imdbRating)] 
#Remaquez le nombre d'éléments à la sortie!
#C'est quoi le score moyen de notre sélection?
mean(DataMovies$imdbRating)



#### 3. Importation des données ####
Data <- read.csv("/Users/williampoirier/Dropbox/Travail/Ulaval/Contrats/acmq_ul/dataIMDB/movieData.csv")
# Je suis sur Rstudio Cloud, donc ça ne fonctionne pas.
Data <- read.csv("/cloud/project/dataSets/movieData.csv")
# Beaucoup mieux

#### 4. Analyse - Description ####
#### ~4.1 test-t ####
#Est-ce que les films romantiques ont systématiquement plus de revenus que les films d'action? 
names(Data)

cashRomance <- Data$revenue[Data$Romance==1]
cashAction <- Data$revenue[Data$Action==1]
t.test(x=cashRomance,
       y=cashAction,
       conf.level=0.95)
#ou
t.test(x=Data$revenue[Data$Romance==1],
       y=Data$revenue[Data$Action==1],
       conf.level=0.95)
#Dans les deux cas t=-0.23187 et p=0.8167
#Pour qu'il y ait une différence, on veut un grand |t|
# p < 0.001 => ***
# p < 0.01  => **
# p < 0.05  => *

#C'est quoi la plus grande différence? (Opérations avancées pour les curieux.)
typeVec <- c(colnames(Data[11:30]))
TtestData <- as.data.frame(typeVec)
TtestData[,2:21] <- NA # Création du df de base avec lequel on formera une matrice
colnames(TtestData) <- c("types",typeVec)
# Remplissage de la matrice avec les t-tests pour chaque paire de variables
for (i in 1:length(typeVec)) {
  colNum1 <- which(colnames(Data)==typeVec[i])
  var1 <- Data$revenue[Data[,colNum1]==1]
  for (j in 1:length(typeVec)) {
    colNum2 <- which(colnames(Data)==typeVec[j])
    var2 <- Data$revenue[Data[,colNum2]==1]
    t <- t.test(x=var1,y=var2,conf.level=0.95)[1]
    TtestData[i,j+1] <- t
  }
  print(i)
}
# Trouver le plus grand t de la matrice
index <- which(TtestData[,2:ncol(TtestData)] == max(TtestData[,2:ncol(TtestData)]), arr.ind = T)
typeVec[index[1]] #Family
typeVec[index[2]] #Fantasy
t.test(x=Data$revenue[Data$Family==1],
       y=Data$revenue[Data$Fantasy==1],
       conf.level=0.95)
# La plus grande différence est entre les film Familiaux et Fantastiques

#### ~4.2 r de Pearson ####
# Voyons leur corrélation avec le revenu
cor.test(Data$revenue,Data$Family,conf.level=0.95)
cor.test(Data$revenue,Data$Fantasy,conf.level=0.95)
#Pour qu'il y ait un effet, on veut un grand |cor|
# p < 0.001 => ***
# p < 0.01  => **
# p < 0.05  => *
# On peut voir qu'il y a une forte corrélation entre le revenu d'un film et le fait qu'il soit familial
# Ce n'est pas le cas pour les films fantastiques


install.packages("tidyverse")
library(tidyverse)








#### ~4.3 Visualisation ####
# Histogramme
ggplot(Data,aes(x=runtimeMinutes)) +
  geom_histogram()
# Bars
ggplot(Data,aes(x=runtimeMinutes,y=..count..)) +
  geom_bar()
# Moustaches
ggplot(Data,aes(x=runtimeMinutes)) +
  geom_boxplot()
# Densité
ggplot(Data,aes(x=runtimeMinutes)) +
  geom_density()

# Points
ggplot(Data,aes(x=year,y=revenue)) +
  geom_point() 
# Jitter + alpha
ggplot(Data,aes(x=year,y=revenue)) +
  geom_jitter(alpha=0.5) 

# Ligne
GraphData <- as.data.frame(table(Data$year))
names(GraphData) <- c("year","freq")
ggplot(GraphData, aes(x=year,y=freq,group=1)) +
  geom_line() +
  theme(axis.text.x = element_text(angle=45,vjust = 0.5))
#smooth
ggplot(GraphData, aes(x=year,y=freq,group=1)) +
  geom_smooth() +
  theme(axis.text.x = element_text(angle=45,vjust = 0.5))

# Principe de couche
ggplot(GraphData, aes(x=year,y=freq,group=1)) +
  geom_point(alpha=0.5) + #couche 1 (points)
  geom_line() +           #couche 2 (ligne noire)
  geom_smooth() +         #couche 3 (ligne bleue)
  theme(axis.text.x = element_text(angle=45,vjust = 0.5))

#Comparons la distribution des films Familiaux et Fantastiques
Data$subTypes <- NA
Data$subTypes[Data$Family==1] <- "Films familiaux"
Data$subTypes[Data$Fantasy==1] <- "Films fantastiques"
GraphData <- na.omit(Data)

ggplot(GraphData, aes(x=revenue,group=subTypes,fill=subTypes,color=subTypes)) +
  geom_density(alpha=0.5) +
  geom_vline(xintercept=mean(Data$revenue[Data$Family ==1]), color="#2166ac")+ #la moyenne pour family
  geom_vline(xintercept=mean(Data$revenue[Data$Fantasy==1]), color="#b2182b")+ #la moyenne pour Fantasy
  scale_color_manual(values=c("#2166ac","#b2182b"))+ #spécification des couleurs en hex code
  scale_fill_manual( values=c("#2166ac","#b2182b"))+ #spécification des couleurs en hex code
  scale_y_continuous("Densité\n",
                     expand=c(0,0))+
  scale_x_continuous("\nRevenue au box office (million de USD)",
                     labels=seq(0,500,50),
                     breaks=seq(0,500000000,50000000),
                     limits=c(0,500000000),
                     expand=c(0,0))+
  labs(title="Distribution du revenu des films familiaux et fantastiques de 1915 à 2017") + #ajout du titre
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.position = "top",
        axis.text.x = element_text(hjust=1),
        axis.text.y = element_text(angle=90,hjust=0))
ggsave("~/Dropbox/POL2000/RExercices/Graphiques/revenueDistri.png",
       width = 8, height = 4.5)

#### 5. Régression ####
#Est ce qu'on fait de meilleurs films qu'avant?
modelA <- lm(averageRating ~ year,
             data=Data)
summary(modelA)

#Est-ce que c'est vraiment lié à l'année de publication? 
modelB <- lm(averageRating ~ year +
               runtimeMinutes +
               budget +
               revenue +
               Animation + Comedy + Drama +
               Fantasy + Horror + Action +
               History + Sci.Fi,
             data=Data)
summary(modelB)





