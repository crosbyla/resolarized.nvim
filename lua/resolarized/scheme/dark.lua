local p = require 'resolarized.palette'

--- Dark colour scheme specification
return {
	-- Semantic highlight groups, see `:h group-name`
	Comment    = {fg=p.base01, shape='italic'},

	Constant   = {fg=p.cyan},
	String     = 'Constant',
	Character  = 'Constant',
	Number     = 'Constant',
	Boolean    = 'Constant',
	Float      = 'Constant',

	Identifier = {fg=p.blue},
	Function   = {fg=p.blue},

	Statement   = {fg=p.green, shape='NONE'},
	Conditional = 'Statement',
	Repeat      = 'Statement',
	Label       = 'Statement',
	Operator    = 'Statement',
	Keyword     = 'Statement',
	Exception   = 'Statement',

	PreProc   = {fg=p.orange},
	Include   = 'PreProc',
	Define    = 'PreProc',
	Macro     = 'PreProc',
	PreCondit = 'PreProc',

	Type         = {fg=p.yellow},
	StorageClass = 'Type',
	Structure    = 'Type',
	Typedef      = 'Type',

	Special        = {fg=p.orange},
	SpecialChar    = 'Special',
	Tag            = 'Special',
	Delimiter      = 'Special',
	SpecialComment = 'Special',
	Debug          = 'Special',

	Underlined = {fg=p.blue   , shape='underline'},
	-- Ignore     = {},
	Error      = {fg=p.red    , shape='bold,italic'},
	Todo       = {fg=p.yellow , shape='bold'},


	-- Default Vim highlighting groups, see `:h highlight-default`
	ColorColumn  = {             bg=p.base03},
	Conceal      = {fg=p.blue               },
	Cursor       = {fg=p.base03, bg=p.base0 },
	lCursor      = 'Cursor',
	TermCursor   = 'Cursor',
	CursorIM     = {fg=p.base03, bg=p.base1 },
	CursorColumn = {             bg=p.base02},
	CursorLine   = {             bg=p.base02},
	Directory    = {fg=p.blue               },
	DiffAdd      = {fg=p.green,  bg=p.base03, guisp=p.green},
	DiffChange   = {fg=p.yellow, bg=p.base03, guisp=p.yellow},
	DiffDelete   = {fg=p.red,    bg=p.base03, guisp=p.red},
	EndOfBuffer  = 'NonText',
	DiffText     = {fg=p.yellow, bg=p.base03, guisp=p.yellow, gui='underline', cterm='bold,underline'},
	TermCursorNC = {fg=p.base03, bg=p.base01},
	ErrorMsg     = {fg=p.red,                 gui='bold', cterm='None'},
	VertSplit    = {fg=p.base01, bg=p.base02},
	Folded       = {fg=p.base01, bg=p.base02},
	FoldColumn   = {fg=p.base01, bg=p.base02},
	SignColumn   = 'LineNr',
	IncSearch    = {fg=p.orange,              shape='standout'},
	Substitute   = 'Search',
	-- Maybe use a subdued background here?
	LineNr       = {fg=p.base01, bg=p.base03},
	CursorLineNr = {fg=p.base0,  bg=p.base02, shape='bold'},
	MatchParen   = {fg=p.base0, bg=p.base03, shape='bold'},
	ModeMsg      = {fg=p.blue               },
	MsgArea      = 'Normal',
	MsgSeparator = {fg=p.base01             },
	MoreMsg      = {fg=p.blue               },
	NonText      = {fg=p.base01             },
	Normal       = {fg=p.base0,  bg=p.base03},
	NormalFloat  = 'Pmenu',
	NormalNC     = 'Normal',
	Pmenu        = {fg=p.base0,  bg=p.base02},
	PmenuSel     = {fg=p.base1,  bg=p.base02, shape='bold'},
	PmenuSbar    = {             bg=p.base01},
	PmenuThumb   = {             bg=p.base0 },
	Question     = {fg=p.cyan,                shape='bold'},
	QuickFixLine = {fg=p.base03, bg=p.base01},
	Search       = {fg=p.base03, bg=p.yellow},
	SpecialKey   = {                          shape='bold,italic'},
	SpellBad     = {
		guisp = p.violet, shape = 'undercurl',
		children = {
			SpellCap   = {guisp = p.violet},
			SpellLocal = {guisp = p.yellow},
			SpellRare  = {guisp = p.cyan},
		}
	},
	StatusLine   = {fg = p.base0 , bg = p.base02},
	StatusLineNC = {fg = p.base01, bg = p.base02},
	TabLine      = {fg = p.base0 , bg = p.base02},
	TabLineFill  = {fg = p.base01, bg = p.base02},
	TabLineSel   = {fg = p.base03, bg = p.base01, shape = 'bold'},
	Title        = {fg = p.orange,                shape ='bold'},
	Visual       = {fg = p.base03, bg = p.base01, shape ='None'},
	VisualNOS    = 'Visual',
	WarningMsg   = {fg = p.yellow,                shape = 'bold'},
	Whitespace   = 'NonText',
	WildMenu     = {fg = p.base1, bg = p.base02,  shape = 'bold'},


	-- Language Server Protocol, see `:h lsp-highlight`
	LspReferenceText = {
		bg = p.yellow, fg=p.base03,
		children = {
			LspReferenceRead = {bg = p.cyan},
			LspReferenceWrite = {bg = p.magenta},
		}
	},
	-- I have no idea what code lenses are, but making it a comment is a good
	-- bet
	LspCodeLens = 'Comment',


	-- Diagnostic, see `:h diagnostic-highlights`
	DiagnosticError = {
		fg = p.red, guisp = p.red,
		children = {
			DiagnosticVirtualTextError = {gui='italic', cterm='italic'},
			DiagnosticUnderlineError = {
				fg = 'None', gui = 'undercurl', cterm = 'undercurl'
			},
			--DiagnosticFloatingError = {},
			--DiagnosticSignError = {},
		}
	},
	DiagnosticWarn ={
		fg = p.yellow, guisp = p.yellow,
		children = {
			DiagnosticVirtualTextWarn = {fg=p.yellow, gui='italic', cterm='italic'},
			DiagnosticUnderlineWarn = {
				fg='None', guisp=p.yellow, gui='undercurl', cterm='undercurl'
			},
			--DiagnosticFloatingWarn = {},
			--DiagnosticSignWarn = {},
		}
	},
	DiagnosticInfo = {
		fg = p.magenta, guisp = p.magenta,
		children = {
			DiagnosticVirtualTextInfo = {gui='italic', cterm='italic'},
			DiagnosticUnderlineInfo = {
				fg = 'None', gui = 'undercurl', cterm = 'undercurl'
			},
			--DiagnosticFloatingInfo = {},
			--DiagnosticSignInfo = {},
		}
	},
	DiagnosticHint = {
		fg = p.violet, guisp = p.violet,
		children = {
			DiagnosticVirtualTextHint = {gui='italic', cterm='italic'},
			DiagnosticUnderlineHint = {
				fg = 'None', gui = 'undercurl', cterm = 'undercurl'
			},
			--DiagnosticFloatingHint = {},
			--DiagnosticSignHint = {},
		}
	},

	-- Tree-sitter, see `:h nvim-treesitter-highlights`
	-- TSAnnotation   = 'PreProc',
	-- TSAttribute
	-- TSBoolean      = 'Boolean',
	-- TSCharacter    = 'Character',
	-- TSComment      = 'Comment',
	-- TSConditional  = 'Special',
	-- TSConstant     = 'Constant',
	-- TSConstBuiltin = 'Special',
	-- TSConstMacro   = 'Macro',
	-- TSConstructor  = 'Function',
	-- TSError        = 'Error',
	-- TSException    = 'Exception',
	-- TSField        = 'Identifier',
	-- TSFloat        = 'Float',
	-- TSFunction     = 'Function',
	-- TSFuncBuiltin  = 'Special',
	-- TSFuncMacro
	-- TSInclude
	-- TSKeyword
	-- TSKeywordFunction
	-- TSKeywordOperator
	-- TSLabel
	-- TSMethod
	-- TSNamespace
	-- TSNone
	-- TSNumber
	-- TSOperator
	-- TSParameter
	-- TSParameterReference
	-- TSProperty
	-- TSPunctDelimiter
	-- TSPunctBracket
	-- TSPunctSpecial
	-- TSRepeat
	-- TSString
	-- TSStringRegex
	-- TSStringEscape
	-- TSSymbol
	-- TSTag
	-- TSTagDelimiter
	-- TSText
	-- TSStrong
	-- TSEmphasis
	-- TSUnderline
	-- TSStrike
	-- TSTitle
	-- TSLiteral
	-- TSURI
	-- TSMath
	-- TSTextReference
	-- TSEnviroment
	-- TSEnviromentName
	-- TSNote
	-- TSWarning
	-- TSDanger
	-- TSType
	-- TSTypeBuiltin
	-- TSVariable
	-- TSVariableBuiltin

	-- Rainbow (my own extension)
	RainbowRed    = {fg=p.red},
	RainbowOrange = {fg=p.orange},
	RainbowYellow = {fg=p.yellow},
	RainbowGreen  = {fg=p.green},
	RainbowCyan   = {fg=p.cyan},
	RainbowBlue   = {fg=p.blue},
	RainbowViolet = {fg=p.violet},

	-- Status line accent colours, my own extension
	StatusLineAccent        = {              fg = p.base03, bg=p.base00},
	StatusLineAccentNormal  = {shape='bold', fg = p.base03, bg=p.blue},
	StatusLineAccentInsert  = {shape='bold', fg = p.base03, bg=p.green},
	StatusLineAccentReplace = {shape='bold', fg = p.base03, bg=p.red},
	StatusLineAccentVisual  = {shape='bold', fg = p.base03, bg=p.magenta},
	StatusLineAccentSelect  = {shape='bold', fg = p.base03, bg=p.violet},
	StatusLineAccentCmd     = {shape='bold', fg = p.base03, bg=p.cyan},
}
