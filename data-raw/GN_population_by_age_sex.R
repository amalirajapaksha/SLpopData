## code to prepare `gn_pop_age_sex` dataset goes here

library(readxl)

gn_pop_age_sex <-
  read_excel(
    "data-raw/raw_population_excel/GN_population_by_age_sex.xlsx"
  )

usethis::use_data(gn_pop_age_sex, overwrite = TRUE)

