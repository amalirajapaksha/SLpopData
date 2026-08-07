## code to prepare `DIShouse_by_Floor` dataset goes here

library(readxl)
library(tidyverse)

#import data
DIShouse_by_Floor <-
  read_excel(
    "data-raw/raw_data_excel/District_Level_Housing_Units_by_Main_Material_Used_for_Floor_Construction_cleaned.xlsx"
  )

head(DIShouse_by_Floor)

usethis::use_data(DIShouse_by_Floor, overwrite = TRUE)

