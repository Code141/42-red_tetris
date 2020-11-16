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
tabnew
tabnew
tabrewind
edit src/server/package.json
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 182 + 182) / 364)
exe 'vert 2resize ' . ((&columns * 181 + 182) / 364)
argglobal
let s:l = 2 - ((1 * winheight(0) + 45) / 90)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/package.json") | buffer ~/cursus/red_tetris/src/client/package.json | else | edit ~/cursus/red_tetris/src/client/package.json | endif
let s:l = 1 - ((0 * winheight(0) + 45) / 90)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
exe 'vert 1resize ' . ((&columns * 182 + 182) / 364)
exe 'vert 2resize ' . ((&columns * 181 + 182) / 364)
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
exe 'vert 1resize ' . ((&columns * 92 + 182) / 364)
exe '2resize ' . ((&lines * 1 + 47) / 94)
exe 'vert 2resize ' . ((&columns * 84 + 182) / 364)
exe '3resize ' . ((&lines * 88 + 47) / 94)
exe 'vert 3resize ' . ((&columns * 84 + 182) / 364)
exe '4resize ' . ((&lines * 25 + 47) / 94)
exe 'vert 4resize ' . ((&columns * 93 + 182) / 364)
exe '5resize ' . ((&lines * 64 + 47) / 94)
exe 'vert 5resize ' . ((&columns * 93 + 182) / 364)
exe '6resize ' . ((&lines * 1 + 47) / 94)
exe 'vert 6resize ' . ((&columns * 92 + 182) / 364)
exe '7resize ' . ((&lines * 88 + 47) / 94)
exe 'vert 7resize ' . ((&columns * 92 + 182) / 364)
argglobal
let s:l = 120 - ((17 * winheight(0) + 45) / 90)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
120
normal! 026|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/board.js") | buffer ~/cursus/red_tetris/src/server/game/board.js | else | edit ~/cursus/red_tetris/src/server/game/board.js | endif
let s:l = 3 - ((0 * winheight(0) + 0) / 1)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 023|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/game.js") | buffer ~/cursus/red_tetris/src/server/game/game.js | else | edit ~/cursus/red_tetris/src/server/game/game.js | endif
let s:l = 16 - ((15 * winheight(0) + 44) / 88)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 015|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/piece.js") | buffer ~/cursus/red_tetris/src/server/game/piece.js | else | edit ~/cursus/red_tetris/src/server/game/piece.js | endif
let s:l = 35 - ((19 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
35
normal! 03|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/player.js") | buffer ~/cursus/red_tetris/src/server/game/player.js | else | edit ~/cursus/red_tetris/src/server/game/player.js | endif
let s:l = 120 - ((62 * winheight(0) + 32) / 64)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
120
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/rules.js") | buffer ~/cursus/red_tetris/src/server/game/rules.js | else | edit ~/cursus/red_tetris/src/server/game/rules.js | endif
let s:l = 1 - ((0 * winheight(0) + 0) / 1)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/default_rules.json") | buffer ~/cursus/red_tetris/src/server/game/default_rules.json | else | edit ~/cursus/red_tetris/src/server/game/default_rules.json | endif
let s:l = 13 - ((12 * winheight(0) + 44) / 88)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 05|
lcd ~/cursus/red_tetris
wincmd w
exe 'vert 1resize ' . ((&columns * 92 + 182) / 364)
exe '2resize ' . ((&lines * 1 + 47) / 94)
exe 'vert 2resize ' . ((&columns * 84 + 182) / 364)
exe '3resize ' . ((&lines * 88 + 47) / 94)
exe 'vert 3resize ' . ((&columns * 84 + 182) / 364)
exe '4resize ' . ((&lines * 25 + 47) / 94)
exe 'vert 4resize ' . ((&columns * 93 + 182) / 364)
exe '5resize ' . ((&lines * 64 + 47) / 94)
exe 'vert 5resize ' . ((&columns * 93 + 182) / 364)
exe '6resize ' . ((&lines * 1 + 47) / 94)
exe 'vert 6resize ' . ((&columns * 92 + 182) / 364)
exe '7resize ' . ((&lines * 88 + 47) / 94)
exe 'vert 7resize ' . ((&columns * 92 + 182) / 364)
tabnext
edit ~/cursus/red_tetris/src/client/src/index.js
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
3wincmd h
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
3wincmd k
wincmd w
wincmd w
wincmd w
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
exe '1resize ' . ((&lines * 14 + 47) / 94)
exe 'vert 1resize ' . ((&columns * 93 + 182) / 364)
exe '2resize ' . ((&lines * 15 + 47) / 94)
exe 'vert 2resize ' . ((&columns * 93 + 182) / 364)
exe '3resize ' . ((&lines * 30 + 47) / 94)
exe 'vert 3resize ' . ((&columns * 93 + 182) / 364)
exe '4resize ' . ((&lines * 28 + 47) / 94)
exe 'vert 4resize ' . ((&columns * 93 + 182) / 364)
exe 'vert 5resize ' . ((&columns * 93 + 182) / 364)
exe '6resize ' . ((&lines * 20 + 47) / 94)
exe 'vert 6resize ' . ((&columns * 84 + 182) / 364)
exe '7resize ' . ((&lines * 69 + 47) / 94)
exe 'vert 7resize ' . ((&columns * 84 + 182) / 364)
exe '8resize ' . ((&lines * 45 + 47) / 94)
exe 'vert 8resize ' . ((&columns * 91 + 182) / 364)
exe '9resize ' . ((&lines * 44 + 47) / 94)
exe 'vert 9resize ' . ((&columns * 91 + 182) / 364)
argglobal
let s:l = 32 - ((4 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
32
normal! 09|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/css/style.css") | buffer ~/cursus/red_tetris/src/client/src/css/style.css | else | edit ~/cursus/red_tetris/src/client/src/css/style.css | endif
let s:l = 1 - ((0 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/reducers/index.js") | buffer ~/cursus/red_tetris/src/client/src/reducers/index.js | else | edit ~/cursus/red_tetris/src/client/src/reducers/index.js | endif
let s:l = 3 - ((1 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/hooks/history.js") | buffer ~/cursus/red_tetris/src/client/src/hooks/history.js | else | edit ~/cursus/red_tetris/src/client/src/hooks/history.js | endif
let s:l = 1 - ((0 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/middleware/socket.js") | buffer ~/cursus/red_tetris/src/client/src/middleware/socket.js | else | edit ~/cursus/red_tetris/src/client/src/middleware/socket.js | endif
let s:l = 69 - ((68 * winheight(0) + 45) / 90)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
69
normal! 026|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/actions/game.js") | buffer ~/cursus/red_tetris/src/client/src/actions/game.js | else | edit ~/cursus/red_tetris/src/client/src/actions/game.js | endif
let s:l = 7 - ((6 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
7
normal! 025|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/reducers/game.js") | buffer ~/cursus/red_tetris/src/client/src/reducers/game.js | else | edit ~/cursus/red_tetris/src/client/src/reducers/game.js | endif
let s:l = 55 - ((54 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
55
normal! 08|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/reducers/user.js") | buffer ~/cursus/red_tetris/src/client/src/reducers/user.js | else | edit ~/cursus/red_tetris/src/client/src/reducers/user.js | endif
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/reducers/rooms.js") | buffer ~/cursus/red_tetris/src/client/src/reducers/rooms.js | else | edit ~/cursus/red_tetris/src/client/src/reducers/rooms.js | endif
let s:l = 1 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
exe '1resize ' . ((&lines * 14 + 47) / 94)
exe 'vert 1resize ' . ((&columns * 93 + 182) / 364)
exe '2resize ' . ((&lines * 15 + 47) / 94)
exe 'vert 2resize ' . ((&columns * 93 + 182) / 364)
exe '3resize ' . ((&lines * 30 + 47) / 94)
exe 'vert 3resize ' . ((&columns * 93 + 182) / 364)
exe '4resize ' . ((&lines * 28 + 47) / 94)
exe 'vert 4resize ' . ((&columns * 93 + 182) / 364)
exe 'vert 5resize ' . ((&columns * 93 + 182) / 364)
exe '6resize ' . ((&lines * 20 + 47) / 94)
exe 'vert 6resize ' . ((&columns * 84 + 182) / 364)
exe '7resize ' . ((&lines * 69 + 47) / 94)
exe 'vert 7resize ' . ((&columns * 84 + 182) / 364)
exe '8resize ' . ((&lines * 45 + 47) / 94)
exe 'vert 8resize ' . ((&columns * 91 + 182) / 364)
exe '9resize ' . ((&lines * 44 + 47) / 94)
exe 'vert 9resize ' . ((&columns * 91 + 182) / 364)
tabnext
edit ~/cursus/red_tetris/src/client/src/containers/app.js
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
3wincmd h
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
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 44 + 47) / 94)
exe 'vert 1resize ' . ((&columns * 92 + 182) / 364)
exe '2resize ' . ((&lines * 45 + 47) / 94)
exe 'vert 2resize ' . ((&columns * 92 + 182) / 364)
exe '3resize ' . ((&lines * 64 + 47) / 94)
exe 'vert 3resize ' . ((&columns * 93 + 182) / 364)
exe '4resize ' . ((&lines * 25 + 47) / 94)
exe 'vert 4resize ' . ((&columns * 93 + 182) / 364)
exe '5resize ' . ((&lines * 44 + 47) / 94)
exe 'vert 5resize ' . ((&columns * 92 + 182) / 364)
exe '6resize ' . ((&lines * 45 + 47) / 94)
exe 'vert 6resize ' . ((&columns * 92 + 182) / 364)
exe 'vert 7resize ' . ((&columns * 84 + 182) / 364)
argglobal
let s:l = 5 - ((4 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 049|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/hooks/keyboard.js") | buffer ~/cursus/red_tetris/src/client/src/hooks/keyboard.js | else | edit ~/cursus/red_tetris/src/client/src/hooks/keyboard.js | endif
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/containers/game.js") | buffer ~/cursus/red_tetris/src/client/src/containers/game.js | else | edit ~/cursus/red_tetris/src/client/src/containers/game.js | endif
let s:l = 37 - ((36 * winheight(0) + 32) / 64)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
37
normal! 09|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/components/board.js") | buffer ~/cursus/red_tetris/src/client/src/components/board.js | else | edit ~/cursus/red_tetris/src/client/src/components/board.js | endif
let s:l = 33 - ((10 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
33
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/components/form.js") | buffer ~/cursus/red_tetris/src/client/src/components/form.js | else | edit ~/cursus/red_tetris/src/client/src/components/form.js | endif
let s:l = 1 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/components/createRoom.js") | buffer ~/cursus/red_tetris/src/client/src/components/createRoom.js | else | edit ~/cursus/red_tetris/src/client/src/components/createRoom.js | endif
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/components/roomList.js") | buffer ~/cursus/red_tetris/src/client/src/components/roomList.js | else | edit ~/cursus/red_tetris/src/client/src/components/roomList.js | endif
let s:l = 3 - ((2 * winheight(0) + 45) / 90)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 08|
lcd ~/cursus/red_tetris
wincmd w
6wincmd w
exe '1resize ' . ((&lines * 44 + 47) / 94)
exe 'vert 1resize ' . ((&columns * 92 + 182) / 364)
exe '2resize ' . ((&lines * 45 + 47) / 94)
exe 'vert 2resize ' . ((&columns * 92 + 182) / 364)
exe '3resize ' . ((&lines * 64 + 47) / 94)
exe 'vert 3resize ' . ((&columns * 93 + 182) / 364)
exe '4resize ' . ((&lines * 25 + 47) / 94)
exe 'vert 4resize ' . ((&columns * 93 + 182) / 364)
exe '5resize ' . ((&lines * 44 + 47) / 94)
exe 'vert 5resize ' . ((&columns * 92 + 182) / 364)
exe '6resize ' . ((&lines * 45 + 47) / 94)
exe 'vert 6resize ' . ((&columns * 92 + 182) / 364)
exe 'vert 7resize ' . ((&columns * 84 + 182) / 364)
tabnext 4
badd +1 ~/cursus/red_tetris/src/server/index.mjs
badd +2 ~/cursus/red_tetris/.eslintignore
badd +4 ~/cursus/red_tetris/src/server/package.json
badd +1 ~/cursus/red_tetris/src/client/package.json
badd +1 ~/cursus/red_tetris/src/server/game/board.js
badd +1 ~/cursus/red_tetris/src/server/game/game.js
badd +1 ~/cursus/red_tetris/src/server/game/piece.js
badd +1 ~/cursus/red_tetris/src/server/game/player.js
badd +1 ~/cursus/red_tetris/src/server/game/rules.js
badd +1 ~/cursus/red_tetris/src/server/game/default_rules.json
badd +1 ~/cursus/red_tetris/src/server
badd +1 ~/cursus/red_tetris/src/client
badd +36 ~/cursus/red_tetris/src/client/public/index.html
badd +1 ~/cursus/red_tetris/src/client/public/manifest.json
badd +17 ~/cursus/red_tetris/src/client/src/index.js
badd +2 ~/cursus/red_tetris/src/client/public/robots.txt
badd +2 ~/cursus/red_tetris/src/client/src/reducers/index.js
badd +10 ~/cursus/red_tetris/src/client/src/reducers/game.js
badd +0 ~/cursus/red_tetris/src/client/src/reducers/user.js
badd +0 ~/cursus/red_tetris/src/client/src/reducers/rooms.js
badd +2 ~/cursus/red_tetris/src/client/src/middleware/socket.js
badd +0 ~/cursus/red_tetris/src/client/src/hooks/history.js
badd +4 ~/cursus/red_tetris/src/client/src/containers/app.js
badd +4 ~/cursus/red_tetris/src/client/src/containers/game.js
badd +1 ~/cursus/red_tetris/src/client/src/components/form.js
badd +0 ~/cursus/red_tetris/src/client/src/components/roomList.js
badd +0 ~/cursus/red_tetris/src/client/src/hooks/keyboard.js
badd +0 ~/cursus/red_tetris/src/client/src/components/board.js
badd +0 ~/cursus/red_tetris/src/client/src/actions/user.js
badd +0 ~/cursus/red_tetris/src/client/src/css/style.css
badd +0 ~/cursus/red_tetris/src/client/src/actions/game.js
badd +1 ~/cursus/red_tetris/src/client/src/components/createRoom.js
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
