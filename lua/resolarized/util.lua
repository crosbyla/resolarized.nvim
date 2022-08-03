--- Handy functions for manipulating colour schemes.
local M = {}

--- Recursively traverse the given colour scheme and perform an action when
---  visiting on entry.
---
--- @param scheme table  # The colour scheme to traverse
--- @param on_visit function  # Function to apply to each node
--- @return table  # The original colour scheme (not a copy)
function M.traverse(scheme, on_visit)
	for _, spec in pairs(scheme) do
		if type(spec) == 'table'  then
			on_visit(spec)
			if spec['children'] then
				M.traverse(spec['children'], on_visit)
			end
		end
	end
	return scheme
end


--- Perform a deep copy of a colour scheme.
---
--- Unlike a regular deep copy this one will only recursively copy
--- specifications, but not other tables. This makes it possible for example to
--- compare palette entries by identity.
---
--- @param original table  # The original colour scheme
--- @return table  # Copy of the original
function M.deep_copy(original)
	local result = {}
	for group, spec in pairs(original) do
		if type(spec) == 'table' then
			local copy = {}
			for key, value in pairs(spec) do
				copy[key] = key ~= 'children' and value or M.deep_copy(value)
			end
			result[group] = copy
		else
			result[group] = spec
		end
	end
	return result
end


-------------------------------------------------------------------------------
return M
