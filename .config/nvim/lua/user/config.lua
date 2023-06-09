-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "
-- require("everforest").setup({
--   background = "hard",
-- })

-- require('noirbuddy').setup {
--   preset = 'kiwi',
-- }

vim.cmd([[

set mouse=a	
set number
set termguicolors
set tabstop=4
set shiftwidth=4
set nohlsearch

nnoremap <SPACE> <Nop>
let mapleader=" "

" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O
" inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
" inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
" inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
" inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"


set completeopt-=preview

let @i = '55A ýad55|i'

nnoremap <Leader>e :NvimTreeToggle<CR>
nnoremap <Leader>f :Telescope<CR>
nnoremap <Leader>k :TablineBufferNext<CR>
nnoremap <Leader>j :TablineBufferPrevious<CR>
nnoremap <leader>m :lua require('memento').toggle()<CR>
nnoremap <leader>b :TroubleToggle<CR>
nnoremap <leader>t :lua require("FTerm").toggle()<CR>
nnoremap <leader>n :Navbuddy<CR>
nnoremap <leader>p :Telescope projects<CR>
nnoremap <leader>r :Telescope lsp_references<CR>
nnoremap <leader>d :Telescope lsp_definitions<CR>
nnoremap <leader>ha :HopAnywhere<CR>
nnoremap <leader>hc :HopChar2<CR>
nnoremap <leader>hl :HopLineStart<CR>
nnoremap <leader>hv :HopVertical<CR>
nnoremap <leader>hp :HopPattern<CR>
nnoremap <leader>hw :HopWord<CR>
nnoremap <leader>gd :Gitsigns preview_hunk<CR>
nnoremap <leader>gi :Gitsigns preview_hunk_inline<CR>
nnoremap <leader>gn :Gitsigns next_hunk<CR>
nnoremap <leader>gp :Gitsigns prev_hunk<CR>
nnoremap <leader>u :Telescope undo<CR>

set signcolumn=number

let g:neovide_scale_factor=0.65

let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/vimwiki/','syntax': 'markdown', 'ext': '.md'}]


colorscheme kanagawa

]])

vim.notify = require("notify")

require("notify").setup()

require("colorizer").setup()

require("project_nvim").setup {}

require'tabline'.setup {enable = false}

require("hop").setup{ keys = 'etovxqpdygfblzhckisuran' }

require("transparent").setup()

require("nvim-autopairs").setup()

require("glow").setup()

--require'neuron'.setup {
--    virtual_titles = true,
--    mappings = true,
--    run = nil, -- function to run when in neuron dir
--    neuron_dir = "~/Documents/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
--    leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
--}

local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('renderer', wilder.popupmenu_renderer(
	wilder.popupmenu_border_theme({
		highlights = {
			border = 'Normal', -- highlight to use for the border
			accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#d3c6aa'}}),
		},
		border = 'rounded',
		highlighter = {
			wilder.basic_highlighter(),
		},
	})
))

wilder.set_option('pipeline', {
	wilder.branch(
		wilder.cmdline_pipeline({
			fuzzy = 1,
		}),
		wilder.vim_search_pipeline({
			pattern = wilder.python_fuzzy_pattern({
				start_at_boundary = 0,
			}),
		})
	)
})

local navic = require("nvim-navic")

require'lualine'.setup {
	tabline = {
		lualine_a = {},
		lualine_b = {require'tabline'.tabline_buffers},
		lualine_c = {
            {
              function()
                  return navic.get_location()
              end,
              cond = function()
                  return navic.is_available()
              end
            },
        },
		lualine_x = { require'tabline'.tabline_tabs },
		lualine_y = {},
		lualine_z = {},
	},
	-- options = {
	-- 	theme = "vscode",
	-- },
}
