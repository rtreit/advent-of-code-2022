library(stringr)
library(dplyr)
library(tidyr)

spacecleaned <- read.table("Nathaniel/day4_input.txt")

totspaceover <- function(onestart, oneend, twostart, twoend){

  same <- 0

  if(oneend-onestart > twoend-twostart){
    if(onestart <= twostart & oneend >= twoend){
      same <- 1
    }
  }else{
    if(onestart >= twostart & oneend <= twoend){
      same <- 1
    }
  }
  return(same)
}

sepspace <- spacecleaned %>%
  separate(V1, c("elf1start", "elf1end","elf2start", "elf2end"))
sepspace <- as.data.frame(apply(sepspace, 2, as.numeric))
sepspace <- sepspace %>%
  rowwise()%>%
  mutate(compover = (totspaceover(elf1start, elf1end, elf2start, elf2end)))


totalsame <- sepspace[, -1:-4]

sum(totalsame$compover)