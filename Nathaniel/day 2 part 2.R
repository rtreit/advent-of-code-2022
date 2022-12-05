library ("dplyr")
df <- read.table("Nathaniel/day2_input.txt")

case_outcome <- function(rps){
  case_when(
    rps == "X" ~ 0,
    rps == "Y" ~ 3,
    rps == "Z" ~ 6
  )
}
case_score <- function(them, outcome){
  case_when(
    them == "A" & outcome == "X" ~ 3,
    them == "B" & outcome == "Y" ~ 2,
    them == "C" & outcome == 'Z' ~ 1,
    them == "A" & outcome == 'Y' ~ 1,
    them == 'B' & outcome == 'Z' ~ 3,
    them == 'C' & outcome == 'X' ~ 2,
    them == 'A' & outcome == 'Z' ~ 2,
    them == 'B' & outcome == 'X' ~ 1,
    them == 'C' & outcome == 'Y' ~ 3
    
  )
}
df <- df %>%
  mutate(winlose = case_outcome(V2)) %>%
  mutate(your_choice = case_score(V1,V2)) %>%
  mutate(total = winlose+your_choice)
total_per_column <- df %>%
  summarize_if(is.numeric, sum)

total_per_column['total']