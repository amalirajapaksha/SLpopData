## code to prepare `DISpop_by_FiveYearAgeGroup` dataset goes here

library(readxl)
library(tidyverse)

#import data
DISpop_by_FiveYearAgeGroup <-
  read_excel(
    "data-raw/raw_data_excel/District_Level_Population_by_Five_Year_Age_Group_cleaned.xlsx"
  )

DISpop_by_FiveYearAgeGroup <- DISpop_by_FiveYearAgeGroup |>
  rename(Year = year)

head(DISpop_by_FiveYearAgeGroup)


#convert variables into appropriate structure
DISpop_by_FiveYearAgeGroup <- DISpop_by_FiveYearAgeGroup |>
  mutate(across(everything(), as.character)) |>
  mutate(
    Total = as.double(Total),
    District_Code = as.character(District_Code),
    District_Name = as.character(District_Name),
    Year = as.factor(Year)
  ) |>

  mutate(
    across(-c(District_Code, District_Name, Year), as.double)
  )


head(DISpop_by_FiveYearAgeGroup)

usethis::use_data(DISpop_by_FiveYearAgeGroup, overwrite = TRUE)

