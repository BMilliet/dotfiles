local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'preservim/nerdtree'
  use 'arcticicestudio/nord-vim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- NerdTree options
-- vim.cmd [[
--   let NERDTreeShowHidden=1
--   let NERDTreeIgnore=['^.git$', '.DS_Store', 'node_modules', '.next']
--   let NERDTreeShowLineNumbers=1
-- ]]
