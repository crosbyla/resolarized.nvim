local util = require 'resolarized.util'

local function empty(_, args)
	local t = args[1]
	for _, _ in pairs(t) do return false end
	return true
end

local function same_structure(_, args)
	local t1 = args[1]
	local t2 = args[2]

	for k, v in pairs(t1) do
		if t2[k] == nil then
			return false
		elseif type(v) ~= 'table' and v ~= t2[k] then
			return false
		elseif type(v) == 'table' and not same_structure(_, {v, t2[k]}) then
			return false
		end
	end
	return true
end


assert:register('assertion', 'empty', empty, 'Expected %s\nto be empty', 'Expected %s\nnot to be empty')
assert:register('assertion', 'same_structure', same_structure, 'Expected %s\nto contain %s', 'Expected %s\nnot to contain %s')

describe('Deep copy', function()
	it('creates a new table', function()
		local original = {}
		local copy = util.deep_copy(original)
		assert.are_not.equal(original, copy)
	end)
	it('preserves emptyness', function()
		local original = {}
		local copy = util.deep_copy(original)
		assert.is.empty(copy)
	end)
	it('copies flat list', function()
		local original = {foo = 'foo', bar = 'bar', baz = 'baz'}
		local copy = util.deep_copy(original)
		assert.is.same_structure(original, copy)
	end)
	it('copies nested lists', function()
		local original = {
			foo = {bar = 'baz'}
		}
		local copy = util.deep_copy(original)
		assert.is.same_structure(original, copy)
	end)
	it('copies children', function()
		local original = {
			SpellBad     = {
				guisp = 'violet', shape = 'undercurl',
				children = {
					SpellCap   = {guisp = 'violet'},
					SpellLocal = {guisp = 'yellow'},
					SpellRare  = {guisp = 'cyan'},
				}
			},
		}
		local copy = util.deep_copy(original)
		assert.same_structure(original, copy)
	end)
end)
