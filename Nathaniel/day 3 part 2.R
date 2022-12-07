library("dplyr")
library("stringr")
elf1 <- list()
elf2 <- list()
elf3 <- list()
listofbadges <- readLines("Nathaniel/day3_input.txt")
for(x in 1:length(listofbadges)){
  if(x%%3 == 1){
    elf1 <- append(elf1, listofbadges[[x]])
  }else if(x%%3 ==2){
    elf2 <- append(elf2, listofbadges[[x]])
  }else{
    elf3 <- append(elf3, listofbadges[[x]])
  }
}
elf1
elf2
elf3

elves = data.frame(unlist(elf1),unlist(elf2),unlist(elf3))
names(elves) = c("elf1","elf2", "elf3")

comparetype <- function(type1, type2, type3){
  same <- "na"  
  for(y in 1:nchar(type2)){
    for(x in 1:nchar(type1)){
      for(z in 1:nchar(type3)){
        charin1 <- substr(type1, x, x)
        charin2 <- substr(type2, y, y)
        charin3 <- substr(type3, z, z)
        if (charin1 == charin2 & charin1 == charin3){
          same <- charin1
        }
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

compelves <- elves %>% 
  rowwise() %>%
  mutate(compsame = comparetype(elf1, elf2, elf3))%>%
  mutate(lettvalue = lettertovalue(compsame))

badgetotal <- compelves[, -1:-4]

sum(badgetotal$lettvalue)

