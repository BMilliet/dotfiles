local options = {
  syntax = "on",
  background = "dark",
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  mouse = "a",
  number = true,
  relativenumber = true,
  smartindent = true,
  wrap = false,
  signcolumn = "yes",
  scrolloff = 10,
  swapfile = false,
  backup = false,
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 2,
  backup = false,
  hlsearch = false,
  errorbells = false,
--  colorcolumn = 80
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
