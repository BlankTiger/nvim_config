vim.opt.termguicolors = true

require('config.prepare_lazy')
local plugins = require('config.plugins')
require('lazy').setup(plugins)
require('config.settings')
