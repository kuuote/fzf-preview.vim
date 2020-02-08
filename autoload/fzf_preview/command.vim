function! fzf_preview#command#file_list_command_options(console) abort
  return fzf_preview#command#command_options(a:console, '[[ "$(file --mime {})" =~ binary ]] && ' .
       \ g:fzf_binary_preview_command . ' || ' . g:fzf_preview_command)
endfunction

function! fzf_preview#command#command_options(console, preview, ...) abort
  let optional = get(a:, 1, 0) !=# '' ? get(a:, 1, 0) : ''

  let multi = '--multi '
  let fix = '--reverse --ansi '
  let prompt = '--prompt="' . a:console . '> " '
  let bind = '--bind=' . g:fzf_preview_preview_key_bindings . ' '
  let expect = '--expect=' . g:fzf_preview_split_key_map . ',' . g:fzf_preview_split_key_map . ',' . g:fzf_preview_vsplit_key_map . ',' . g:fzf_preview_tabedit_key_map . ',' . g:fzf_preview_build_quickfix_key_map . ' '
  let color = g:fzf_preview_fzf_color_option !=# '' ? '--color=' . g:fzf_preview_fzf_color_option : ''
  let preview = "--preview='" . a:preview . "' "

  return multi . fix . prompt . bind . expect . color . preview . optional
endfunction

function! fzf_preview#command#grep_command(args) abort
  if len(a:args) >= 1
    return g:fzf_preview_grep_cmd . ' ' . a:args[0]
  else
    return g:fzf_preview_grep_cmd . ' .'
  end
endfunction
