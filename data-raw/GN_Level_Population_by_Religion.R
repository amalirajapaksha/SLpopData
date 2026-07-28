## code to prepare `GNpop_by_EthnicGroup` dataset goes here

library(readxl)
library(tidyverse)

#import data
GNpop_by_Religion <-
  read_excel(
    "data-raw/raw_data_excel/GN_Level_Population_by_Religion_cleaned.xlsx"
  )

head(GNpop_by_Religion)


#convert variables into appropriate structure
GNpop_by_Religion <- GNpop_by_Religion |>
  mutate(across(everything(), as.character)) |>
  mutate(
    Total = as.double(Total),
    District_Code = as.character(District_Code),
    District_Name = as.character(District_Name),
    DSD_Code = as.character(DSD_Code),
    DSD_Name = as.character(DSD_Name),
    GND_Code = as.character(GND_Code),
    GND_Name = as.character(GND_Name)
  ) |>

  mutate(
    across(-c(District_Code, District_Name, DSD_Code, DSD_Name, GND_Code, GND_Name), as.double)
  )


head(GNpop_by_Religion)

usethis::use_data(GNpop_by_Religion, overwrite = TRUE)

