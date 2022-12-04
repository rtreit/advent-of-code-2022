library("dplyr")
library("stringr")
df <- read.table("Nathaniel/day3_input.txt")

comparetype <- function(type1, type2){
  same <- "na"  
  for(y in 1:nchar(type2)){
    for(x in 1:nchar(type1)){
     charin1 <- substr(type1, x, x)
     charin2 <- substr(type2, y, y)
     if (charin1 == charin2){
       same <- charin1
     }
    }
  }
  return(same)
}

lettertovalue <- function(letter){
  letterToNum <- letters[1:26]
  letterToNumcaps <- LETTERS[1:26]
  value <- match(letter, letterToNum)
  if(is.na(value)){
     value <- match(letter, letterToNumcaps) + 26

  }
  return(value)
}

 
sepdf <- df %>%
  mutate(totalchar =  nchar(V1))%>%
  mutate(firstpart = str_sub(df$V1,1,totalchar/2))%>%
  mutate(secondpart = str_sub(df$V1,-totalchar/2))%>%
  rowwise() %>%
  mutate(compsame = comparetype(firstpart, secondpart))%>%
  mutate(lettvalue = lettertovalue(compsame))

onlytotal <- sepdf[, -1:-5]

sum(onlytotal$lettvalue)

