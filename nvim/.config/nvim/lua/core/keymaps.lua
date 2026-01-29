local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable spacebar key default behaviour in normal and visual mode
map({ 'n', 'v' }, '<space>', '<Nop>', opts)

-- Exit terminal mode in the builtin terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Save file without autoformatting
map('n', '<M-s>', '<cmd>noautocmd w<CR>', opts)

-- Delete single character without replacing register
map('n', 'x', '"_x', opts)

-- Toggle line wrapping
map('n', '<leader>tw', '<cmd>set wrap!<CR>', { desc = '[T]oggle Line [W]rap' })

-- Toggle spell check
map('n', '<leader>ts', '<cmd>set spell!<CR>', { desc = '[T]oggle [S]pell Check' })

-- Keep last yanked when pasting
map('v', 'p', '"_dP', opts)

-- End of the word backwards
map('n', 'E', 'ge', opts)

-- U for redo
map('n', 'U', '<C-r>', opts)

-- Increment/decrement numbers
map('n', '<leader>=', '<C-a>', { desc = 'Increment number under cursor' })
map('n', '<leader>-', '<C-x>', { desc = 'Decrement number under cursor' })

-- Vertical scroll and center cursor
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- Find and center cursor when jumping search
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Identation in normal mode
map('n', '>', '>>', opts)
map('n', '<', '<<', opts)

-- Stay in indent mode when in visual mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- File navigation
-- map('n', '<leader>o', ':Explore<CR>', { desc = '[O]pen Explorer' })
-- map('n', '<leader>ff', ':find ', { desc = '[F]ind [F]ile' })

-- Resize splits with arrows
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Buffer management
map('n', '<Tab>', ':bnext<CR>', opts) -- next buffer
map('n', '<S-Tab>', ':bprevious<CR>', opts) -- previous buffer
map('n', '<leader>wd', ':bdelete!<CR>', { desc = '[D]elete Buffer' })
map('n', '<leader>wb', ':enew <CR>', { desc = '[B]uffer New' })
map('n', '<leader>wo', ':tabnew %<CR>', { desc = '[O]pen current buffer in new tab' })
map('n', '<leader>wC', ':%bd|e#|bd#<CR>', { silent = true, desc = '[C]lose all buffers except current one' })

-- Tab management
map('n', '<leader>wn', ':tabnew<CR>', { desc = '[N]ew Tab' })
map('n', '<leader>wc', ':tabclose<CR>', { desc = '[C]lose Tab' })
map('n', '<leader>w]', ':tabn<CR>', { desc = 'Next Tab' })
map('n', '<leader>w[', ':tabp<CR>', { desc = 'Prev Tab' })

-- Window management
map('n', '<leader>wv', '<C-w>v', { desc = '[V]ertical Split' })
map('n', '<leader>wh', '<C-w>s', { desc = '[H]orizontal Split' })
map('n', '<leader>we', '<C-w>=', { desc = '[E]qual Split' })
map('n', '<leader>wq', ':close<CR>', { desc = '[Q]Close Split' })

-- Navigate between splits
map('n', '<C-k>', ':wincmd k<CR>', opts)
map('n', '<C-j>', ':wincmd j<CR>', opts)
map('n', '<C-h>', ':wincmd h<CR>', opts)
map('n', '<C-l>', ':wincmd l<CR>', opts)

-- Move lines up and down
map('n', '<M-j>', ':m .+1<CR>==', opts)
map('n', '<M-k>', ':m .-2<CR>==', opts)
map('v', '<M-j>', ":m '>+1<CR>gv=gv", opts)
map('v', '<M-k>', ":m '<-2<CR>gv=gv", opts)

-- Cursor navigation on insert mode
map('i', '<M-h>', '<left>', opts) -- Move Cursor Left
map('i', '<M-j>', '<down>', opts) -- Move Cursor Down
map('i', '<M-k>', '<up>', opts) -- Move Cursor Up
map('i', '<M-l>', '<right>', opts) -- Move Cursor Right
map('i', '<M-b>', '<C-o>b', opts) -- Move backwards one word
map('i', '<M-w>', '<C-o>w', opts) -- Move forwards one word
map('i', '<M-a>', '<Home>', opts) -- Start of line
map('i', '<M-e>', '<End>', opts) -- End of line
map('i', '<M-u>', '<C-o>u', opts) -- Undo
-- <M-O> - Insert line prev
-- <M-o> - Insert line next
-- <C-m> - Carriage Return
-- <C-w> - Delete one word backwards
-- <C-h> - Delete one character backwards
-- <C-u> - Delete full line left of cursor

-- Search current word in brave
local searching_brave = function() vim.fn.system({ 'xdg-open', 'https://search.brave.com/search?q=' .. vim.fn.expand('<cword>') }) end
map('n', '<leader>?', searching_brave, { desc = 'Search Current Word on Brave Search' })

-- Copy full file path to clipboard
local cp_file_path = function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  print('File:', path)
end
map('n', '<leader>cp', cp_file_path, { desc = '[C]opy full file [P]ath' })
