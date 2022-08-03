.. default-role:: code

#############################
 Solarized remake for Neovim
#############################

An exhaustive and hackable implementation of of the Solarized_ colour scheme
for Neovim_.  It aims to be as close to the original as possible without adding
any weird nonsense. It support the built-in LSP client and Tree-sitter.

- Supports true colour and 16-colour terminals
- Implements the original Solarized theme (dark one only for now, light is
  coming later)
- One additional colour for subdued background, similar to how there is a
  subdued foreground colour (such as for comments)

.. warning::

   This colour scheme is not considered feature-complete. I have written it
   primarily for myself, and I will be completing it as I go along. You can use
   it, but don't be surprised if some highlight groups are missing. Hopefully
   this project will eventually become complete enough that I can remove this
   warning.


Installation
############

Requires Neovim 0.5 or higher since it is written in Lua. Install it like any
other Neovim plugin. You can set the colour scheme like any other Vim colour
scheme:

.. code-block:: vim
   
   " Dark and light are separate colour schemes
   colorscheme solarized_dark
   colorscheme solarized_light

   " There is also a generic one which uses the value of the 'background'
   " option
   colorscheme solarized


Configuration
#############

See HACKING_ file and documentation_. In general you can modify the palette or
individual highlight groups:

.. code-block:: lua

   -- Make the red colour fully red
   require('resolarized.palette').red.gui = '#ff0000'

   -- Make the background transparent
   require('resolarized.colours.dark').Normal.bg = nil

   -- Reload the colour scheme for the changes to take effect
   vim.cmd 'colorscheme solarized'

This works because the palette and the highlight groups as specified as tables
in a declarative manner. When you load the colour scheme these tables are read
and the corresponding ex-commands are generated on the fly. No more loose `g:`
variables cluttering your global namespace.


Extensions
##########

This colour scheme aims to stick as close to vanilla as possible and not try to
accommodate 3rd party plugins. With that said, sometimes a non-standard
highlight group is so ubiquitous or use useful that it might as well be
standard.


Rainbow
=======

The following seven highlight groups have been added:

- `RainbowRed`
- `RainbowOrange`
- `RainbowYellow`
- `RainbowGreen`
- `RainbowCyan`
- `RainbowBlue`
- `RainbowViolet`

They can be used by various "rainbow" plugins.


Status line accent colours
==========================

These are usually used in fancy status lines to highlight the current mode
indicator.

- `StatusLineAccent`
- `StatusLineAccentNormal`
- `StatusLineAccentInsert`
- `StatusLineAccentReplace`
- `StatusLineAccentVisual`
- `StatusLineAccentSelect`
- `StatusLineAccentCmd`

The `StatusLineAccent` highlight group is a neutral accent colour.


License
#######

Licensed under the MIT (Expat) license, see the COPYING_ file for details. The
Solarized_ colour scheme was originally created by Ethan Schoonover.


.. _Neovim: http://neovim.io/
.. _Solarized: https://ethanschoonover.com/solarized/
.. _HACKING: HACKING.rst
.. _COPYING: COPYING.txt
.. _documentation: doc/resolarized.txt
