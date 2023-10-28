local M = {}

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'Q', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keep cursor centered when jumping around
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selection up" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "replace and keep buffer" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete without buffer" })

-- GIT
vim.keymap.set("n", "<leader>Gb", vim.cmd.Git, { desc = "[b]rowse" })
vim.keymap.set("n", "<leader>Gs", require('telescope.builtin').git_status, { desc = "[s]tatus" })
vim.keymap.set("n", "<leader>Gl", require('telescope.builtin').git_commits, { desc = "[l]og" })
vim.keymap.set("n", "<leader>Gr", require('telescope.builtin').git_branches, { desc = "b[r]anches" })
vim.keymap.set("n", "<leader>Gt", require('telescope.builtin').git_branches, { desc = "s[t]ash" })

-- Treesitter
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = '[d]iagnostics: [p]revious message' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = '[d]iagnostics: [n]ext message' })
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = '[d]iagnostics: open [f]loating message' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = '[d]iagnostics: open list' })
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Telescope
vim.keymap.set('n', '<leader>fc', function()
   -- You can pass additional configuration to telescope to change theme, layout, etc.
   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
   })
end, { desc = '[c]urrent buffer' })
vim.keymap.set('n', '<leader><space>', function() require('telescope.builtin').git_files({ show_untracked = true }) end,
   { desc = 'git files' })
vim.keymap.set('n', '<leader>fu', require('telescope.builtin').buffers, { desc = 'b[u]ffers' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[f]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[h]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'current [w]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'by [g]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[d]iagnostics' })
vim.keymap.set('n', '<leader>fa', require('telescope.builtin').resume, { desc = '[a]gain' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = '[r]ecently opened files' })
vim.keymap.set('n', '<leader>fb', require('telescope').extensions.file_browser.file_browser, { desc = '[b]rowser' })

-- DAP
vim.keymap.set('n', '<leader>bU', require('dapui').toggle, { desc = 'toggle [U]I' })
vim.keymap.set({ 'n', 'v' }, '<leader>be', require('dapui').eval, { desc = '[e]val' })
vim.keymap.set('n', '<leader>bc', require('dap').continue, { desc = '[c]ontinue' })
vim.keymap.set('n', '<leader>bs', require('dap').step_into, { desc = '[s]tep into' })
vim.keymap.set('n', '<leader>bo', require('dap').step_out, { desc = 'step [o]ut' })
vim.keymap.set('n', '<leader>bj', require('dap').step_over, { desc = '[j]ump over' })
vim.keymap.set('n', '<leader>bb', require('dap').toggle_breakpoint, { desc = 'toogle [b]reakpoint' })
vim.keymap.set('n', '<leader>bR', require('dap').repl.open, { desc = '[R]EPL' })
vim.keymap.set('n', '<leader>bB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
   { desc = 'conditional [b]reakpoint' })
vim.keymap.set('n', '<leader>bL', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Message: ')) end,
   { desc = '[l]og breakpoint' })

-- LSP
M.lsp_keymaps_on_buffer = function(_, bufnr)
   local nmap = function(keys, func, desc)
      if desc then
         desc = desc .. ' (lsp)'
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
   end

   nmap('<leader>r', vim.lsp.buf.rename, '[r]ename')
   nmap('<leader>c', vim.lsp.buf.code_action, '[c]ode action')
   nmap('gd', require('telescope.builtin').lsp_definitions, 'go to definition')
   nmap('gr', require('telescope.builtin').lsp_references, 'go to references')
   nmap('gi', require('telescope.builtin').lsp_implementations, 'go to implementation')
   nmap('<leader>d', require('telescope.builtin').lsp_type_definitions, 'type [d]efinition')
   nmap('<leader>sd', require('telescope.builtin').lsp_document_symbols, '[s]ymbols [d]ocument')
   nmap('<leader>sw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[s]ymbols [w]orkspace')

   -- See `:help K` for why this keymap
   nmap('K', vim.lsp.buf.hover, 'show documentation')
   nmap('<C-k>', vim.lsp.buf.signature_help, 'show signature')

   -- Lesser used LSP functionality
   nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
   nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[w]orkspace [a]dd folder')
   nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[w]orkspace [r]emove folder')
   nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
   end, '[w]orkspace [l]ist folders')

   -- Create a command `:Format` local to the LSP buffer
   vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
   end, { desc = 'Format current buffer with LSP' })
   nmap('<leader>F', vim.lsp.buf.format, '[F]ormat current buffer')
end

-- Which-Key groups
require('which-key').register {
   ['<leader>G'] = { name = '[G]it', _ = 'which_key_ignore' },
   ['<leader>f'] = { name = '[f]ind', _ = 'which_key_ignore' },
   ['<leader>s'] = { name = '[s]ymbols', _ = 'which_key_ignore' },
   ['<leader>w'] = { name = '[w]orkspace', _ = 'which_key_ignore' },
   ['<leader>d'] = { name = '[d]iagnostics', _ = 'which_key_ignore' },
   ['<leader>b'] = { name = 'de[b]ug', _ = 'which_key_ignore' },
}

return M
