local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = true,
		native_menu = false,
	},
	formatting = {
		format = lspkind.cmp_format({with_text = false, maxwidth = 50})
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},
	sources = {
		{ name = "nvim_lsp" },
		-- { name = "luasnip" },
		{ name = "buffer" },
	},
	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-Space>'] = cmp.mapping.complete(),
	}
})

require("cmp").setup({
    sources = {
        { name = 'cmp_tabnine' },
    },
	map_cr = true, --  map <CR> on insert mode
	map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
	auto_select = true, -- automatically select the first item
	insert = false, -- use insert confirm behavior instead of replace
	map_char = { -- modifies the function or method delimiter by filetypes
	all = '(',
	tex = '{'
}
})

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
	max_lines = 1000;
	max_num_results = 20;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
	ignored_file_types = { -- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	};
	show_prediction_strength = false;
})
