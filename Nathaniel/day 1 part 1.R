calories <- readLines("Nathaniel/day1_input.txt")
calories <- as.numeric(calories)

i <- 0
t <- 0

for(x in 1:calories){
  if(is.na(calories[x])){
    calories[x] <- 0
  }
}
for(x in 1:calories){
  if(calories[x]>0){
    i <- i + calories[x]
    print(i)
  }else{
    if(i>t){
      t <- i
    }
    i <- 0
  }
}

t