" Source this file at startup to get live updating during development. It is
" only an aid, you do not need it.

let &rtp=expand('%:p:h') .. ','.. &rtp
colorscheme solarized-dark
nnoremap <F5> :call <SID>reload()<CR>

function! s:reload()
	echo 'reloading colour scheme'
	lua package.loaded['resolarized'] = nil
	lua package.loaded['resolarized.palette'] = nil
	lua package.loaded['resolarized.util'] = nil
	lua package.loaded['resolarized.scheme.dark'] = nil
	lua package.loaded['resolarized.scheme.light'] = nil
	colorscheme solarized-light
endfunction
