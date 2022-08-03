.. default-role:: code

########################
 Hacking on Resolarized
########################

This Neovim plugin aims to be as close to the standard as possible, with
extensions only where it makes sense. The design principles are as follows:

- Simple: there should be no setup involved for the user, everything should
  work out of the box
- Vim-like: integrate into the editor, use `:colorscheme`, the user should not
  need to know how anything is implemented
- Declarative: no redundancy or boilerplate, the specification should be as
  human-readable as possible
- Hackable: users should be able to take the theme apart, remove parts, change
  parts, and add their own extensions

To this end the plugin consists of three parts:

- Palette: a regular Lua table which maps names to concrete colours
- Scheme: a Lua table which declares how to apply colours to highlight groups
- Interpeter: a Lua function which reads the scheme and executes the
  corresponding ex-commands

See the documentation for the formats of the palette and scheme.


The palette format
##################

There is a global palette defined which implements the official colours, plus
whatever additions. I have picked the additional colour based on my gut
feelings alone, so if anyone has a better mix feel free to bring it up. Each
palette entry has a colour name (string) as the key and a colour specification
(table) as the value.

.. code-block:: lua

   local M = {
       red   = {gui = '#dc322f', cterm = '1'},
       green = {gui = '#859900', cterm = '2'},
       blue  = {gui = '#268bd2', cterm = '4'},
   }

The entries of the specification are the exact same strings which are used to
specify colours in the `:highlight` command (see `:h highlight-args`).
