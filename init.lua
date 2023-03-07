vim.opt.termguicolors = true

require('user.prepare_lazy')
local plugins = require('user.plugins')
require('lazy').setup(plugins)
require('user.load_plugin_configs')

require('user.settings')
