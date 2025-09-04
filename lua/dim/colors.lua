-- Helper module for color utilities
local M = {}

-- Setup dim colorscheme
function M.dim()
  require('dim').setup_dim()
end

-- Setup grim colorscheme
function M.grim()
  require('dim').setup_grim()
end

return M
