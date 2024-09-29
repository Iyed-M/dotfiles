local M = {}

M.rgb_to_hex = function(rgb)
  local hex = "#"
  for i = 1, 3 do
    local value = math.floor(rgb[i] * 255 + 0.5)
    hex = hex .. string.format("%02x", value)
  end
  return hex
end

M.hsl_to_hex = function(hsl)
  local hsluv = require("tokyonight.hsluv")
  local rgb = hsluv.hsluv_to_rgb(hsl)
  local hex = M.rgb_to_hex(rgb)
  return hex
end


M.gen_backgrounds = function(tuple)
  local bgs = {}
  local utils = require("user.utils")

  -- tuple = { hue, sat, lum }
  local hue = tuple[1]
  local sat = tuple[2]
  local lum = tuple[3]
  local base_hsl = { hue, sat, lum }

  local crust_hsl = { hue, sat + 2, lum - 6 }
  local mantle_hsl = { hue, sat, lum - 3 }
  local surface0_hsl = { hue - 3, sat - 7, lum + 14 }
  local surface1_hsl = { hue - 6, sat - 10, lum + 22 }
  local surface2_hsl = { hue - 7, sat - 11, lum + 30 }
  local overlay0_hsl = { hue - 9, sat - 12, lum + 38 }
  local overlay1_hsl = { hue - 10, sat - 10, lum + 46 }
  local overlay2_hsl = { hue - 12, sat - 6, lum + 55 }

  bgs.crust = utils.hsl_to_hex(crust_hsl)
  bgs.mantle = utils.hsl_to_hex(mantle_hsl)
  bgs.base = utils.hsl_to_hex(base_hsl)
  bgs.surface0 = utils.hsl_to_hex(surface0_hsl)
  bgs.surface1 = utils.hsl_to_hex(surface1_hsl)
  bgs.surface2 = utils.hsl_to_hex(surface2_hsl)
  bgs.overlay0 = utils.hsl_to_hex(overlay0_hsl)
  bgs.overlay1 = utils.hsl_to_hex(overlay1_hsl)
  bgs.overlay2 = utils.hsl_to_hex(overlay2_hsl)
  return bgs
end


return M
