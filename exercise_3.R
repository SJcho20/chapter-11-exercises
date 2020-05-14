# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library("fueleconomy")

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
acuras <- filter(vehicles, make=="Acura", year==2015)
best_acura <- filter(acuras, hwy==max(hwy))
best_model <- select(best_acura, model)
best_model

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
best_model <- select(
  filter(
    filter(vehicles, make=="Acura", year==2015),
    hwy==max(hwy)),
  model
)
best_model

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
best_model <- filter(vehicles, make=="Acura", year==2015) %>% filter(hwy==max(hwy)) %>%  select(model)



### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times111
first_best_model <- function(){
  acuras <- filter(vehicles, make=="Acura", year==2015)
  best_acura <- filter(acuras, hwy==max(hwy))
  best_model <- select(best_acura, model)
}


second_best_model <- function(){
  best_model <- select(
    filter(
      filter(vehicles, make=="Acura", year==2015),
      hwy==max(hwy)),
    model
  )
}

third_best_model <- function(){
  best_model <- filter(vehicles, make=="Acura", year==2015) %>% filter(hwy==max(hwy)) %>%  select(model)
}  

# Test how long it takes to perform each one 1000 times111
system.time(for (i in 1:1000){
  first_best_model()
})

system.time(for (i in 1:1000){
  second_best_model()
})

system.time(for (i in 1:1000){
  third_best_model()
})

# I do not understand why the numbers of user, system, and elapsed are different.
