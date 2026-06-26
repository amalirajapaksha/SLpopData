library(hexSticker)
library(showtext)
font_add_google("Roboto", "roboto")
showtext_auto()

sticker(
  subplot = "inst/sticker/SriLanka (2).png",
  package = "SLpop",
  p_size = 20,
  p_color = "#004225",
  p_x = 1,       # horizontal position (1 = center)
  p_y = 1.6,     # vertical position (lower than default
  s_x = 1,     # slight right shift
  s_y = 0.65,     # slight downward shift
  s_width = 0.65, # enlarge icon
  s_height = 0.5,
  h_fill = "#5F9EA0",  # light yellow background
  h_color = "#0B5D4B", # blue border
  filename = "man/figures/SLpop_hexSticker.png",
  dpi = 300
)

