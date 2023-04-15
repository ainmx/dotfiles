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
	}
  end
}

local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
