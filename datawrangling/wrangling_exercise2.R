#READ CSV

library(readr)
titanic_original <- read_csv("~/Desktop/Data Science/Data wrangling/datawrangling_exercise_2/titanic3.csv")


#PORT OF EMBARKATION

titanic_original$embarked[is.na(titanic3$embarked)] <- "S"

#AGE
titanic_original$age <- round(titanic_original$age)
titanic_original$age[titanic3$sex == "male" & is.na(titanic_original$age)] <- round(mean(titanic3$age[titanic_original$sex == "male"], na.rm = TRUE))
titanic_original$age[titanic3$sex == "female" & is.na(titanic_original$age)] <- round(mean(titanic3$age[titanic_original$sex == "female"], na.rm = TRUE))

#LIFE BOAT

titanic_original$boat[is.na(titanic_original$boat)] <- "NA"

# CABIN

titanic_original$has_cabin_number <- as.numeric(!(is.na(titanic3$cabin)))


# Export cleaned csv