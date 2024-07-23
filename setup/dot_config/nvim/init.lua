-- Configure runtimepath
vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")

vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Favorite themes
-- "gruvbox-community/gruvbox"

require("lazy").setup({
  { 'williamboman/mason.nvim', config = true },
  { 'williamboman/mason-lspconfig.nvim', config = true },
  { "neovim/nvim-lspconfig" },
  { "ziglang/zig.vim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
	{ "rebelot/kanagawa.nvim" },
	{ "windwp/nvim-autopairs", config = true },
}, opts)

vim.cmd.colorscheme "kanagawa"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus" -- Usar el portapapeles del sistema
vim.opt.incsearch = true        -- Resaltar coincidencias mientras se escribe la búsqueda
vim.opt.scrolloff = 10           -- Mantener más líneas visibles alrededor del cursor

local lspconfig = require('lspconfig')
local cmp = require('cmp')
local autopairs = require('nvim-autopairs')

cmp.setup {
  sources = {
    { name = 'nvim_lsp' }
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-space>'] = cmp.mapping.complete(),
  }),
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    -- vim.api.nvim_buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
})

lspconfig.clangd.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
  end,
})

lspconfig.zls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
  end,
})

