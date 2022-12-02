calories <- readLines("input.txt")
calories <- as.numeric(calories)

i <- 0
t <- 0
h <- 0
g <- 0

for(x in 1:calories){
  if(is.na(calories[x])){
    calories[x] <- 0
  }
}
for(x in 1:calories){
  if(calories[x]>0){
    i <- i + calories[x]
  }else{
    if(i>t){
      if(t>g){
        if(g>h){
          h <- g
        }
        g <- t
      }
      t <- i
    } else if (i>g){
      if(g>h){
        h <- g
      }
      g <- i
    } else if (i>h){
      h <- i
    }
    if( i >0){
      print (i)
    }
    i <- 0
  }
}
t+g+h