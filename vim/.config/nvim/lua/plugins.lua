return {
  {'LnL7/vim-nix'},
  {'ctrlpvim/ctrlp.vim'},
  {'Raimondi/delimitMate'},
  {'SirVer/ultisnips'},
  {'honza/vim-snippets'},
  {
    'mileszs/ack.vim',
    cond = vim.fn.executable('rg') == 1,
    config = function()
      vim.g.ackprg = 'rg --vimgrep'
    end,
  },
  {'vim-airline/vim-airline'},
  {'vim-airline/vim-airline-themes'},
  {
    'Shougo/deoplete.nvim',
    build = ':UpdateRemotePlugins',
  },
  {
    'fatih/vim-go',
    build = ':GoUpdateBinaries',
    ft = 'go',
  },
  {'tpope/vim-fugitive'},
}
