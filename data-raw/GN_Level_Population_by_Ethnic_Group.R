## code to prepare `GNpop_by_EthnicGroup` dataset goes here

library(readxl)
library(tidyverse)

GNpop_by_EthnicGroup <-
  read_excel(
    "data-raw/raw_population_excel/GN_Level_Population_by_Ethnic_Group_cleaned.xlsx"
  )

head(GNpop_by_EthnicGroup)



GNpop_by_EthnicGroup <- GNpop_by_EthnicGroup |>
  mutate(across(everything(), as.character)) |>
  mutate(
    Total = as.integer(Total),
    District_Code = as.character(District_Code),
    District_Name = as.character(District_Name),
    DSD_Code = as.character(DSD_Code),
    DSD_Name = as.character(DSD_Name),
    GND_Code = as.character(GND_Code),
    GND_Name = as.character(GND_Name)
  ) |>

  mutate(
    across(-c(District_Code, District_Name, DSD_Code, DSD_Name, GND_Code, GND_Name), as.integer)
  )


head(GNpop_by_EthnicGroup)

usethis::use_data(GNpop_by_EthnicGroup, overwrite = TRUE)
