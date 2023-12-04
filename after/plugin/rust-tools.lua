local rt = require("rust-tools")

local root_dir = require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json")

rt.setup({
   server = {
      on_attach = function(_, bufnr)
         require("keymaps").lsp_keymaps_on_buffer(bufnr, "rust_analyzer")
         require("commands").lsp_commands_on_buffer(bufnr)

         -- Hover actions
         -- vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions,
         --    { buffer = bufnr, desc = "hover actions (rust)" })

         -- Code action groups
         -- vim.keymap.set("n", "<leader>c", rt.code_action_group.code_action_group,
         --    { buffer = bufnr, desc = "[c]ode action (rust)" })

         vim.keymap.set("n", "<leader>ba", function() vim.cmd("RustDebuggables") end,
            { buffer = bufnr, desc = "[a]ttach target (rust)" })
      end,

      settings = {
         -- to enable rust-analyzer settings visit:
         -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
         ["rust-analyzer"] = {
            -- enable clippy on save
            checkOnSave = {
               command = "clippy",
            },
         },
      },

      root_dir = root_dir,
   },

   tools = {
      hover_actions = {
         border = 'none',
      },

      inlay_hints = {
         max_len_align = true,
         show_parameter_hints = false,
      },
   },

   dap = {
      adapter = {
         type = "server",
         port = "${port}",
         executable = {
            command = "codelldb",
            args = { "--port", "${port}" },
         },
         name = "rt_lldb",
      },
   },
})
