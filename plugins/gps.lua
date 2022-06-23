-- custom/plugins/gps.lua

local present, gps = pcall(require, "nvim-gps")

if not present then
   return
end

gps.setup {
   icons = {
      ["class-name"] = "ﴯ ", -- Classes and class-like objects
      ["function-name"] = " ", -- Functions
      ["method-name"] = " ", -- Methods (functions inside class-like objects)
      ["container-name"] = "⛶ ", -- Containers (example: lua tables)
      ["tag-name"] = " ", -- Tags (example: html tags)
   },
   separator = "  ",
}
