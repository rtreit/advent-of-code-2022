library ("dplyr")
df <- read.table("Nathaniel/day2_input.txt")

case_your_choice <- function(rps){
  case_when(
    rps == "X" ~ 1,
    rps == "Y" ~ 2,
    rps == "Z" ~ 3
  )
}
case_score <- function(them, you){
  case_when(
    them == "A" & you == "X" ~ 3,
    them == "B" & you == "Y" ~ 3,
    them == "C" & you == 'Z' ~ 3,
    them == "A" & you == 'Y' ~ 6,
    them == 'B' & you == 'Z' ~ 6,
    them == 'C' & you == 'X' ~ 6,
    them == 'A' & you == 'Z' ~ 0,
    them == 'B' & you == 'X' ~ 0,
    them == 'C' & you == 'Y' ~ 0
    
  )
}
df <- df %>%
  mutate(your_value = case_your_choice(V2)) %>%
  mutate(winlose = case_score(V1,V2)) %>%
  mutate(total = winlose+your_value)
total_per_column <- df %>%
  summarize_if(is.numeric, sum)

total_per_column['total']