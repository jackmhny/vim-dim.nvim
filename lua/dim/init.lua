local M = {}

-- Default highlight definitions (equivalent to default-light.vim)
local default_light = {
  SpecialKey = {ctermfg = 4},
  TermCursor = {reverse = true},
  NonText = {ctermfg = 12},
  Directory = {ctermfg = 4},
  ErrorMsg = {ctermfg = 15, ctermbg = 1},
  IncSearch = {reverse = true},
  MoreMsg = {ctermfg = 2},
  ModeMsg = {bold = true},
  Question = {ctermfg = 2},
  Title = {ctermfg = 5},
  WarningMsg = {ctermfg = 1},
  WildMenu = {ctermfg = 0, ctermbg = 11},
  Conceal = {ctermfg = 7, ctermbg = 7},
  SpellBad = {ctermbg = 9},
  SpellRare = {ctermbg = 13},
  SpellLocal = {ctermbg = 14},
  PmenuSbar = {ctermbg = 8},
  PmenuThumb = {ctermbg = 0},
  TabLine = {underline = true, ctermfg = 0, ctermbg = 7},
  TabLineSel = {bold = true},
  TabLineFill = {reverse = true},
  CursorColumn = {ctermbg = 7},
  CursorLine = {underline = true},
  MatchParen = {ctermbg = 14},
  Constant = {ctermfg = 1},
  Special = {ctermfg = 5},
  Identifier = {ctermfg = 6},
  Statement = {ctermfg = 3},
  PreProc = {ctermfg = 5},
  Type = {ctermfg = 2},
  Underlined = {underline = true, ctermfg = 5},
  Ignore = {ctermfg = 15},
  Error = {ctermfg = 15, ctermbg = 9},
  Todo = {ctermfg = 0, ctermbg = 11},
}

-- Apply highlights
local function apply_highlights(highlights)
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

-- Setup function for the dim colorscheme
function M.setup_dim()
  -- Clear existing highlights
  vim.cmd('highlight clear')
  if vim.fn.exists('syntax_on') == 1 then
    vim.cmd('syntax reset')
  end
  
  -- Set colorscheme name
  vim.g.colors_name = 'dim'
  
  -- Apply default light highlights first
  apply_highlights(default_light)
  
  -- Dim-specific highlights
  local dim_highlights = {
    -- Diff highlights
    DiffAdd = {ctermfg = 0, ctermbg = 2},
    DiffChange = {ctermfg = 0, ctermbg = 3},
    DiffDelete = {ctermfg = 0, ctermbg = 1},
    DiffText = {ctermfg = 0, ctermbg = 11, bold = true},
    
    -- Visual mode
    Visual = {reverse = true},
    
    -- Search
    Search = {ctermfg = 0, ctermbg = 11},
  }
  
  -- Background-specific highlights
  local bg_highlights = {}
  if vim.o.background == 'light' then
    bg_highlights = {
      LineNr = {ctermfg = 7},
      CursorLineNr = {ctermfg = 8},
      Comment = {ctermfg = 7},
      ColorColumn = {ctermfg = 8, ctermbg = 7},
      Folded = {ctermfg = 8, ctermbg = 7},
      FoldColumn = {ctermfg = 8, ctermbg = 7},
      Pmenu = {ctermfg = 0, ctermbg = 7},
      PmenuSel = {ctermfg = 7, ctermbg = 0},
      SpellCap = {ctermfg = 8, ctermbg = 7},
      StatusLine = {ctermfg = 0, ctermbg = 7, bold = true},
      StatusLineNC = {ctermfg = 8, ctermbg = 7},
      VertSplit = {ctermfg = 8, ctermbg = 7},
      SignColumn = {ctermbg = 7},
    }
  else
    bg_highlights = {
      LineNr = {ctermfg = 8},
      CursorLineNr = {ctermfg = 7},
      Comment = {ctermfg = 8},
      ColorColumn = {ctermfg = 7, ctermbg = 8},
      Folded = {ctermfg = 7, ctermbg = 8},
      FoldColumn = {ctermfg = 7, ctermbg = 8},
      Pmenu = {ctermfg = 15, ctermbg = 8},
      PmenuSel = {ctermfg = 8, ctermbg = 15},
      SpellCap = {ctermfg = 7, ctermbg = 8},
      StatusLine = {ctermfg = 15, ctermbg = 8, bold = true},
      StatusLineNC = {ctermfg = 7, ctermbg = 8},
      VertSplit = {ctermfg = 7, ctermbg = 8},
      SignColumn = {ctermbg = 8},
    }
  end
  
  -- Apply dim highlights
  apply_highlights(dim_highlights)
  apply_highlights(bg_highlights)
  
  -- FZF support
  vim.api.nvim_set_hl(0, 'DimFzfFg', {link = 'Normal'})
  vim.api.nvim_set_hl(0, 'DimFzfBg', {link = 'Normal'})
  vim.api.nvim_set_hl(0, 'DimFzfFgPlus', {link = 'PmenuSel'})
  vim.api.nvim_set_hl(0, 'DimFzfBgPlus', {link = 'PmenuSel'})
  vim.api.nvim_set_hl(0, 'DimFzfInfo', {link = 'Comment'})
  
  vim.api.nvim_set_hl(0, 'DimFzfHl', {ctermfg = 2})
  vim.api.nvim_set_hl(0, 'DimFzfPrompt', {ctermfg = 12})
  vim.api.nvim_set_hl(0, 'DimFzfPointer', {ctermfg = 1})
  vim.api.nvim_set_hl(0, 'DimFzfMarker', {ctermfg = 9})
  
  -- FZF colors configuration
  vim.g.fzf_colors = {
    fg = {'fg', 'DimFzfFg'},
    bg = {'bg', 'DimFzfBg'},
    hl = {'fg', 'DimFzfHl'},
    ['fg+'] = {'fg', 'DimFzfFgPlus'},
    ['bg+'] = {'bg', 'DimFzfbgPlus'},
    ['hl+'] = {'fg', 'DimFzfHl'},
    info = {'fg', 'DimFzfInfo'},
    prompt = {'fg', 'DimFzfPrompt'},
    pointer = {'fg', 'DimFzfPointer'},
    marker = {'fg', 'DimFzfMarker'},
  }
end

-- Setup function for the grim colorscheme
function M.setup_grim()
  -- First apply dim setup
  M.setup_dim()
  
  -- Override with grim-specific settings
  vim.g.colors_name = 'grim'
  
  -- Grim-specific highlights (monochrome)
  local grim_highlights = {}
  if vim.o.background == 'light' then
    grim_highlights = {
      Constant = {ctermfg = 8},
      Identifier = {ctermfg = 0},
      PreProc = {ctermfg = 0, bold = true},
      Special = {ctermfg = 0},
      Statement = {ctermfg = 0, bold = true},
      Title = {ctermfg = 0, bold = true},
      Type = {ctermfg = 0},
      Underlined = {underline = true, ctermfg = 0},
    }
  else
    grim_highlights = {
      Constant = {ctermfg = 7},
      Identifier = {ctermfg = 15},
      PreProc = {ctermfg = 15, bold = true},
      Special = {ctermfg = 15},
      Statement = {ctermfg = 15, bold = true},
      Title = {ctermfg = 15, bold = true},
      Type = {ctermfg = 15},
      Underlined = {underline = true, ctermfg = 15},
    }
  end
  
  apply_highlights(grim_highlights)
end

return M
