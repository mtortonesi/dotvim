if exists(":AirlineToggle")

  set laststatus=2 " Use 2 lines for the statusbar

  if exists(':Tmuxline')
    " lucius works much better inside tmux
    let g:airline_theme='lucius'
  else
    let g:airline_theme='dark'
  endif

  let g:airline_detect_paste=1

  " let g:airline_enable_syntastic=1

  " enable powerline symbols
  let g:airline_powerline_fonts=1

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ' '
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
