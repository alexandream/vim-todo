function! Todo_ToggleItem()
	let l:colnum = col('.')
	let l:linenum = line('.')
	if empty(matchstr(getline('.'), '^\s\+[-ox] '))
		call search('^\s\+[-ox]', 'bW')
	endif
	let l:line = getline('.')
	if ! empty(matchstr(l:line, '^\s\+- '))
		s/^\(\s*\)- /\1o /
	elseif ! empty(matchstr(l:line, '^\s\+o '))
		s/^\(\s*\)o /\1x /
	elseif ! empty(matchstr(l:line, '^\s\+x '))
		s/^\(\s*\)x /\1- /
	endif
	call cursor(l:linenum, l:colnum)
endfunction

function! Todo_SetLineToTimeWithHeader(line, header)
	let l:time   = strftime('%F %H:%M')
	call setline(a:line, a:header . l:time)
endfunction

function! Todo_SetMatchingLineToTimeWithHeader(pattern, header)
	let l:colnum = col('.')
	let l:linenum = line('.')
	let l:line = search(a:pattern, 'w')
	if l:line > 0
		call Todo_SetLineToTimeWithHeader(l:line, a:header)
	endif
	call cursor(l:linenum, l:colnum)
endfunction

function! Todo_Start()
	call Todo_SetMatchingLineToTimeWithHeader('\c^\s*Activity start: ',
	\                                         'Activity start:  ')
endfunction

function! Todo_Finish()
	call Todo_SetMatchingLineToTimeWithHeader('\c^\s*Activity finish: ',
	\                                         'Activity finish: ')
endfunction

nnoremap <CR> :call Todo_ToggleItem()<CR>
