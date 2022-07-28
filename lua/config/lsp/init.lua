local lspconfig = require('lspconfig')

local servers = { 'pyright' , 'sumneko_lua', 'ansiblels', 'bashls', 'jsonls', 'marksman' }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {}
end

