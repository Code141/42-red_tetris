let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
exe "cd " . escape(expand("<sfile>:p:h"), ' ')
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
tabnew
tabrewind
edit src/server/NetrwTreeListing
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 40 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 171 + 182) / 365)
exe '2resize ' . ((&lines * 50 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 171 + 182) / 365)
exe '3resize ' . ((&lines * 40 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 193 + 182) / 365)
exe '4resize ' . ((&lines * 50 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 193 + 182) / 365)
argglobal
enew
wincmd w
argglobal
let s:l = 2 - ((1 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/package.json") | buffer ~/cursus/red_tetris/src/server/package.json | else | edit ~/cursus/red_tetris/src/server/package.json | endif
let s:l = 1 - ((0 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/package.json") | buffer ~/cursus/red_tetris/src/client/package.json | else | edit ~/cursus/red_tetris/src/client/package.json | endif
let s:l = 1 - ((0 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
exe '1resize ' . ((&lines * 40 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 171 + 182) / 365)
exe '2resize ' . ((&lines * 50 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 171 + 182) / 365)
exe '3resize ' . ((&lines * 40 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 193 + 182) / 365)
exe '4resize ' . ((&lines * 50 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 193 + 182) / 365)
tabnext
edit ~/cursus/red_tetris/src/server/index.mjs
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
3wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 84 + 182) / 365)
exe '2resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 93 + 182) / 365)
exe '3resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 93 + 182) / 365)
exe '4resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 93 + 182) / 365)
exe '5resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 93 + 182) / 365)
exe '6resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 92 + 182) / 365)
exe '7resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 92 + 182) / 365)
argglobal
let s:l = 2 - ((1 * winheight(0) + 45) / 91)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/board.js") | buffer ~/cursus/red_tetris/src/server/game/board.js | else | edit ~/cursus/red_tetris/src/server/game/board.js | endif
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/game.js") | buffer ~/cursus/red_tetris/src/server/game/game.js | else | edit ~/cursus/red_tetris/src/server/game/game.js | endif
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 015|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/piece.js") | buffer ~/cursus/red_tetris/src/server/game/piece.js | else | edit ~/cursus/red_tetris/src/server/game/piece.js | endif
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/player.js") | buffer ~/cursus/red_tetris/src/server/game/player.js | else | edit ~/cursus/red_tetris/src/server/game/player.js | endif
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/rules.js") | buffer ~/cursus/red_tetris/src/server/game/rules.js | else | edit ~/cursus/red_tetris/src/server/game/rules.js | endif
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/default_rules.json") | buffer ~/cursus/red_tetris/src/server/game/default_rules.json | else | edit ~/cursus/red_tetris/src/server/game/default_rules.json | endif
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
exe 'vert 1resize ' . ((&columns * 84 + 182) / 365)
exe '2resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 93 + 182) / 365)
exe '3resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 93 + 182) / 365)
exe '4resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 93 + 182) / 365)
exe '5resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 93 + 182) / 365)
exe '6resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 92 + 182) / 365)
exe '7resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 92 + 182) / 365)
tabnext 2
badd +1 ~/cursus/red_tetris/src/server/package.json
badd +1 ~/cursus/red_tetris/src/client/package.json
badd +1 ~/cursus/red_tetris/src/server/index.mjs
badd +1 ~/cursus/red_tetris/src/server
badd +0 ~/cursus/red_tetris/src/server/game/game.js
badd +0 ~/cursus/red_tetris/src/server/game/player.js
badd +0 ~/cursus/red_tetris/src/server/game/default_rules.json
badd +0 ~/cursus/red_tetris/src/server/game/piece.js
badd +0 ~/cursus/red_tetris/src/server/game/board.js
badd +0 ~/cursus/red_tetris/src/server/game/rules.js
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=10 winwidth=84 shortmess=filnxtToOS
set winminheight=1 winminwidth=10
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
