
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SLpopData

<!-- Add your hex sticker here later -->

<img src="man/figures/SLpopData_hexSticker.png" align="right" width="180"/>

<!-- badges: start -->

<!-- badges: end -->

## Overview

**SLpopData** is an R data package that includes Sri Lanka’s population,
housing, household, and demographic datasets at the District, Divisional
Secretariat (DS), and Grama Niladhari (GN) levels, facilitating
statistical analysis, data visualization, and research in R.

## Installation

Install the development version from GitHub using **pak**:

``` r
install.packages("pak")
pak::pak("amalirajapaksha/SLpopData")
```

Alternatively, using **remotes**:

``` r
install.packages("remotes")
remotes::install_github("amalirajapaksha/SLpopData")
```

## Example

Load the package.

``` r
library(SLpopData)
```

View all available datasets.

``` r
list_datasets()
#>      Item                        
#> [1,] "DIShouse_by_Floor"         
#> [2,] "DISpop_by_FiveYearAgeGroup"
#> [3,] "GNpop_by_EthnicGroup"      
#> [4,] "GNpop_by_Religion"         
#>      Title                                                                                       
#> [1,] "Number of Housing Units by Main Material Used for Floor Construction According to District"
#> [2,] "Population by Five-Year Age Groups According to District"                                  
#> [3,] "Population by Ethnic Group According to Grama Niladhari Division"                          
#> [4,] "Population by Religion According to Grama Niladhari Division"
```

Load a dataset.

``` r
data("GNpop_by_EthnicGroup")

head(GNpop_by_EthnicGroup)
#>   District_Code District_Name DSD_Code DSD_Name GND_Code         GND_Name Total
#> 1            11       Colombo        3  Colombo        5 Sammanthranapura  7640
#> 2            11       Colombo        3  Colombo       10     Mattakkuliya 28135
#> 3            11       Colombo        3  Colombo       15           Modara 31728
#> 4            11       Colombo        3  Colombo       20      Madampitiya  7699
#> 5            11       Colombo        3  Colombo       25        Mahawatta  7108
#> 6            11       Colombo        3  Colombo       30     Aluthmawatha 13714
#>   Sinhalese Sri_Lanka_Tamil Indian_Tamil_or_Malaiyaga_Thamilar
#> 1      3234            2485                                 32
#> 2      7454           11566                                596
#> 3      8253           14043                                396
#> 4      2156            2171                                438
#> 5      3079            1728                                 29
#> 6      3525            7103                                762
#>   Sri_Lanka_Moor_or_Muslim Burgher Malay Sri_Lanka_Chetty Bharatha Veddahs
#> 1                     1865      16    NA               NA       NA      NA
#> 2                     8214     189    50               13       NA      NA
#> 3                     8712     147   132               NA       25      NA
#> 4                     2893      NA    34               NA       NA      NA
#> 5                     2237      17    NA               NA       NA      NA
#> 6                     2142     107    56               NA       NA      NA
#>   Other
#> 1     8
#> 2    53
#> 3    20
#> 4     7
#> 5    18
#> 6    19
```

Display the structure of the dataset.

