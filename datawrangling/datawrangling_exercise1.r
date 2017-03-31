#refine company name
refine_original$company <- tolower(refine_original$company)
pattern_match <- function (pattern){
  a <- grep(pattern, refine_original$company)
  return (a)
}
replace_name <- function(original, a){
  refine_original$company <- replace(refine_original$company, a, original)
  return (refine_original$company)
}
original_names <- c("philips", "akzo","unilever")
pattern <- c("ps","ak","uni")

for(i in 1:length(pattern)){
  a <- pattern_match(pattern[i])
  refine_original$company <- replace_name(original_names[i], a)
  a <- NULL
}

#seperate product code
library(dplyr)
library(tidyr)
refine_original_seperated <- refine_original %>% separate(col=`Product code / number`, into=c("product_code","product_number"), sep="-")


#assign product categories
refine_original_seperated$category[refine_original_seperated$product_code == "p"] <- "Smartphone"
refine_original_seperated$category[refine_original_seperated$product_code == "v"] <- "TV"
refine_original_seperated$category[refine_original_seperated$product_code == "x"] <- "Laptop"
refine_original_seperated$category[refine_original_seperated$product_code == "q"] <- "Tablet"



#full address
library(dplyr)
library(tidyr)
refine_original_seperated$full_address <- paste(refine_original_seperated$address, refine_original_seperated$city, refine_original_seperated$country, sep = ", ")

#create dummy variables for company and product category
refine_original_seperated$company_philips <- as.numeric(refine_original_seperated$company == "philips")
refine_original_seperated$company_akzo <- as.numeric(refine_original_seperated$company == "akzo")
refine_original_seperated$company_van_houten <- as.numeric(refine_original_seperated$company == "van houten")
refine_original_seperated$company_unilever <- as.numeric(refine_original_seperated$company == "unilever")

refine_original_seperated$product_Laptop <- as.numeric(refine_original_seperated$category == "Laptop")
refine_original_seperated$product_Smartphone <- as.numeric(refine_original_seperated$category == "Smartphone")
refine_original_seperated$product_Tablet <- as.numeric(refine_original_seperated$category == "Tablet")
refine_original_seperated$product_TV <- as.numeric(refine_original_seperated$category == "TV")
