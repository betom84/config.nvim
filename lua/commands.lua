-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
   callback = function()
      vim.highlight.on_yank()
   end,
   group = highlight_group,
   pattern = '*',
})

-- Show Telescope when opening a directory
-- See https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
local on_vim_enter = function(data)
   local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
   local directory = vim.fn.isdirectory(data.file) == 1

   if no_name or directory then
      print("is emppry or directory")

      if directory then
         vim.cmd.enew()        -- create a new, empty buffer
         vim.cmd.bw(data.buf)  -- wipe the directory buffer
         vim.cmd.cd(data.file) -- change to the directory
      end

      local path = vim.loop.cwd() .. "/.git"
      local ok, _ = vim.loop.fs_stat(path)
      if not ok then
         require('telescope.builtin').find_files()
      else
         require('telescope.builtin').git_files({ show_untracked = true })
      end
   end
end
vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = on_vim_enter })

-- convenience alias
vim.api.nvim_create_user_command('Q', function(_) vim.cmd.quitall() end, {})
