vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

HOME = os.getenv("HOME")

local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

-- Keymapping (most of which is in whichkey config in lua/user/whichkey.lua) --
g.mapleader = ','
g.maplocalleader = ','

-- User settings --
opt.mouse = 'a'
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.ignorecase = true
opt.smartcase = true
opt.softtabstop = 4
opt.cursorline = true
opt.relativenumber = true
opt.signcolumn = 'number'
opt.syntax = 'on'
opt.encoding = 'utf-8'
opt.guifont = 'Hack Nerd Font'
opt.shell = '/bin/zsh'
opt.scrolloff = 8
g.neovide_transparency = 1
g.do_filetype_lua = 1
g.oxcarbon_lua_keep_terminal = 1
g.vimtex_view_method = 'zathura'
g.vimtex_quickfix_enabled = 0
g.vimtex_compiler_latexmk = {
        callback = 1,
        continuous = 1,
        executable = 'latexmk',
        options = {
                '-pvc',
                '-synctex=1',
                '-interaction=nonstopmode',
                '-pdf',
        },
}
g.silicon = {
        theme = 'TwoDark',
        font = 'Hack',
        background = '#555555',
            ['shadow-color'] = '#333333',
            ['line-pad'] = 2,
            ['pad-horiz'] = 80,
            ['pad-vert'] = 100,
            ['shadow-blur-radius'] = 5,
            ['shadow-offset-x'] = 4,
            ['shadow-offset-y'] = 4,
            ['line-number'] = true,
            ['round-corner'] = true,
            ['window-controls'] = true,
}

g.jukit_inline_plotting = 0
-- g.python3_host_prog = HOME .. '/.local/venv/nvim/Scripts/python.exe'

-- Set colorscheme
vim.cmd('colorscheme catppuccin')
--[[ opt.termguicolors = true ]]
--[[ cmd('hi Normal guibg=NONE ctermbg=NONE') ]]
