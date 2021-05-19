" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/site/plugged')

" List of plugins.
" Make sure you use single quotes
" General
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'joshdick/onedark.vim' 
" comment
Plug 'preservim/nerdcommenter', {'for': ['python', 'julia']}
" Git
Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'
" Syntax highlighting for various languages
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'nvim-lua/completion-nvim'
" Wrapper of some vim/neovim's :terminal functions.
" Facilitate sending lines to interpreter
Plug 'kassio/neoterm'
" R
Plug 'jalvesaq/Nvim-R'
" Julia
Plug 'JuliaEditorSupport/julia-vim'
" for viewing data directly in vim R (Nvim-R)
Plug 'chrisbra/csv.vim' 
" stan
Plug 'eigenfoo/stan-vim'
" Optional: better Rnoweb support (LaTeX completion)
Plug 'lervag/vimtex'
" yaml
Plug 'pedrohdz/vim-yaml-folds'
" za: Toggle current fold
" zR: Expand all folds

" Initialize plugin system
call plug#end()
