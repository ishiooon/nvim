local ns = vim.api.nvim_create_namespace('showcmd_msg')
local showcmd_msg
vim.ui_attach(ns, {ext_messages=true}, function(event, ...)
  if event == 'msg_showcmd' then
    local content = ...
    showcmd_msg = #content > 0 and content[1][2] or ''
  end
end)

return{
	{
		'nvim-lualine/lualine.nvim',
	    	dependencies = {
	      		'nvim-tree/nvim-web-devicons',
			    'arkav/lualine-lsp-progress',
	    	},
		opts = {

			  options = {
			    icons_enabled = true,
			    theme = 'auto',
			    component_separators = { left = '', right = ''},
			    section_separators = { left = '', right = ''},
			    disabled_filetypes = {
			      statusline = {},
			      winbar = {},
			    },
			    ignore_focus = {},
			    always_divide_middle = true,
			    globalstatus = false,
			    refresh = {
			      statusline = 1000,
			      tabline = 1000,
			      winbar = 1000,
			    }
			  },
			  sections = {
			    lualine_a = {'mode'},
			    lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename',
                    {
                        function()
                            return require("dap").status()
                        end,
                        icon = { "", color = { fg = "#e7c664" } }, -- nerd icon.
                        cond = function()
                          if not package.loaded.dap then
                            return false
                          end
                          local session = require("dap").session()
                          return session ~= nil
                        end,
                      },
                },
			    lualine_x = {function() return showcmd_msg end, 'encoding', 'fileformat', 'filetype'},
			    lualine_y = {'progress'},
                -- 時計アイコンと時分を表示
                lualine_z = {
                    'location',
                    function()
                        return " " .. os.date("%H:%M")
                    end,
                },
			  },
			  inactive_sections = {
			    lualine_a = {},
			    lualine_b = {},
			    lualine_c = {'filename'},
			    lualine_x = {'location'},
			    lualine_y = {},
			    lualine_z = {}
			  },
			  tabline = {},
			  winbar = {},
			  inactive_winbar = {},
			  extensions = {}
		}
	}
}
