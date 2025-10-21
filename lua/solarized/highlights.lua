local M = {}
local g = vim.g
local palette = require("solarized.palette")

function M.load()
  -- default settings
  local settings = {
    solarized_visibility = "normal",
    solarized_diffmode = "normal",
    solarized_statusline = "normal",
  }
  for key, val in pairs(settings) do
    if vim.g[key] == nil then vim.g[key] = val end
  end

  local colors = palette.darkColors
  if vim.o.background == "light" then colors = palette.lightColors end
  local syntax = {}

  syntax["Normal"] = { fg = colors.base1, bg = colors.base03 }
  syntax["FoldColumn"] = { fg = colors.base0, bg = colors.darkerfloat }
  syntax["Folded"] = { fg = colors.base0, bg = colors.fold, sp = colors.base03 }
  syntax["Terminal"] = syntax["Normal"]
  syntax["ToolbarButton"] = { fg = colors.base1, bg = colors.darkerfloat, bold = true }
  syntax["ToolbarLine"] = { fg = colors.none, bg = colors.darkerfloat }
  syntax["CursorLine"] = { fg = colors.none, bg = colors.darkerfloat }
  syntax["LineNr"] = { fg = colors.base00, bg = colors.darkerfloat }
  syntax["FloatBorder"] = { fg = colors.base1, bg = colors.darkerfloat }
  syntax["FloatTitle"] = { fg = colors.orange, bold = true, bg = colors.darkerfloat }
  syntax["NormalFloat"] = { fg = colors.base1, bg = colors.darkerfloat }
  syntax["WhiteSpace"] = { fg = colors.base01 }

  if g.solarized_diffmode == "low" then
    syntax["DiffAdd"] = { fg = colors.green, bg = colors.none, sp = colors.green }
    syntax["DiffChange"] = { fg = colors.yellow, bg = colors.none, sp = colors.yellow }
    syntax["DiffDelete"] = { fg = colors.red, bg = colors.none, bold = true }
    syntax["DiffText"] = { fg = colors.blue, bg = colors.none, sp = colors.blue }
  elseif g.solarized_diffmode == "high" then
    syntax["DiffAdd"] = { fg = colors.green, bg = colors.none, reverse = true }
    syntax["DiffChange"] = { fg = colors.yellow, bg = colors.none, reverse = true }
    syntax["DiffDelete"] = { fg = colors.red, bg = colors.none, reverse = true }
    syntax["DiffText"] = { fg = colors.blue, bg = colors.none, reverse = true }
  else
    syntax["DiffAdd"] = { fg = colors.green, bg = colors.darkerfloat, sp = colors.green }
    syntax["DiffChange"] = { fg = colors.yellow, bg = colors.darkerfloat, sp = colors.yellow }
    syntax["DiffDelete"] = { fg = colors.red, bg = colors.darkerfloat, bold = true }
    syntax["DiffText"] = { fg = colors.blue, bg = colors.darkerfloat, sp = colors.blue }
  end

  if g.solarized_statusline == "low" then
    syntax["StatusLine"] = { fg = colors.base01, bg = colors.base2, reverse = true }
    syntax["StatusLineNC"] = { fg = colors.base01, bg = colors.darkerfloat, reverse = true }
    syntax["TabLine"] = { fg = colors.base01, bg = colors.darkerfloat, reverse = true }
    syntax["TabLineFill"] = { fg = colors.base01, bg = colors.darkerfloat, reverse = true }
    syntax["TabLineSel"] = { fg = colors.base0, bg = colors.base3, reverse = true }
    syntax["VertSplit"] = { fg = colors.base01, bg = colors.none }
  elseif g.solarized_statusline == "flat" then
    syntax["StatusLine"] = { fg = colors.base02, bg = colors.base2, reverse = true }
    syntax["StatusLineNC"] = { fg = colors.base02, bg = colors.base1, reverse = true }
    syntax["TabLineSel"] = { fg = colors.base2, bg = colors.darkerfloat }
    syntax["TabLine"] = { fg = colors.base01, bg = colors.darkerfloat }
    syntax["TabLineFill"] = { fg = colors.base01, bg = colors.darkerfloat }
    syntax["VertSplit"] = { fg = colors.base02, bg = colors.none }
  else
    syntax["StatusLine"] = { fg = colors.base0, bg = colors.darkerfloat, reverse = true }
    syntax["StatusLineNC"] = { fg = colors.base01, bg = colors.darkerfloat, reverse = true }
    syntax["TabLine"] = { fg = colors.base01, bg = colors.darkerfloat, reverse = true }
    syntax["TabLineFill"] = { fg = colors.base01, bg = colors.darkerfloat, reverse = true }
    syntax["TabLineSel"] = { fg = colors.base0, bg = colors.darkerfloat, reverse = true }
    syntax["VertSplit"] = { fg = colors.base01 }
  end

  if g.solarized_visibility == "high" then
    syntax["CursorLineNr"] = { fg = colors.orange, bg = colors.darkerfloat, bold = true }
    syntax["LineNr"] = { fg = colors.base0, bg = colors.darkerfloat }
    syntax["NonText"] = { fg = colors.orange, bold = true }
    syntax["SpecialKey"] = { fg = colors.orange, reverse = true }
    syntax["SpellBad"] = { fg = colors.violet, bg = colors.base3, sp = colors.red, reverse = true, undercurl = true }
    syntax["SpellCap"] = { fg = colors.violet, bg = colors.base3, sp = colors.red, reverse = true, undercurl = true }
    syntax["SpellLocal"] = { fg = colors.yellow, bg = colors.base3, sp = colors.red, reverse = true, undercurl = true }
    syntax["SpellRare"] = { fg = colors.cyan, bg = colors.base3, sp = colors.red, reverse = true, undercurl = true }
    syntax["Title"] = { fg = colors.yellow, bold = true }
  elseif g.solarized_visibility == "low" then
    syntax["CursorLineNr"] = { fg = colors.base01, bg = colors.darkerfloat, bold = true }
    syntax["LineNr"] = { fg = colors.base01, bg = colors.darkerfloat }
    syntax["NonText"] = { fg = colors.base02, bold = true }
    syntax["SpecialKey"] = { fg = colors.base02, reverse = true }
    syntax["SpellBad"] = { fg = colors.violet, sp = colors.violet, undercurl = true }
    syntax["SpellCap"] = { fg = colors.violet, sp = colors.violet, undercurl = true }
    syntax["SpellLocal"] = { fg = colors.yellow, sp = colors.yellow, undercurl = true }
    syntax["SpellRare"] = { fg = colors.cyan, sp = colors.cyan, undercurl = true }
    syntax["Title"] = { fg = colors.base01, bold = true }
  else
    syntax["CursorLineNr"] = { fg = colors.base0, bg = colors.darkerfloat, bold = true }
    syntax["LineNr"] = { fg = colors.base00, bg = colors.darkerfloat }
    syntax["NonText"] = { fg = colors.base00, bold = true }
    syntax["SpecialKey"] = { fg = colors.base00, bg = colors.darkerfloat, bold = true }
    syntax["SpellBad"] = { fg = colors.violet, sp = colors.violet, undercurl = true }
    syntax["SpellCap"] = { fg = colors.violet, sp = colors.violet, undercurl = true }
    syntax["SpellLocal"] = { fg = colors.yellow, sp = colors.yellow, undercurl = true }
    syntax["SpellRare"] = { fg = colors.cyan, sp = colors.cyan, undercurl = true }
    syntax["Title"] = { fg = colors.orange, bold = true }
  end

  syntax["ColorColumn"] = { fg = colors.none, bg = colors.darkerfloat }
  syntax["Conceal"] = { fg = colors.blue }
  syntax["CursorColumn"] = { fg = colors.none, bg = colors.darkerfloat }
  syntax["Directory"] = { fg = colors.blue }
  syntax["EndOfBuffer"] = { fg = colors.none, ctermfg = colors.none, ctermbg = colors.none }
  syntax["ErrorMsg"] = { fg = colors.red, bg = colors.err_bg, reverse = true }
  syntax["IncSearch"] = { fg = colors.orange, standout = true }
  syntax["MatchParen"] = { fg = colors.base3, bg = colors.darkerfloat, bold = true }
  syntax["ModeMsg"] = { fg = colors.blue }
  syntax["MoreMsg"] = { fg = colors.blue }
  syntax["Pmenu"] = { fg = colors.base1, bg = colors.darkerfloat }
  syntax["PmenuSbar"] = { fg = colors.none, bg = colors.base01 }
  syntax["PmenuSel"] = { fg = colors.base2, bg = colors.base00 }
  syntax["PmenuThumb"] = { fg = colors.none, bg = colors.base0 }
  syntax["Question"] = { fg = colors.cyan, bold = true }
  syntax["Search"] = { fg = colors.yellow, reverse = true }
  syntax["SignColumn"] = { fg = colors.base00, bg = colors.darkerfloat }
  syntax["Visual"] = { fg = colors.base01, bg = colors.base03, reverse = true }
  syntax["VisualNOS"] = { fg = colors.none, bg = colors.darkerfloat, reverse = true }
  syntax["WarningMsg"] = { fg = colors.orange, bold = true }
  syntax["WildMenu"] = { fg = colors.base2, bg = colors.darkerfloat, reverse = true }
  syntax["Comment"] = { fg = colors.base01, italic = true }
  syntax["Constant"] = { fg = colors.cyan }
  syntax["CursorIM"] = { fg = colors.none, bg = colors.base1 }
  syntax["Error"] = { fg = colors.red, bg = colors.err_bg, bold = true, reverse = true }
  syntax["Identifier"] = { fg = colors.blue }
  syntax["Ignore"] = { fg = colors.none, ctermfg = colors.none, ctermbg = colors.none }
  syntax["PreProc"] = { fg = colors.orange }
  syntax["Special"] = { fg = colors.orange }
  syntax["Statement"] = { fg = colors.green }
  syntax["Todo"] = { fg = colors.magenta, bold = true }
  syntax["Type"] = { fg = colors.yellow }
  syntax["Text"] = { fg = colors.cyan }
  syntax["Strikethrough"] = { fg = colors.base01, strikethrough = true }
  syntax["Underlined"] = { fg = colors.violet }
  syntax["NormalMode"] = { fg = colors.base0, bg = colors.base3, reverse = true }
  syntax["InsertMode"] = { fg = colors.cyan, bg = colors.base3, reverse = true }
  syntax["ReplaceMode"] = { fg = colors.orange, bg = colors.base3, reverse = true }
  syntax["VisualMode"] = { fg = colors.magenta, bg = colors.base3, reverse = true }
  syntax["CommandMode"] = { fg = colors.magenta, bg = colors.base3, reverse = true }
  syntax["vimCommentString"] = { fg = colors.violet }
  syntax["vimCommand"] = { fg = colors.yellow }
  syntax["vimCmdSep"] = { fg = colors.blue, bold = true }
  syntax["helpExample"] = { fg = colors.base1 }
  syntax["helpOption"] = { fg = colors.cyan }
  syntax["helpNote"] = { fg = colors.magenta }
  syntax["helpVim"] = { fg = colors.magenta }
  syntax["helpHyperTextJump"] = { fg = colors.blue }
  syntax["helpHyperTextEntry"] = { fg = colors.green }
  syntax["vimIsCommand"] = { fg = colors.base00 }
  syntax["vimSynMtchOpt"] = { fg = colors.yellow }
  syntax["vimSynType"] = { fg = colors.cyan }
  syntax["vimHiLink"] = { fg = colors.blue }
  syntax["vimHiGroup"] = { fg = colors.blue }
  syntax["vimGroup"] = { fg = colors.blue, bold = true }
  syntax["gitcommitComment"] = { fg = colors.base01, italic = true }
  syntax["gitcommitUnmerged"] = { fg = colors.green, bold = true }
  syntax["gitcommitOnBranch"] = { fg = colors.base01, bold = true }
  syntax["gitcommitBranch"] = { fg = colors.magenta, bold = true }
  syntax["gitcommitdiscardedtype"] = { fg = colors.red }
  syntax["gitcommitselectedtype"] = { fg = colors.green }
  syntax["gitcommitHeader"] = { fg = colors.base01 }
  syntax["gitcommitUntrackedFile"] = { fg = colors.cyan, bold = true }
  syntax["gitcommitDiscardedFile"] = { fg = colors.red, bold = true }
  syntax["gitcommitSelectedFile"] = { fg = colors.green, bold = true }
  syntax["gitcommitUnmergedFile"] = { fg = colors.yellow, bold = true }
  syntax["gitcommitFile"] = { fg = colors.base0, bold = true }
  syntax["htmlTag"] = { fg = colors.base01 }
  syntax["htmlEndTag"] = { fg = colors.base01 }
  syntax["htmlTagN"] = { fg = colors.base1, bold = true }
  syntax["htmlTagName"] = { fg = colors.blue, bold = true }
  syntax["htmlSpecialTagName"] = { fg = colors.blue, italic = true }
  syntax["htmlArg"] = { fg = colors.base00 }
  syntax["javaScript"] = { fg = colors.yellow }
  syntax["perlHereDoc"] = { fg = colors.base1 }
  syntax["perlVarPlain"] = { fg = colors.yellow }
  syntax["perlStatementFileDesc"] = { fg = colors.cyan }
  syntax["texstatement"] = { fg = colors.cyan }
  syntax["texmathzonex"] = { fg = colors.yellow }
  syntax["texmathmatcher"] = { fg = colors.yellow }
  syntax["texreflabel"] = { fg = colors.yellow }
  syntax["rubyDefine"] = { fg = colors.base1, bold = true }
  syntax["rubyBoolean"] = { fg = colors.magenta }
  syntax["cPreCondit"] = { fg = colors.orange }
  syntax["VarId"] = { fg = colors.blue }
  syntax["ConId"] = { fg = colors.yellow }
  syntax["hsImport"] = { fg = colors.magenta }
  syntax["hsString"] = { fg = colors.base00 }
  syntax["hsStructure"] = { fg = colors.cyan }
  syntax["hs_hlFunctionName"] = { fg = colors.blue }
  syntax["hsStatement"] = { fg = colors.cyan }
  syntax["hsImportLabel"] = { fg = colors.cyan }
  syntax["hs_OpFunctionName"] = { fg = colors.yellow }
  syntax["hs_DeclareFunction"] = { fg = colors.orange }
  syntax["hsVarSym"] = { fg = colors.cyan }
  syntax["hsType"] = { fg = colors.yellow }
  syntax["hsTypedef"] = { fg = colors.cyan }
  syntax["hsModuleName"] = { fg = colors.green }
  syntax["pandocTitleBlock"] = { fg = colors.blue }
  syntax["pandocTitleBlockTitle"] = { fg = colors.blue, bold = true }
  syntax["pandocTitleComment"] = { fg = colors.blue, bold = true }
  syntax["pandocComment"] = { fg = colors.base01, italic = true }
  syntax["pandocVerbatimBlock"] = { fg = colors.yellow }
  syntax["pandocBlockQuote"] = { fg = colors.blue }
  syntax["pandocBlockQuoteLeader1"] = { fg = colors.blue }
  syntax["pandocBlockQuoteLeader2"] = { fg = colors.cyan }
  syntax["pandocBlockQuoteLeader3"] = { fg = colors.yellow }
  syntax["pandocBlockQuoteLeader4"] = { fg = colors.red }
  syntax["pandocBlockQuoteLeader5"] = { fg = colors.base0 }
  syntax["pandocBlockQuoteLeader6"] = { fg = colors.base01 }
  syntax["pandocListMarker"] = { fg = colors.magenta }
  syntax["pandocListReference"] = { fg = colors.magenta }
  syntax["pandocDefinitionBlock"] = { fg = colors.violet }
  syntax["pandocDefinitionTerm"] = { fg = colors.violet, standout = true }
  syntax["pandocDefinitionIndctr"] = { fg = colors.violet, bold = true }
  syntax["pandocEmphasisDefinition"] = { fg = colors.violet, italic = true }
  syntax["pandocEmphasisNestedDefinition"] = { fg = colors.violet, bold = true }
  syntax["pandocStrongEmphasisDefinition"] = { fg = colors.violet, bold = true }
  syntax["pandocStrongEmphasisNestedDefinition"] = { fg = colors.violet, bold = true }
  syntax["pandocStrongEmphasisEmphasisDefinition"] = { fg = colors.violet, bold = true }
  syntax["pandocStrikeoutDefinition"] = { fg = colors.violet, reverse = true }
  syntax["pandocVerbatimInlineDefinition"] = { fg = colors.violet }
  syntax["pandocSuperscriptDefinition"] = { fg = colors.violet }
  syntax["pandocSubscriptDefinition"] = { fg = colors.violet }
  syntax["pandocTable"] = { fg = colors.blue }
  syntax["pandocTableStructure"] = { fg = colors.blue }
  syntax["pandocTableZebraLight"] = { fg = colors.blue, bg = colors.base03 }
  syntax["pandocTableZebraDark"] = { fg = colors.blue, bg = colors.darkerfloat }
  syntax["pandocEmphasisTable"] = { fg = colors.blue, italic = true }
  syntax["pandocEmphasisNestedTable"] = { fg = colors.blue, bold = true }
  syntax["pandocStrongEmphasisTable"] = { fg = colors.blue, bold = true }
  syntax["pandocStrongEmphasisNestedTable"] = { fg = colors.blue, bold = true }
  syntax["pandocStrongEmphasisEmphasisTable"] = { fg = colors.blue, bold = true }
  syntax["pandocStrikeoutTable"] = { fg = colors.blue, reverse = true }
  syntax["pandocVerbatimInlineTable"] = { fg = colors.blue }
  syntax["pandocSuperscriptTable"] = { fg = colors.blue }
  syntax["pandocSubscriptTable"] = { fg = colors.blue }
  syntax["pandocHeading"] = { fg = colors.orange, bold = true }
  syntax["pandocHeadingMarker"] = { fg = colors.orange, bold = true }
  syntax["pandocEmphasisHeading"] = { fg = colors.orange, bold = true }
  syntax["pandocEmphasisNestedHeading"] = { fg = colors.orange, bold = true }
  syntax["pandocStrongEmphasisHeading"] = { fg = colors.orange, bold = true }
  syntax["pandocStrongEmphasisNestedHeading"] = { fg = colors.orange, bold = true }
  syntax["pandocStrongEmphasisEmphasisHeading"] = { fg = colors.orange, bold = true }
  syntax["pandocStrikeoutHeading"] = { fg = colors.orange, reverse = true }
  syntax["pandocVerbatimInlineHeading"] = { fg = colors.orange, bold = true }
  syntax["pandocSuperscriptHeading"] = { fg = colors.orange, bold = true }
  syntax["pandocSubscriptHeading"] = { fg = colors.orange, bold = true }
  syntax["pandocLinkDelim"] = { fg = colors.base01 }
  syntax["pandocLinkLabel"] = { fg = colors.blue }
  syntax["pandocLinkText"] = { fg = colors.blue }
  syntax["pandocLinkURL"] = { fg = colors.base00 }
  syntax["pandocLinkTitle"] = { fg = colors.base00 }
  syntax["pandocLinkTitleDelim"] = { fg = colors.base01, sp = colors.base00 }
  syntax["pandocLinkDefinition"] = { fg = colors.cyan, sp = colors.base00 }
  syntax["pandocLinkDefinitionID"] = { fg = colors.blue, bold = true }
  syntax["pandocImageCaption"] = { fg = colors.violet, bold = true }
  syntax["pandocFootnoteLink"] = { fg = colors.green }
  syntax["pandocFootnoteDefLink"] = { fg = colors.green, bold = true }
  syntax["pandocFootnoteInline"] = { fg = colors.green, bold = true }
  syntax["pandocFootnote"] = { fg = colors.green }
  syntax["pandocCitationDelim"] = { fg = colors.magenta }
  syntax["pandocCitation"] = { fg = colors.magenta }
  syntax["pandocCitationID"] = { fg = colors.magenta }
  syntax["pandocCitationRef"] = { fg = colors.magenta }
  syntax["pandocStyleDelim"] = { fg = colors.base01 }
  syntax["pandocEmphasis"] = { fg = colors.base0, italic = true }
  syntax["pandocEmphasisNested"] = { fg = colors.base0, bold = true }
  syntax["pandocStrongEmphasis"] = { fg = colors.base0, bold = true }
  syntax["pandocStrongEmphasisNested"] = { fg = colors.base0, bold = true }
  syntax["pandocStrongEmphasisEmphasis"] = { fg = colors.base0, bold = true }
  syntax["pandocStrikeout"] = { fg = colors.base01, reverse = true }
  syntax["pandocVerbatimInline"] = { fg = colors.yellow }
  syntax["pandocSuperscript"] = { fg = colors.violet }
  syntax["pandocSubscript"] = { fg = colors.violet }
  syntax["pandocRule"] = { fg = colors.blue, bold = true }
  syntax["pandocRuleLine"] = { fg = colors.blue, bold = true }
  syntax["pandocEscapePair"] = { fg = colors.red, bold = true }
  syntax["pandocCitationRef"] = { fg = colors.magenta }
  syntax["pandocNonBreakingSpace"] = { fg = colors.red, reverse = true }
  syntax["pandocMetadataDelim"] = { fg = colors.base01 }
  syntax["pandocMetadata"] = { fg = colors.blue }
  syntax["pandocMetadataKey"] = { fg = colors.blue }
  syntax["pandocMetadata"] = { fg = colors.blue, bold = true }

  syntax["Boolean"] = syntax["Constant"]
  syntax["Character"] = syntax["Constant"]
  syntax["Conditional"] = syntax["Statement"]
  syntax["Debug"] = syntax["Special"]
  syntax["Define"] = syntax["PreProc"]
  syntax["Delimiter"] = syntax["Special"]
  syntax["Exception"] = syntax["Statement"]
  syntax["Float"] = syntax["Constant"]
  syntax["Function"] = syntax["Identifier"]
  syntax["Include"] = syntax["PreProc"]
  syntax["Keyword"] = syntax["Statement"]
  syntax["Label"] = syntax["Statement"]
  syntax["Macro"] = syntax["PreProc"]
  syntax["Number"] = syntax["Constant"]
  syntax["Operator"] = syntax["Statement"]
  syntax["PreCondit"] = syntax["PreProc"]
  syntax["QuickFixLine"] = syntax["Search"]
  syntax["Repeat"] = syntax["Statement"]
  syntax["SpecialChar"] = syntax["Special"]
  syntax["SpecialComment"] = syntax["Special"]
  syntax["StatusLineTerm"] = syntax["StatusLine"]
  syntax["StatusLineTermNC"] = syntax["StatusLineNC"]
  syntax["StorageClass"] = syntax["Type"]
  syntax["String"] = syntax["Text"]
  syntax["Structure"] = syntax["Type"]
  syntax["Tag"] = syntax["Special"]
  syntax["Typedef"] = syntax["Type"]
  syntax["lCursor"] = syntax["Cursor"]
  syntax["vimVar"] = syntax["Identifier"]
  syntax["vimFunc"] = syntax["Function"]
  syntax["vimUserFunc"] = syntax["Function"]
  syntax["helpSpecial"] = syntax["Special"]
  syntax["vimSet"] = syntax["Normal"]
  syntax["vimSetEqual"] = syntax["Normal"]
  syntax["diffAdded"] = syntax["Statement"]
  syntax["diffLine"] = syntax["Identifier"]
  syntax["gitcommitUntracked"] = syntax["gitcommitComment"]
  syntax["gitcommitDiscarded"] = syntax["gitcommitComment"]
  syntax["gitcommitSelected"] = syntax["gitcommitComment"]
  syntax["gitcommitNoBranch"] = syntax["gitcommitBranch"]
  syntax["gitcommitDiscardedArrow"] = syntax["gitcommitDiscardedFile"]
  syntax["gitcommitSelectedArrow"] = syntax["gitcommitSelectedFile"]
  syntax["gitcommitUnmergedArrow"] = syntax["gitcommitUnmergedFile"]
  syntax["jsFuncCall"] = syntax["Function"]
  syntax["rubySymbol"] = syntax["String"]
  syntax["hsImportParams"] = syntax["Delimiter"]
  syntax["hsDelimTypeExport"] = syntax["Delimiter"]
  syntax["hsModuleStartLabel"] = syntax["hsStructure"]
  syntax["hsModuleWhereLabel"] = syntax["hsModuleStartLabel"]
  syntax["pandocVerbatimBlockDeep"] = syntax["pandocVerbatimBlock"]
  syntax["pandocCodeBlock"] = syntax["pandocVerbatimBlock"]
  syntax["pandocCodeBlockDelim"] = syntax["pandocVerbatimBlock"]
  syntax["pandocTableStructureTop"] = syntax["pandocTableStructre"]
  syntax["pandocTableStructureEnd"] = syntax["pandocTableStructre"]
  syntax["pandocEscapedCharacter"] = syntax["pandocEscapePair"]
  syntax["pandocLineBreak"] = syntax["pandocEscapePair"]
  syntax["pandocMetadataTitle"] = syntax["pandocMetadata"]

  -- TreeSitter
  -- syntax['TSAnnotation'] = syntax['']
  syntax["TSBoolean"] = syntax["Constant"]
  syntax["TSCharacter"] = syntax["Constant"]
  syntax["TSComment"] = syntax["Comment"]
  syntax["TSConditional"] = syntax["Conditional"]
  syntax["TSConstant"] = syntax["Constant"]
  syntax["TSConstBuiltin"] = syntax["Constant"]
  syntax["TSConstMacro"] = syntax["Constant"]
  syntax["TSError"] = { fg = colors.red }
  syntax["TSException"] = syntax["Exception"]
  syntax["TSField"] = syntax["Identifier"]
  syntax["TSFloat"] = syntax["Float"]
  syntax["TSFunction"] = syntax["Function"]
  syntax["TSFuncBuiltin"] = syntax["Function"]
  syntax["TSFuncMacro"] = syntax["Function"]
  syntax["TSInclude"] = syntax["Include"]
  syntax["TSKeyword"] = syntax["Keyword"]
  syntax["TSLabel"] = syntax["Label"]
  syntax["TSMethod"] = syntax["Function"]
  syntax["TSNamespace"] = syntax["Identifier"]
  syntax["TSNumber"] = syntax["Constant"]
  syntax["TSOperator"] = syntax["Operator"]
  syntax["TSParameterReference"] = syntax["Identifier"]
  syntax["TSProperty"] = syntax["TSField"]
  syntax["TSPunctDelimiter"] = syntax["Delimiter"]
  syntax["TSPunctBracket"] = syntax["Delimiter"]
  syntax["TSPunctSpecial"] = syntax["Special"]
  syntax["TSRepeat"] = syntax["Repeat"]
  syntax["TSString"] = syntax["Constant"]
  syntax["TSStringRegex"] = syntax["Constant"]
  syntax["TSStringEscape"] = syntax["Constant"]
  syntax["TSStrong"] = { fg = colors.base1, bold = true }
  syntax["TSConstructor"] = syntax["Function"]
  syntax["TSKeywordFunction"] = syntax["Identifier"]
  syntax["TSLiteral"] = syntax["Normal"]
  syntax["TSParameter"] = syntax["Identifier"]
  syntax["TSVariable"] = { fg = colors.base1 }
  syntax["TSVariableBuiltin"] = syntax["Identifier"]
  syntax["TSTag"] = syntax["Special"]
  syntax["TSTagDelimiter"] = syntax["Delimiter"]
  syntax["TSTitle"] = syntax["Title"]
  syntax["TSType"] = syntax["Type"]
  syntax["TSTypeBuiltin"] = syntax["Type"]
  -- syntax['TSEmphasis'] = syntax['']

  -- BEGIN Neovim >= 0.8
  -- Misc {{{
  syntax["@comment"] = syntax["Comment"]
  syntax["@error"] = { fg = colors.red }
  syntax["@none"] = syntax["NONE"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@preproc"] = syntax["PreProc"]
  -- replacement in nvim-treesitter 0.10
  syntax["@keyword.directive"] = syntax["PreProc"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@define"] = syntax["Define"]
  -- replacement in nvim-treesitter 0.10
  syntax["@keyword.directive.define"] = syntax["Define"]
  syntax["@operator"] = syntax["Operator"]
  -- }}}

  -- Punctuation {{{
  -- deprecated in nvim-treesitter 0.10
  syntax["@punctuation.delimiter"] = syntax["Statement"]
  -- replacement in nvim-treesitter 0.10
  syntax["@markup.raw.delimiter"] = syntax["Statement"]
  syntax["@punctuation.bracket"] = syntax["Delimiter"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@punctuation.special"] = syntax["Delimiter"]
  -- replacement in nvim-treesitter 0.10
  syntax["@markup.list"] = syntax["Delimiter"]
  -- }}}

  -- Literals {{{
  syntax["@string"] = syntax["String"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@string.regex"] = syntax["String"]
  -- replacement in nvim-treesitter 0.10
  syntax["@string.regexp"] = syntax["String"]
  syntax["@string.escape"] = syntax["Special"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@string.special"] = syntax["Special"]
  -- replacement in nvim-treesitter 0.10
  syntax["@markup.link.label"] = syntax["Constant"]

  syntax["@character"] = syntax["Character"]
  syntax["@character.special"] = syntax["Special"]

  syntax["@boolean"] = syntax["Boolean"]
  syntax["@number"] = syntax["Number"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@float"] = syntax["Float"]
  -- replacement in nvim-treesitter 0.10
  syntax["@number.float"] = syntax["Float"]
  -- }}}

  -- Functions {{{
  syntax["@function"] = syntax["Function"]
  syntax["@function.call"] = syntax["Function"]
  syntax["@function.builtin"] = syntax["Function"]
  syntax["@function.macro"] = syntax["Macro"]

  -- deprecated in nvim-treesitter 0.10
  syntax["@method"] = syntax["Function"]
  syntax["@method.call"] = syntax["Function"]
  -- replacement in nvim-treesitter 0.10
  syntax["@function.method"] = syntax["Function"]
  syntax["@function.method.call"] = syntax["Function"]

  syntax["@constructor"] = syntax["Special"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@parameter"] = syntax["Normal"]
  -- replacement in nvim-treesitter 0.10
  syntax["@variable.parameter"] = syntax["Normal"]
  -- }}}

  -- Keywords {{{
  syntax["@keyword"] = syntax["Keyword"]
  syntax["@keyword.function"] = syntax["Keyword"]
  syntax["@keyword.operator"] = syntax["Keyword"]
  syntax["@keyword.return"] = syntax["Keyword"]

  -- deprecated in nvim-treesitter 0.10
  syntax["@conditional"] = syntax["Conditional"]
  syntax["@repeat"] = syntax["Repeat"]
  syntax["@debug"] = syntax["Debug"]
  -- replacement in nvim-treesitter 0.10
  syntax["@keyword.conditional"] = syntax["Conditional"]
  syntax["@keyword.repeat"] = syntax["Repeat"]
  syntax["@keyword.debug"] = syntax["Debug"]
  syntax["@label"] = syntax["Label"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@include"] = syntax["Include"]
  syntax["@exception"] = syntax["Exception"]
  -- replacement in nvim-treesitter 0.10
  syntax["@keyword.import"] = syntax["Include"]
  syntax["@keyword.exception"] = syntax["Exception"]
  -- }}}

  -- Types {{{
  syntax["@type"] = syntax["Type"]
  syntax["@type.builtin"] = syntax["Type"]
  syntax["@type.qualifier"] = syntax["Type"]
  syntax["@type.definition"] = syntax["Typedef"]

  -- deprecated in nvim-treesitter 0.10
  syntax["@storageclass"] = syntax["StorageClass"]
  -- replacement in nvim-treesitter 0.10
  syntax["@keyword.storage"] = syntax["StorageClass"]
  syntax["@attribute"] = syntax["Identifier"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@field"] = syntax["Identifier"]
  -- replacement in nvim-treesitter 0.10
  syntax["@variable.member"] = syntax["Identifier"]
  syntax["@property"] = syntax["Identifier"]
  -- }}}

  -- Identifiers {{{
  syntax["@variable"] = { fg = colors.base1 }
  syntax["@variable.builtin"] = syntax["Special"]

  syntax["@constant"] = syntax["Constant"]
  syntax["@constant.builtin"] = syntax["Type"]
  syntax["@constant.macro"] = syntax["Define"]

  syntax["@namespace"] = syntax["Identifier"]
  syntax["@symbol"] = syntax["Identifier"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@module"] = syntax["Identifier"]
  -- replacement in nvim-treesitter 0.10
  syntax["@string.special.symbol"] = syntax["Identifier"]
  -- }}}

  -- Text {{{
  syntax["@text"] = syntax["Normal"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@text.strong"] = { fg = colors.base1, bold = true }
  syntax["@text.emphasis"] = { fg = colors.base1, bold = true }
  syntax["@text.underline"] = syntax["Underlined"]
  syntax["@text.strike"] = syntax["Strikethrough"]
  -- replacement in nvim-treesitter 0.10
  syntax["@markup.strong"] = { fg = colors.base1, bold = true }
  syntax["@markup.emphasis"] = { fg = colors.base1, bold = true }
  syntax["@markup.italic"] = { fg = colors.base1, italic = true }
  syntax["@markup.underline"] = syntax["Underlined"]
  syntax["@markup.strike"] = syntax["Strikethrough"]
  syntax["@markup.strikethrough"] = syntax["Strikethrough"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@text.title"] = syntax["Title"]
  syntax["@text.literal"] = syntax["String"]
  -- replacement in nvim-treesitter 0.10
  syntax["@markup.heading"] = syntax["Title"]
  syntax["@markup.raw"] = syntax["String"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@text.uri"] = syntax["Underlined"]
  -- replacement in nvim-treesitter 0.10
  syntax["@string.special.url"] = syntax["Underlined"]
  syntax["@markup.link.url"] = syntax["Underlined"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@text.math"] = syntax["Special"]
  syntax["@text.environment"] = syntax["Macro"]
  syntax["@text.environment.name"] = syntax["Type"]
  -- replacement in nvim-treesitter 0.10
  syntax["@markup.math"] = syntax["@text.emphasis"]
  syntax["@markup.environment"] = syntax["Macro"]
  syntax["@markup.environment.name"] = syntax["Type"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@text.reference"] = syntax["Constant"]
  -- replacement in nvim-treesitter 0.10
  syntax["@markup.link"] = syntax["Constant"]

  -- deprecated in nvim-treesitter 0.10
  syntax["@text.todo"] = syntax["Todo"]
  -- replacement in nvim-treesitter 0.10
  syntax["@markup.list.checked"] = syntax["Todo"]
  syntax["@markup.list.unchecked"] = syntax["Todo"]
  syntax["@comment.todo"] = syntax["Todo"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@text.note"] = syntax["WarningMsg"]
  -- replacement in nvim-treesitter 0.10
  syntax["@comment.info"] = syntax["WarningMsg"]
  syntax["@comment.hint"] = syntax["WarningMsg"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@text.warning"] = syntax["WarningMsg"]
  -- replacement in nvim-treesitter 0.10
  syntax["@comment.warning"] = syntax["WarningMsg"]
  -- deprecated in nvim-treesitter 0.10
  syntax["@text.danger"] = { fg = colors.red, bold = true }
  -- replacement in nvim-treesitter 0.10
  syntax["@comment.danger"] = { fg = colors.red, bold = true }
  -- }}}

  -- Tags {{{
  syntax["@tag"] = syntax["Tag"]
  syntax["@tag.attribute"] = syntax["Identifier"]
  syntax["@tag.delimiter"] = syntax["Delimiter"]
  -- }}}
  -- END Neovim >= 0.8

  syntax["DiagnosticError"] = { fg = colors.red, sp = colors.red }
  syntax["DiagnosticWarn"] = { fg = colors.yellow, sp = colors.yellow }
  syntax["DiagnosticInfo"] = { fg = colors.cyan, sp = colors.cyan }
  syntax["DiagnosticHint"] = { fg = colors.green, sp = colors.green }
  syntax["DiagnosticUnderlineError"] = { fg = colors.none, sp = colors.red, underline = true }
  syntax["DiagnosticUnderlineWarn"] = { fg = colors.none, sp = colors.yellow, underline = true }
  syntax["DiagnosticUnderlineInfo"] = { fg = colors.none, sp = colors.cyan, underline = true }
  syntax["DiagnosticUnderlineHint"] = { fg = colors.none, sp = colors.green, underline = true }

  syntax["LspReferenceRead"] = { fg = colors.none, underline = true }
  syntax["LspReferenceText"] = syntax["LspReferenceRead"]
  syntax["LspReferenceWrite"] = { fg = colors.none, underline = true, bold = true }

  -- Lspsaga
  syntax["LspSagaFinderSelection"] = syntax["Search"]
  syntax["TargetWord"] = syntax["Title"]

  syntax["GitSignsAdd"] = syntax["DiffAdd"]
  syntax["GitSignsChange"] = syntax["DiffChange"]
  syntax["GitSignsDelete"] = syntax["DiffDelete"]

  syntax["VGitSignAdd"] = syntax["DiffAdd"]
  syntax["VgitSignChange"] = syntax["DiffChange"]
  syntax["VGitSignRemove"] = syntax["DiffDelete"]

  -- Mini.nvim
  syntax["MiniPickNormal"] = { fg = colors.base0, bg = syntax["Normal"].bg }
  syntax["MiniNotifyBorder"] = syntax["NormalFloat"]

  -- nvim-cmp syntax support
  syntax["CmpDocumentation"] = { fg = colors.base2, bg = colors.darkerfloat }
  syntax["CmpDocumentationBorder"] = { fg = colors.base2, bg = colors.darkerfloat }

  syntax["CmpItemAbbr"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemAbbrDeprecated"] = { fg = colors.base0, bg = colors.none }
  syntax["CmpItemAbbrMatch"] = { fg = colors.base2, bg = colors.none }
  syntax["CmpItemAbbrMatchFuzzy"] = { fg = colors.base2, bg = colors.none }

  syntax["CmpItemKindDefault"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemMenu"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindKeyword"] = { fg = colors.yellow, bg = colors.none }
  syntax["CmpItemKindVariable"] = { fg = colors.green, bg = colors.none }
  syntax["CmpItemKindConstant"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindReference"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindValue"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindFunction"] = { fg = colors.blue, bg = colors.none }
  syntax["CmpItemKindMethod"] = { fg = colors.blue, bg = colors.none }
  syntax["CmpItemKindConstructor"] = { fg = colors.blue, bg = colors.none }
  syntax["CmpItemKindClass"] = { fg = colors.red, bg = colors.none }
  syntax["CmpItemKindInterface"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindStruct"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindEvent"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindEnum"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindUnit"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindModule"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindProperty"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindField"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindTypeParameter"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindEnumMember"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindOperator"] = { fg = colors.base1, bg = colors.none }
  syntax["CmpItemKindSnippet"] = { fg = colors.orange, bg = colors.none }

  syntax["NavicIconsFile"] = syntax["CmpItemKindFile"]
  syntax["NavicIconsModule"] = syntax["CmpItemKindModule"]
  syntax["NavicIconsNamespace"] = syntax["CmpItemKindModule"]
  syntax["NavicIconsPackage"] = syntax["CmpItemKindModule"]
  syntax["NavicIconsClass"] = syntax["CmpItemKindClass"]
  syntax["NavicIconsMethod"] = syntax["CmpItemKindMethod"]
  syntax["NavicIconsProperty"] = syntax["CmpItemKindProperty"]
  syntax["NavicIconsField"] = syntax["CmpItemKindField"]
  syntax["NavicIconsConstructor"] = syntax["CmpItemKindConstructor"]
  syntax["NavicIconsEnum"] = syntax["CmpItemKindEnum"]
  syntax["NavicIconsInterface"] = syntax["CmpItemKindInterface"]
  syntax["NavicIconsFunction"] = syntax["CmpItemKindFunction"]
  syntax["NavicIconsVariable"] = syntax["CmpItemKindVariable"]
  syntax["NavicIconsConstant"] = syntax["CmpItemKindConstant"]
  syntax["NavicIconsString"] = syntax["String"]
  syntax["NavicIconsNumber"] = syntax["Number"]
  syntax["NavicIconsBoolean"] = syntax["Boolean"]
  syntax["NavicIconsArray"] = syntax["CmpItemKindClass"]
  syntax["NavicIconsObject"] = syntax["CmpItemKindClass"]
  syntax["NavicIconsKey"] = syntax["CmpItemKindKeyword"]
  syntax["NavicIconsKeyword"] = syntax["CmpItemKindKeyword"]
  syntax["NavicIconsNull"] = { fg = colors.blue, bg = colors.none }
  syntax["NavicIconsEnumMember"] = syntax["CmpItemKindEnumMember"]
  syntax["NavicIconsStruct"] = syntax["CmpItemKindStruct"]
  syntax["NavicIconsEvent"] = syntax["CmpItemKindEvent"]
  syntax["NavicIconsOperator"] = syntax["CmpItemKindOperator"]
  syntax["NavicIconsTypeParameter"] = syntax["CmpItemKindTypeParameter"]
  syntax["NavicText"] = syntax["LineNr"]
  syntax["NavicSeparator"] = syntax["Comment"]

  for group, hl in pairs(syntax) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  -- Terminal colors
  g.terminal_color_0 = colors.base02[1] -- '#073642'
  g.terminal_color_1 = colors.red[1] -- '#dc322f'
  g.terminal_color_2 = colors.green[1] -- '#859900'
  g.terminal_color_3 = colors.yellow[1] -- '#b58900'
  g.terminal_color_4 = colors.blue[1] -- '#268bd2'
  g.terminal_color_5 = colors.magenta[1] -- '#d33682'
  g.terminal_color_6 = colors.cyan[1] -- '#2aa198'
  g.terminal_color_7 = colors.base2[1] -- '#eee8d5'
  g.terminal_color_8 = colors.base03[1] -- '#002b36'
  g.terminal_color_9 = colors.orange[1] -- '#cb4b16'
  g.terminal_color_10 = colors.base01[1] -- '#586e75'
  g.terminal_color_11 = colors.base00[1] -- '#657b83'
  g.terminal_color_12 = colors.base0[1] -- '#839496'
  g.terminal_color_13 = colors.violet[1] -- '#6c71c4'
  g.terminal_color_14 = colors.base1[1] -- '#93a1a1'
  g.terminal_color_15 = colors.base3[1] -- '#fdf6e3'
end

return M