``` r
str(GNpop_by_EthnicGroup)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    14003 obs. of  17 variables:
#>  $ District_Code                     : chr  "11" "11" "11" "11" ...
#>  $ District_Name                     : chr  "Colombo" "Colombo" "Colombo" "Colombo" ...
#>  $ DSD_Code                          : chr  "3" "3" "3" "3" ...
#>  $ DSD_Name                          : chr  "Colombo" "Colombo" "Colombo" "Colombo" ...
#>  $ GND_Code                          : chr  "5" "10" "15" "20" ...
#>  $ GND_Name                          : chr  "Sammanthranapura" "Mattakkuliya" "Modara" "Madampitiya" ...
#>  $ Total                             : int  7640 28135 31728 7699 7108 13714 11925 7771 6090 9186 ...
#>  $ Sinhalese                         : int  3234 7454 8253 2156 3079 3525 4123 2117 840 1447 ...
#>  $ Sri_Lanka_Tamil                   : int  2485 11566 14043 2171 1728 7103 7010 3934 4873 7144 ...
#>  $ Indian_Tamil_or_Malaiyaga_Thamilar: int  32 596 396 438 29 762 464 317 127 133 ...
#>  $ Sri_Lanka_Moor_or_Muslim          : int  1865 8214 8712 2893 2237 2142 277 1199 211 454 ...
#>  $ Burgher                           : int  16 189 147 NA 17 107 15 66 14 NA ...
#>  $ Malay                             : int  NA 50 132 34 NA 56 28 15 NA NA ...
#>  $ Sri_Lanka_Chetty                  : int  NA 13 NA NA NA NA NA NA NA NA ...
#>  $ Bharatha                          : int  NA NA 25 NA NA NA NA 116 NA NA ...
#>  $ Veddahs                           : int  NA NA NA NA NA NA NA NA NA NA ...
#>  $ Other                             : int  8 53 20 7 18 19 8 7 25 8 ...
```

Obtain summary statistics.

``` r
summary(GNpop_by_EthnicGroup)
```

View the dataset documentation.

``` r
?GNpop_by_EthnicGroup
```

Visualizations

``` r
library(dplyr)
library(sf)
library(ceylon)
library(tidyr)
library(ggplot2)
library(scatterpie)

district_ethnic <- GNpop_by_EthnicGroup |>
  group_by(District_Name) |>
  summarise(
    Sinhalese = sum(Sinhalese, na.rm = TRUE),
    Sri_Lanka_Tamil = sum(Sri_Lanka_Tamil, na.rm = TRUE),
    Indian_Tamil = sum(Indian_Tamil_or_Malaiyaga_Thamilar, na.rm = TRUE),
    Muslim = sum(Sri_Lanka_Moor_or_Muslim, na.rm = TRUE),
    Burgher = sum(Burgher, na.rm = TRUE),
    Malay = sum(Malay, na.rm = TRUE),
    Chetty = sum(Sri_Lanka_Chetty, na.rm = TRUE),
    Bharatha = sum(Bharatha, na.rm = TRUE),
    Veddahs = sum(Veddahs, na.rm = TRUE),
    Other = sum(Other, na.rm = TRUE),
    .groups = "drop"
  ) |>
  mutate(
    DISTRICT = toupper(District_Name),
    DISTRICT = recode(DISTRICT,
                      "MONERAGALA" = "MONARAGALA")
  )


districts <- ceylon::district |>
  filter(DISTRICT != "[UNKNOWN]") |>
  left_join(district_ethnic, by = "DISTRICT")


centroids <- st_centroid(districts)
xy <- st_coordinates(centroids)
centroids$x <- xy[,1]
centroids$y <- xy[,2]


centroids_df <- centroids |>
  st_drop_geometry()


ggplot() +
  geom_sf(
    data = districts,
    fill = "grey98",
    colour = "grey40",
    linewidth = 0.3
  ) +
  geom_scatterpie(
    data = centroids_df,
    aes(x = x, y = y, r = 15000),   # adjust radius as needed
    cols = c(
      "Sinhalese",
      "Sri_Lanka_Tamil",
      "Indian_Tamil",
      "Muslim",
      "Burgher",
      "Malay",
      "Chetty",
      "Bharatha",
      "Veddahs",
      "Other"
    )
  ) +
  scale_fill_brewer(
    palette = "Set1",
    name = "Ethnic Group"
  ) +
  coord_sf() +
  labs(
  title = "District-wise Ethnic Composition of Sri Lanka (2024)"
) +
  theme_void()
```

<img src="man/figures/README-unnamed-chunk-8-1.png" alt="" width="100%" />

## Data Source

The datasets are compiled from the **Sri Lanka Census of Population and
Housing 2024**, published by the Department of Census and Statistics,
Sri Lanka.
