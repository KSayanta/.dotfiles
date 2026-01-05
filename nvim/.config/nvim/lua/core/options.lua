local set = vim.o

-- Global settings
vim.g.editorconfig = true
vim.g.have_nerd_font = true
vim.g.custom_theme = false
vim.g.transparent_enabled = true

-- Basic settings
set.number = true
set.relativenumber = true
set.cursorline = true
set.wrap = false
set.scrolloff = 10
set.sidescrolloff = 8
set.shortmess = 'CFOSWaco'
set.switchbuf = 'usetab'

-- Identation
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.smartindent = true
set.autoindent = true
set.breakindent = true

-- Search settings
set.ignorecase = true
set.smartcase = true
set.hlsearch = false
set.incsearch = true
set.inccommand = 'split'

-- Visual settings
-- set.winborder = 'rounded'
set.termguicolors = true
set.signcolumn = 'yes'
set.textwidth = 100
set.colorcolumn = '+1'
set.showmatch = true
set.matchtime = 2
set.cmdheight = 1
set.completeopt = 'menuone,noinsert,noselect'
set.showmode = false
set.pumheight = 10
set.pumblend = 30
set.winblend = 0
set.conceallevel = 0
set.concealcursor = ''
set.lazyredraw = true
set.synmaxcol = 300
set.fillchars = 'eob: '
set.listchars = 'extends:…,nbsp:␣,precedes:…,tab:> '

-- File handling
set.confirm = true
set.backup = false
set.writebackup = false
set.swapfile = false
set.undofile = true
set.updatetime = 250
set.timeoutlen = 300
set.ttimeoutlen = 0
set.autoread = true
set.autowrite = false

-- Behavior settings
set.hidden = true
set.errorbells = false
set.backspace = 'start,eol,indent'
set.autochdir = false
set.selection = 'exclusive'
set.mouse = 'a'
set.modifiable = true
set.encoding = 'UTF-8'
set.splitbelow = true
set.splitright = true
set.splitkeep = 'screen'
set.spelloptions = 'camel'
vim.opt.iskeyword:append('-')
vim.opt.isfname:append('@-@')
vim.opt.path:append('**')
vim.opt.clipboard:append('unnamedplus')

-- Command-line completion
set.wildmenu = true
set.wildmode = 'longest:full,full'
vim.opt.wildignore:append({ '*.o', '*.obj', '*.class' })

-- Performance improvements
set.redrawtime = 10000
set.maxmempattern = 20000
