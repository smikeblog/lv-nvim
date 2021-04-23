vim.g.which_key_fallback_to_native_key = 1
vim.g.which_key_display_names = {
    ['<CR>'] = '↵',
    ['<TAB>'] = '⇆',
}
vim.g.which_key_sep = '→'
vim.g.which_key_timeout = 300

-- leader  {{{1
local wk = require("whichkey_setup")

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- normal {{{1
local which_key_map = {}
-- general
which_key_map['I'] = {'*:lua require("funcs.search").vim("*."..vim.fn.expand("%:e"))<CR>', 'vimgrep cursor'}

which_key_map['/'] = 'comment toggle'
which_key_map[';'] = {':Dashboard<CR>', 'home screen' }
which_key_map[','] = {'<Plug>(emmet-expand-abbr)', 'expand tags' }
which_key_map['"'] = {':registers', 'registers' }
which_key_map['?'] = {':NvimTreeFindFile<CR>', 'find current file' }
which_key_map['e'] = {':NvimTreeToggle<CR>', 'explorer' }
which_key_map['f'] = {':Telescope find_files<CR>', 'find files' }
which_key_map['h'] = {'<C-W>s', 'split below'}
which_key_map['M'] = {':MarkdownPreviewToggle', 'markdown preview'}
which_key_map['H'] = {':let @/ = ""<CR>', 'no highlight' }
which_key_map['r'] = {':RnvimrToggle<CR>', 'ranger'}
--which_key_map['*'] = {':DogeGenerate', 'documentation generator'}
which_key_map['U'] = {':UndotreeToggle', 'undo tree'}
-- " TODO create entire treesitter section
which_key_map['T'] = {':TSHighlightCapturesUnderCursor', 'treesitter highlight'}
which_key_map['v'] = {'<C-W>v', 'split right'}
which_key_map['V'] = {':FloatermNew vifm<CR>', 'Vifm'}
-- " TODO play nice with status line
which_key_map['z'] = {'Goyo<CR>', 'zen'}

-- " Group mappings

-- " . is for emmet
which_key_map['E'] = {
    name = '+emmet',
      e    = {':call <Plug>(emmet-expand-abbr)<CR>', 'expand abbr'},
      w    = {'<plug>(emmet-expand-word)', 'expand word'},
      u    = {'<plug>(emmet-update-tag)', 'update tag'},
      d    = {'<plug>(emmet-balance-tag-inward)', 'balance tag in'},
      D    = {'<plug>(emmet-balance-tag-outward)', 'balance tag out'},
      n    = {'<plug>(emmet-move-next)', 'move next'},
      N    = {'<plug>(emmet-move-prev)', 'move prev'},
      i    = {'<plug>(emmet-image-size)', 'image size'},
      t    = {'<plug>(emmet-toggle-comment)', 'toggle comment'},
      j    = {'<plug>(emmet-split-join-tag)', 'split join tag'},
      k    = {'<plug>(emmet-remove-tag)', 'remove tag'},
      a    = {'<plug>(emmet-anchorize-url)', 'anchorize url'},
      A    = {'<plug>(emmet-anchorize-summary)', 'anchorize summary'},
      m    = {'<plug>(emmet-merge-lines)', 'merge lines'},
      c    = {'<plug>(emmet-code-pretty)', 'code pretty'},
    }

-- " a is for actions
which_key_map.a = {
    name = '+actions' ,
      c = {':ColorizerToggle<CR>'        , 'colorizer'},
      h = {':let @/ = ""'            , 'remove search highlight'},
      i = {':IndentBlanklineToggle'  , 'toggle indent lines'},
      n = {':set nonumber!'          , 'line-numbers'},
--      s = {':s/\%V\(.*\)\%V/"\1"/'   , 'surround'},
      r = {':set norelativenumber!'  , 'relative line nums'},
      a = {'<Plug>(dial-increment)'  , 'increment num/date'},
      x = {'<Plug>(dial-decrement)'  , 'decrement num/date'},
      v = {':Codi'                   , 'virtual repl on'},
      V = {':Codi!'                  , 'virtual repl off'},
    }

--" b is for buffer
which_key_map.b = {
    name = '+buffer' ,
	  l  = {':BufferOrderByLanguage<CR>'   		, 'move next'},
      D  = {':BufferOrderByDirectory<CR>' 		, 'move prev'},
      b  = {':BufferPick<CR>'            		, 'pick buffer'},
      c  = {':BufferClose<CR>'           		, 'close-buffer'},
      C  = {':BufferCloseAllButCurrent<CR>'     , 'close-all-other-buffs'},
      W  = {':BufferWipeout<CR>'                , 'buffer-wipeout'},
      d  = {':bd<CR>'                  		    , 'delete-buffer'},
      n  = {'bnext<CR>'                  		, 'next-buffer'},
      p  = {'bprevious<CR>'              		, 'previous-buffer'},
      B  = {':Telescope buffers<CR>'     		, 'Telescope-buffer-select'},
    }

--" d is for debug
which_key_map.d = {
   name = '+debug' ,
       b = {'DebugToggleBreakpoint '        , 'toggle breakpoint'},
       c = {'DebugContinue'                 , 'continue'},
       i = {'DebugStepInto'                 , 'step into'},
       o = {'DebugStepOver'                 , 'step over'},
       r = {'DebugToggleRepl'               , 'toggle repl'},
       s = {'DebugStart'                    , 'start'},
    }

--" D is for database
which_key_map.D = {
    name = '+database' ,
       u = {'DBUIToggle '        , 'db ui toggle'},
       f = {'DBUIFindBuffer'     , 'db find buffer'},
       r = {'DBUIRenameBuffer'   , 'db rename buffer'},
       l = {'DBUILastQueryInfo'  , 'db last query'},
    }

--" F is for fold
which_key_map.F = {
    name = '+fold',
       O = {':set foldlevel=20'  , 'open all'},
       C = {':set foldlevel=0'   , 'close all'},
       c = {':foldclose'         , 'close'},
       o = {':foldopen'          , 'open'},
--       1 = {':set foldlevel=1'   , 'level1'},
--       2 = {':set foldlevel=2'   , 'level2'},
--       3 = {':set foldlevel=3'   , 'level3'},
--       4 = {':set foldlevel=4'   , 'level4'},
--       5 = {':set foldlevel=5'   , 'level5'},
--       6 = {':set foldlevel=6'   , 'level6'},
    }

--" m is for mark
--" I'd rather use regular marks but they never clear
which_key_map.m = {
    name = '+mark',
       t = {':BookmarkToggle'   , 'toggle' },
       j = {':BookmarkNext'   , 'next mark'},
       k = {':BookmarkPrev'   , 'prev mark'}
     }

--" s is for search powered by telescope
which_key_map.s = {
    name = '+search' ,
       F = {':Telescope filetypes<CR>'                   , 'filetypes'},
       B = {':Telescope git_branches<CR>'                , 'git branches'},
       d = {':Telescope lsp_document_diagnostics<CR>'    , 'document_diagnostics'},
       D = {':Telescope lsp_workspace_diagnostics<CR>'   , 'workspace_diagnostics'},
       f = {':Telescope find_files<CR>'                  , 'files'},
       h = {':Telescope command_history<CR>'             , 'history'},
       i = {':Telescope media_files<CR>'                 , 'media files'},
       m = {':Telescope marks<CR>'                       , 'marks'},
       M = {':Telescope man_pages<CR>'                   , 'man_pages'},
       o = {':Telescope vim_options<CR>'                 , 'vim_options'},
       t = {':Telescope live_grep<CR>'                   , 'text'},
       r = {':Telescope registers<CR>'                   , 'registers'},
       w = {':Telescope file_browser<CR>'                , 'buf_fuz_find'},
       u = {':Telescope colorscheme<CR>'                 , 'colorschemes'},
       b = {':lua require("funcs.search").vim("*."..vim.fn.expand("%:e"))<CR>', 'search project'},
       a = {':lua require("funcs.search").vim("*")<CR>', 'seach project all'},
       s = {':set operatorfunc=v:lua.grep.operator<CR>g@', 'grep operator'},

    }

--" S is for Session
which_key_map.S = {
    name = '+Session' ,
       s = {':SessionSave'           , 'save session'},
       l = {':SessionLoad'           , 'load Session'},
    }

--" g is for git
which_key_map.g = {
    name = '+git' ,
       b = {':GitBlameToggle<CR>'                   , 'blame'},
       B = {':GBrowse<CR>'                          , 'browse'},
       d = {':Git diff<CR>'                         , 'diff'},
       j = {':NextHunk<CR>'                         , 'next hunk'},
       k = {':PrevHunk<CR>'                         , 'prev hunk'},
       l = {':Git log<CR>'                          , 'log'},
       p = {':PreviewHunk<CR>'                      , 'preview hunk'},
       r = {':ResetHunk<CR>'                        , 'reset hunk'},
       R = {':ResetBuffer<CR>'                      , 'reset buffer'},
       s = {':StageHunk<CR>'                        , 'stage hunk'},
       S = {':Gstatus<CR>'                          , 'status'},
       u = {':UndoStageHunk<CR>'                    , 'undo stage hunk'},
    }


--" l is for language server protocol
which_key_map.l = {
       name = '+lsp',
          a = {':Lspsaga code_action'                , 'code action'},
          A = {':Lspsaga range_code_action'          , 'selected action'},
          d = {':Telescope lsp_document_diagnostics' , 'document diagnostics'},
          D = {':Telescope lsp_workspace_diagnostics', 'workspace diagnostics'},
          f = {':LspFormatting'                      , 'format'},
          I = {':LspInfo<CR>'                            , 'lsp info'},
          v = {':LspVirtualTextToggle'               , 'lsp toggle virtual text'},
          l = {':Lspsaga lsp_finder'                 , 'lsp finder'},
          L = {':Lspsaga show_line_diagnostics'      , 'line_diagnostics'},
          p = {':Lspsaga preview_definition'         , 'preview definition'},
          q = {':Telescope quickfix<CR>'                 , 'quickfix'},
          r = {':Lspsaga rename'                     , 'rename'},
          T = {':LspTypeDefinition'                  , 'type defintion'},
          x = {':cclose'                             , 'close quickfix'},
          s = {':Telescope lsp_document_symbols'     , 'document symbols'},
          S = {':Telescope lsp_workspace_symbols'    , 'workspace symbols'},
    c = {'<Cmd>lua require("funcs.highlight").toggle_bright_comments()<CR>', 'toggle bright comments'},
       }
--      " \ 'H' : [':Lspsaga signature_help'             , 'signature_help'],
--      " \ 'o' : [':Vista!!'                            , 'outline'],

--" t is for terminal
which_key_map.t = {
    name = '+terminal' ,
--       ; = {':FloatermNew --wintype=normal --height=6'       , 'terminal'},
       f = {':FloatermNew fzf<CR>'                           , 'fzf'},
       g = {':FloatermNew lazygit<CR>'                       , 'git'},
       d = {':FloatermNew lazydocker'                        , 'docker'},
       n = {':FloatermNew node'                              , 'node'},
       N = {':FloatermNew nnn<CR>'                               , 'nnn'},
       p = {':FloatermNew python'                            , 'python'},
       m = {':FloatermNew lazynpm'                           , 'npm'},
       t = {':FloatermToggle<CR>'                                , 'toggle'},
       y = {':FloatermNew ytop'                              , 'ytop'},
       u = {':FloatermNew ncdu'                              , 'ncdu'},
       }

-- quickfix
which_key_map.q = {
    name = '+quickfix',
    q = {':lua require("funcs.quicklist").create_from_buffer()<CR>', 'from buffer'},
    G = {':clast<CR>', 'last'},
    g = {':cfirst<CR>', 'first'},
    c = {':cclose<CR>', 'close'},
    o = {':copen<CR>', 'open'},
}

-- make
which_key_map.M = {
    name = '+make',
    m = {':lua require("funcs.terminal").dedicated("make", "make", "tabnew")<CR>', 'make'},
    c = {':lua require("funcs.terminal").dedicated("make", "make clean", "tabnew")<CR>', 'clean'},
    a = {':lua require("funcs.terminal").dedicated("make", "make all", "tabnew")<CR>', 'all'},
    o = {':lua require("funcs.terminal").dedicated("make", "make open", "tabnew")<CR>', 'open'},
}

-- cwd
which_key_map.c = {
    name = '+cwd',
    d = {':cd %:p:h<CR>:pwd<CR>', 'cd to current'},
    l = {':lcd %:p:h<CR>:pwd<CR>', 'lcd to current'},
}

-- unicode
which_key_map.u = {
    name = '+unicode',
    t = {'<Cmd>lua require("funcs.unicode").replace_hex_to_char()<CR>', 'hx2ch'},
    f = {'<Cmd>lua require("funcs.unicode").replace_char_to_hex()<CR>', 'ch2hx'},
}

wk.register_keymap('leader', which_key_map)

-- visual {{{1
local which_key_visual_map = {}

which_key_visual_map.R = {
    K = {':move \'<\\-2<CR>gv\\-gv', 'move line up'},
    J = {':move \'>+1<CR>gv-gv', 'move line down'},
}
-- search
which_key_visual_map.U = {
    name = '+search',
    s = {':call v:lua.grep.operator(visualmode())<CR>', 'grep visual'},
}

wk.register_keymap('leader', which_key_visual_map, {mode = 'v'})

