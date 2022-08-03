--- Arguments to the :highlight command, except for those involving colour
local hl_args = {'cterm', 'start', 'stop', 'gui', 'font', 'blend'}
local gui_args = {'guifg', 'guibg', 'guisp'}
local cterm_args = {'ctermfg', 'ctermbg'}


--- Compile a hightlight group and its arguments into an ex-command.
local function compile_spec(group, kwargs)
	local result = string.format('highlight %s', group)
	for key, value in pairs(kwargs) do
		result = result .. string.format(' %s=%s', key, value)
	end
	return result
end

--- Traverse a list of specification, executing each specification as it is
--- visited. Recursively descends into child-specifications.
---
--- @param group string         # Name of the group
--- @param spec table | string  # Highlight specification of the group
local function traverse_spec(group, spec)
	vim.cmd('highlight clear ' .. group)

	if type(spec) == 'string' then
		vim.cmd(string.format('highlight link %s %s', group, spec))
		return
	end

	local kwargs = {}

	for _, key in pairs{'fg', 'bg'} do
		local value = spec[key]
		if not value then goto continue end
		if type(value) == 'string' then
			kwargs['gui' .. key] = value
			kwargs['cterm' .. key] = value
		else
			kwargs['gui' .. key] = value['gui']
			kwargs['cterm' .. key] = value['cterm']
		end
		::continue::
	end

	for _, key in pairs(gui_args) do
		local value = spec[key]
		if type(value) == 'string' then
			kwargs[key] = value
		elseif type(value) == 'table' then
			kwargs[key] = value['gui']
		end
	end

	for _, key in pairs(cterm_args) do
		local value = spec[key]
		if type(value) == 'string' then
			kwargs[key] = value
		elseif type(value) == 'table' then
			kwargs[key] = value['cterm']
		end
	end

	if spec['shape'] then
		kwargs['gui'] = spec['shape']
		kwargs['cterm'] = spec['shape']
	end

	for _, key in pairs(hl_args) do
		kwargs[key] = spec[key] or kwargs[key]
	end

	local children = rawget(spec, 'children')
	if children then
		local child_mt = {__index = spec}
		for child, child_spec in pairs(children) do
			setmetatable(child_spec, child_mt)
			traverse_spec(child, child_spec)
		end
	end

	vim.cmd(compile_spec(group, kwargs))
end

--- @alias spec 'string | table<string, spec>'

--- Applies a Resolarized colour scheme according to the given scheme
--- specification.
---
--- @param scheme table<string, spec>  # Colour theme specification
local function load_colours(name, scheme)
	vim.cmd 'highlight clear'
	vim.g.colors_name = name
	for group, spec in pairs(scheme) do
		 traverse_spec(group, spec)
	end
end

return load_colours
