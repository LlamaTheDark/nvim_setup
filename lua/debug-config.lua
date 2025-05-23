local dap      = require('dap')
local dapui    = require('dapui')

dap.adapters.php = {
	type = 'executable',
	command = 'node',
	args = { os.getenv("HOME") .. '/dev/vscode-php-debug/out/phpDebug.js' },
}

dap.configurations.php = {
	{
		-- Listen for Xdebug
		type = 'php',
		request = 'launch',
		name = 'Listen for Xdebug',
		port = 9003,
		cwd = vim.fn.getcwd(),
		pathMappings = {
			-- map your host project root to the container’s path
			["/var/www/"] = "/home/smooose/fsl-www/",
			-- ["/var/www/public/"] = "/home/smooose/fsl-www/public/",
			-- ["/var/www/includes/"] = "/home/smooose/fsl-www/includes/",

		},
	},
}

-- 2.1 Configure the UI:
dapui.setup({
	layouts = {
		{
			elements = {
				'scopes',
				'breakpoints',
				'stacks',
				'watches',
			},
			size = 40,           -- 40 columns
			position = 'left',   -- where to put it
		},
		{
			elements = {
				'repl',
				'console',
			},
			size = 10,           -- 10 lines
			position = 'bottom', -- where to put it
		},
	},
})

-- 2.2 Open/close dap-ui automatically
dap.listeners.after.event_initialized['dapui_config'] = function()
	dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
	dapui.close()
end
dap.listeners.before.event_exited['dapui_config']     = function()
	dapui.close()
end


-- KEYMAPS
local map = vim.keymap.set
local opts = { noremap=true, silent=true }

-- DAP controls
map('n', '<F5>',  function() 
	-- require('dap').terminate();
	-- require('dapui').close();
	require('dap').continue()
end, {desc = " Debug Continue",   unpack(opts)}) -- start/continue
map('n', '<Leader>dsu', function() require('dap').step_over() end,             {desc = " Step Over",        unpack(opts)})
map('n', '<Leader>dsi', function() require('dap').step_into() end,             {desc = " Step Into",        unpack(opts)})
map('n', '<Leader>dso', function() require('dap').step_out() end,              {desc = " Step Out",         unpack(opts)})
map('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, {desc = " Toggle Breakpoint",unpack(opts)})
map('n', '<Leader>B', function() 
    require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) -- toggle conditional breakpoint
  end, {desc = " Set Conditional Breakpoint", unpack(opts)})

-- DAP-UI toggling
map('n', '<Leader>du', function() require('dapui').toggle() end,         {desc = " Toggle DAP-UI",     unpack(opts)}) -- show/hide dapui sidebars
map('n', '<Leader>dr', function() require('dap').repl.toggle() end,      {desc = " Toggle REPL",       unpack(opts)}) -- toggle the debug REPL
map('n', '<Leader>dl', function() require('dap').run_last() end,         {desc = " Run Last Config",  unpack(opts)})  -- re-run the last debug session
