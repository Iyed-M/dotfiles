M = {}
M.nero1 = function()
  local utils = require("user.utils")

  local hue = 255
  local sat = 60
  local lum = 9
  local bgs = utils.gen_backgrounds({ hue, sat, lum })

  local crust = bgs.crust
  local mantle = bgs.mantle
  local base = bgs.base
  local surface0 = bgs.surface0
  local surface1 = bgs.surface1
  local surface2 = bgs.surface2
  local overlay0 = bgs.overlay0
  local overlay1 = bgs.overlay1
  local overlay2 = bgs.overlay2
  return {
    green = "#25da80",
    teal = "#25dabc",
    sky = "#26C6DA", -- hsl(187, 71%, 50%) -- 187
    sapphire = "#6a85f0", -- hsl(210, 89%, 63%) -- 208 hsl(208, 86%, 62%)
    blue = "#4ba4f1", -- hsl(227, 78%, 68%) -- 228 hsl(227, 82%, 68%)
    lavender = "#8b7bef", -- hsl(257, 80%, 68%) -- 248 hsl(248, 78%, 71%)
    mauve = "#ab6cef", -- hsl(267, 75%, 67%) -- 269 hsl(269, 80%, 68%)
    flamingo = "#df82f2", -- hsl(280, 83%, 66%) -- 290 hsl(290, 81%, 73%)
    pink = "#f060d8", -- hsl(310, 83%, 66%) -- 310 hsl(310, 83%, 66%)
    rosewater = "#ee95e0",
    red = "#f06292",
    peach = "#FFB74D",
    yellow = "#FFEB3B",
    crust = crust,
    mantle = mantle,
    base = base,
    surface0 = surface0,
    surface1 = surface1,
    surface2 = surface2,
    overlay0 = overlay0,
    overlay1 = overlay1,
    overlay2 = overlay2,
  }
end

M.nero2 = function()
  local utils = require("user.utils")

  local hue = 255
  local sat = 60
  local lum = 9
  local bgs = utils.gen_backgrounds({ hue, sat, lum })

  local crust = bgs.crust
  local mantle = bgs.mantle
  local base = bgs.base

  return {
    green = "#90dc89", -- hsl(115, 54%, 76%) --> hsl(115, 54%, 70%)
    teal = "#41d2ba", -- hsl(170, 57%, 73%) --> hsl(170, 62%, 54%)
    sky = "#2ec1dc", -- hsl(189, 71%, 73%) --> hsl(189, 71%, 52%)
    sapphire = "#32b1ec", -- hsl(199, 76%, 69%) --> hsl(199, 83%, 56%)
    blue = "#59a8f8", -- hsl(217, 92%, 76%) --> hsl(210, 92%, 66%)
    lavender = "#b2b6ff", -- hsl(232, 97%, 85%) --> hsl(239, 87%, 77%)
    mauve = "#a879e2", -- hsl(267, 84%, 81%) --> hsl(267, 64%, 68%)
    flamingo = "#e8a6a6", -- hsl(0, 59%, 88%) --> hsl(0, 59%, 78%)
    pink = "#ee96d6", -- hsl(316, 72%, 86%) --> hsl(316, 72%, 76%)
    rosewater = "#edbbb1", -- hsl(10, 56%, 91%) --> hsl(10, 62%, 81%)
    red = "#ef6b91", -- hsl(343, 81%, 75%) --> hsl(343, 81%, 68%)
    peach = "#f18b74", -- hsl(23, 92%, 75%) --> hsl(11, 82%, 70%)
    yellow = "#f6d484", -- hsl(41, 86%, 83%) --> hsl(42, 86%, 74%)
    crust = crust,
    mantle = mantle,
    base = base,
    surface0 = bgs.surface0,
    surface1 = bgs.surface1,
    surface2 = bgs.surface2,
    overlay0 = bgs.overlay0,
    overlay1 = bgs.overlay1,
    overlay2 = bgs.overlay2,
  }
end
M.nero3 = function()
  local utils = require("user.utils")

  local hue = 255
  local sat = 60
  local lum = 9
  local bgs = utils.gen_backgrounds({ hue, sat, lum })

  local crust = bgs.crust
  local mantle = bgs.mantle
  local base = bgs.base

  return {
    green = "#90dc89", -- hsl(115, 54%, 76%) --> hsl(115, 54%, 70%)
    teal = "#41d2ba", -- hsl(170, 57%, 73%) --> hsl(170, 62%, 54%)
    sky = "#66e4fd", -- hsl(189, 71%, 73%) --> hsl(189, 71%, 52%)
    sapphire = "#32b1ec", -- hsl(199, 76%, 69%) --> hsl(199, 83%, 56%)
    blue = "#59a8f8", -- hsl(217, 92%, 76%) --> hsl(210, 92%, 66%)
    lavender = "#b2b6ff", -- hsl(232, 97%, 85%) --> hsl(239, 87%, 77%)
    mauve = "#a879e2", -- hsl(267, 84%, 81%) --> hsl(267, 64%, 68%)
    flamingo = "#e8a6a6", -- hsl(0, 59%, 88%) --> hsl(0, 59%, 78%)
    pink = "#ee96d6", -- hsl(316, 72%, 86%) --> hsl(316, 72%, 76%)
    rosewater = "#edbbb1", -- hsl(10, 56%, 91%) --> hsl(10, 62%, 81%)
    red = "#ef6b91", -- hsl(343, 81%, 75%) --> hsl(343, 81%, 68%)
    peach = "#f18b74", -- hsl(23, 92%, 75%) --> hsl(11, 82%, 70%)
    yellow = "#f6d484", -- hsl(41, 86%, 83%) --> hsl(42, 86%, 74%)
    crust = crust,
    mantle = mantle,
    base = base,
    surface0 = bgs.surface0,
    surface1 = bgs.surface1,
    surface2 = bgs.surface2,
    overlay0 = bgs.overlay0,
    overlay1 = bgs.overlay1,
    overlay2 = bgs.overlay2,
  }
end
return M
