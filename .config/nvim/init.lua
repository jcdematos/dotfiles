require "config"
require "remaps"
require "git"
require "user_functions"

-- command! Scratch lua require'tools'.makeScratch()

vim.keymap.set('', '-', 'ddp')
vim.keymap.set('', '_', 'ddkP')

vim.g.ale_linters = {
  csh = { "language_server" },
}

vim.g.ale_completion_enable = 1
vim.g.netwr_liststyle = 4
