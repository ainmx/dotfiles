require("mason").setup()
require("mason-lspconfig").setup()

local navbuddy = require("nvim-navbuddy")
local navic = require("nvim-navic")

require('mason-lspconfig').setup_handlers{
  function(server)
    require("lspconfig")[server].setup {
		on_attach = function(client, bufnr)
			navbuddy.attach(client, bufnr)
			navic.attach(client,bufnr)
		end,
		-- capabilities = {
		-- 	textDocument = {
		-- 		completion = {
		-- 			completionItem = {
		-- 				snippetSupport = false
		-- 			}
		-- 		}
		-- 	}
		-- }
	}
  end
}
