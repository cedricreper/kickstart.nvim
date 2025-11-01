-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command('Cur', function()
  local path = vim.fn.fnamemodify(vim.fn.expand '%:p:h', ':t') .. '/' .. vim.fn.expand '%:t'
  vim.fn.setreg('+', path) -- copy to system clipboard
  print('Copied: ' .. path)
end, {})
