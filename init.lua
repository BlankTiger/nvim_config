vim.opt.termguicolors = true

require('config.prepare_lazy')
local plugins = require('user.plugins')
require('lazy').setup(plugins)
require('config.settings')
require('user.autocmds')
