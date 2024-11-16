function toggle_relativenumber()
  vim.o.relativenumber = not vim.o.relativenumber
end

vim.g.maplead = " ";
vim.keymap.set("n", "<leader>rr", toggle_relativenumber);
-- vim.keymap.set("n", "jj", vim.cmd.startinsert);
-- vim.keymap.set("n", "kk", vim.cmd.startinsert);
-- Do some mapping to save file vim.keymap.set("n", "<leader>jj", vim.cmd.w);

-- Open a plugin
vim.keymap.set("n", "<leader>e", vim.cmd.Explore);
vim.keymap.set("n", "<leader>t", vim.cmd.terminal);

-- Buffer mappings
vim.keymap.set("n", "<leader>bl", vim.cmd.ls);
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext);
vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious);
vim.keymap.set("n", "<leader>bc", vim.cmd.lclose)
