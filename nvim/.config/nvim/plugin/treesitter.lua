local parsers = {
  'astro',
  'bash',
  'c',
  'css',
  'diff',
  'gdscript',
  'gdshader',
  'html',
  'javascript',
  'json',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'svelte',
  'typescript',
  'vim',
  'vimdoc',
  'zig',
}

vim.pack.add({
  { src = _G.gh('nvim-treesitter/nvim-treesitter'), version = 'main' },
})

require('nvim-treesitter').install(parsers)

require('nvim-treesitter.config').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local buf, filetype = args.buf, args.match
    local lang = vim.treesitter.language.get_lang(filetype)

    if not lang then return end
    if not vim.treesitter.language.add(lang) then return end

    vim.treesitter.start(buf, lang)

    local has_indent_query = vim.treesitter.query.get(lang, 'indents') ~= nil
    if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
  end,
})
