library(stringr)
library(dplyr)
library(tidyr)

spacecleaned <- read.table("Nathaniel/day4_input.txt")

checkoverlap <- function(onestart, oneend, twostart, twoend){
  
  same <- 0
  for(x in onestart:oneend){
    for(y in twostart:twoend){
      if(x ==y){
        same <- 1
      }
    }
  }
  return(same)
}

sepspace <- spacecleaned %>%
  separate(V1, c("elf1start", "elf1end","elf2start", "elf2end"))
sepspace <- as.data.frame(apply(sepspace, 2, as.numeric))
overlapspace <- sepspace %>%
  rowwise()%>%
  mutate(compspace = (checkoverlap(elf1start, elf1end, elf2start, elf2end)))


totaloverlap <- overlapspace[, -1:-4]

sum(totaloverlap$compspace)