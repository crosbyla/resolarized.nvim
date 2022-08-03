-- The light colour scheme is generated from the dark one by mapping the dark
-- tones onto their respective counterparts. This reduces the maintenance
-- burden to only one colour scheme and a mapping table.

local p = require 'resolarized.palette'
local dark_scheme = require 'resolarized.scheme.dark'
local util = require 'resolarized.util'

local colour_props = {'fg', 'bg'}
local gui_props = {'guifg', 'guibg', 'guisp'}
local cterm_props = {'ctermfg', 'ctermbg'}
local dark_to_light = {
	base04 = 'base4',
	base03 = 'base3',
	base02 = 'base2',
	base01 = 'base1',
	base0  = 'base00',
}

local function to_light(spec)
	for dark, light in pairs(dark_to_light) do
		for _, prop in pairs(colour_props) do
			if spec[prop] == p[dark] then
				spec[prop] = p[light]
			end
		end
		for _, prop in pairs(gui_props) do
			if spec[prop] == p[dark]['gui'] then
				spec[prop] = p[light]['gui']
			end
		end
		for _, prop in pairs(cterm_props) do
			if spec[prop] == p[dark]['cterm'] then
				spec[prop] = p[light]['cterm']
			end
		end
	end
end

local light = util.traverse(util.deep_copy(dark_scheme), to_light)

return light
