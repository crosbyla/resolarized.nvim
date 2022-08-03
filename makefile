.PHONY: check

check:
	LUA_PATH="$$(pwd)/lua/?.lua;$$LUA_PATH" busted test/test-util.lua
