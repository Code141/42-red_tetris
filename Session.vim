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
exe 'vert 1resize ' . ((&columns * 179 + 182) / 365)
exe 'vert 2resize ' . ((&columns * 185 + 182) / 365)
argglobal
let s:l = 16 - ((15 * winheight(0) + 45) / 91)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 018|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/package.json") | buffer ~/cursus/red_tetris/src/client/package.json | else | edit ~/cursus/red_tetris/src/client/package.json | endif
let s:l = 1 - ((0 * winheight(0) + 45) / 91)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
exe 'vert 1resize ' . ((&columns * 179 + 182) / 365)
exe 'vert 2resize ' . ((&columns * 185 + 182) / 365)
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
exe 'vert 1resize ' . ((&columns * 91 + 182) / 365)
exe '2resize ' . ((&lines * 15 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 84 + 182) / 365)
exe '3resize ' . ((&lines * 75 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 84 + 182) / 365)
exe '4resize ' . ((&lines * 10 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 91 + 182) / 365)
exe '5resize ' . ((&lines * 80 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 91 + 182) / 365)
exe '6resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 96 + 182) / 365)
exe '7resize ' . ((&lines * 47 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 96 + 182) / 365)
argglobal
let s:l = 139 - ((25 * winheight(0) + 45) / 91)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
139
normal! 015|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/board.js") | buffer ~/cursus/red_tetris/src/server/game/board.js | else | edit ~/cursus/red_tetris/src/server/game/board.js | endif
let s:l = 43 - ((12 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
43
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/game.js") | buffer ~/cursus/red_tetris/src/server/game/game.js | else | edit ~/cursus/red_tetris/src/server/game/game.js | endif
let s:l = 62 - ((28 * winheight(0) + 37) / 75)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
62
normal! 032|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/piece.js") | buffer ~/cursus/red_tetris/src/server/game/piece.js | else | edit ~/cursus/red_tetris/src/server/game/piece.js | endif
let s:l = 28 - ((5 * winheight(0) + 5) / 10)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
28
normal! 011|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/player.js") | buffer ~/cursus/red_tetris/src/server/game/player.js | else | edit ~/cursus/red_tetris/src/server/game/player.js | endif
let s:l = 79 - ((37 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
79
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/rules.js") | buffer ~/cursus/red_tetris/src/server/game/rules.js | else | edit ~/cursus/red_tetris/src/server/game/rules.js | endif
let s:l = 1 - ((0 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/default_rules.json") | buffer ~/cursus/red_tetris/src/server/game/default_rules.json | else | edit ~/cursus/red_tetris/src/server/game/default_rules.json | endif
let s:l = 53 - ((41 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
53
normal! 018|
lcd ~/cursus/red_tetris
wincmd w
exe 'vert 1resize ' . ((&columns * 91 + 182) / 365)
exe '2resize ' . ((&lines * 15 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 84 + 182) / 365)
exe '3resize ' . ((&lines * 75 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 84 + 182) / 365)
exe '4resize ' . ((&lines * 10 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 91 + 182) / 365)
exe '5resize ' . ((&lines * 80 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 91 + 182) / 365)
exe '6resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 96 + 182) / 365)
exe '7resize ' . ((&lines * 47 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 96 + 182) / 365)
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
exe '1resize ' . ((&lines * 22 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 93 + 182) / 365)
exe '2resize ' . ((&lines * 22 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 93 + 182) / 365)
exe '3resize ' . ((&lines * 22 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 93 + 182) / 365)
exe '4resize ' . ((&lines * 22 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 93 + 182) / 365)
exe 'vert 5resize ' . ((&columns * 84 + 182) / 365)
exe '6resize ' . ((&lines * 11 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 93 + 182) / 365)
exe '7resize ' . ((&lines * 79 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 93 + 182) / 365)
exe '8resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 92 + 182) / 365)
exe '9resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 9resize ' . ((&columns * 92 + 182) / 365)
argglobal
let s:l = 1 - ((0 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/css/style.css") | buffer ~/cursus/red_tetris/src/client/src/css/style.css | else | edit ~/cursus/red_tetris/src/client/src/css/style.css | endif
let s:l = 17 - ((16 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 06|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/reducers/index.js") | buffer ~/cursus/red_tetris/src/client/src/reducers/index.js | else | edit ~/cursus/red_tetris/src/client/src/reducers/index.js | endif
let s:l = 12 - ((8 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12
normal! 026|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/hooks/history.js") | buffer ~/cursus/red_tetris/src/client/src/hooks/history.js | else | edit ~/cursus/red_tetris/src/client/src/hooks/history.js | endif
let s:l = 1 - ((0 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/middleware/socket.js") | buffer ~/cursus/red_tetris/src/client/src/middleware/socket.js | else | edit ~/cursus/red_tetris/src/client/src/middleware/socket.js | endif
let s:l = 40 - ((39 * winheight(0) + 45) / 91)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
40
normal! 024|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/actions/game.js") | buffer ~/cursus/red_tetris/src/client/src/actions/game.js | else | edit ~/cursus/red_tetris/src/client/src/actions/game.js | endif
let s:l = 19 - ((8 * winheight(0) + 5) / 11)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
19
normal! 05|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/reducers/game.js") | buffer ~/cursus/red_tetris/src/client/src/reducers/game.js | else | edit ~/cursus/red_tetris/src/client/src/reducers/game.js | endif
let s:l = 164 - ((61 * winheight(0) + 39) / 79)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
164
normal! 016|
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
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
exe '1resize ' . ((&lines * 22 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 93 + 182) / 365)
exe '2resize ' . ((&lines * 22 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 93 + 182) / 365)
exe '3resize ' . ((&lines * 22 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 93 + 182) / 365)
exe '4resize ' . ((&lines * 22 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 93 + 182) / 365)
exe 'vert 5resize ' . ((&columns * 84 + 182) / 365)
exe '6resize ' . ((&lines * 11 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 93 + 182) / 365)
exe '7resize ' . ((&lines * 79 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 93 + 182) / 365)
exe '8resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 92 + 182) / 365)
exe '9resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 9resize ' . ((&columns * 92 + 182) / 365)
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
exe '1resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 93 + 182) / 365)
exe '2resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 93 + 182) / 365)
exe '3resize ' . ((&lines * 89 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 84 + 182) / 365)
exe '4resize ' . ((&lines * 1 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 84 + 182) / 365)
exe '5resize ' . ((&lines * 29 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 93 + 182) / 365)
exe '6resize ' . ((&lines * 61 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 93 + 182) / 365)
exe 'vert 7resize ' . ((&columns * 92 + 182) / 365)
argglobal
let s:l = 5 - ((4 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 037|
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
let s:l = 48 - ((47 * winheight(0) + 44) / 89)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
48
normal! 012|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/components/board.js") | buffer ~/cursus/red_tetris/src/client/src/components/board.js | else | edit ~/cursus/red_tetris/src/client/src/components/board.js | endif
let s:l = 1 - ((0 * winheight(0) + 0) / 1)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/components/form.js") | buffer ~/cursus/red_tetris/src/client/src/components/form.js | else | edit ~/cursus/red_tetris/src/client/src/components/form.js | endif
let s:l = 1 - ((0 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/components/createRoom.js") | buffer ~/cursus/red_tetris/src/client/src/components/createRoom.js | else | edit ~/cursus/red_tetris/src/client/src/components/createRoom.js | endif
let s:l = 22 - ((21 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
22
normal! 023|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/components/roomList.js") | buffer ~/cursus/red_tetris/src/client/src/components/roomList.js | else | edit ~/cursus/red_tetris/src/client/src/components/roomList.js | endif
let s:l = 3 - ((2 * winheight(0) + 45) / 91)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 08|
lcd ~/cursus/red_tetris
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 93 + 182) / 365)
exe '2resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 93 + 182) / 365)
exe '3resize ' . ((&lines * 89 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 84 + 182) / 365)
exe '4resize ' . ((&lines * 1 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 84 + 182) / 365)
exe '5resize ' . ((&lines * 29 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 93 + 182) / 365)
exe '6resize ' . ((&lines * 61 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 93 + 182) / 365)
exe 'vert 7resize ' . ((&columns * 92 + 182) / 365)
tabnext 4
badd +4 ~/cursus/red_tetris/src/server/package.json
badd +1 ~/cursus/red_tetris/src/server/index.mjs
badd +17 ~/cursus/red_tetris/src/client/src/index.js
badd +4 ~/cursus/red_tetris/src/client/src/containers/app.js
badd +1 ~/cursus/red_tetris/src/client/package.json
badd +1 ~/cursus/red_tetris/src/server/game/board.js
badd +1 ~/cursus/red_tetris/src/server/game/game.js
badd +1 ~/cursus/red_tetris/src/server/game/piece.js
badd +1 ~/cursus/red_tetris/src/server/game/player.js
badd +1 ~/cursus/red_tetris/src/server/game/rules.js
badd +1 ~/cursus/red_tetris/src/server/game/default_rules.json
badd +1 ~/cursus/red_tetris/src/client/src/css/style.css
badd +2 ~/cursus/red_tetris/src/client/src/reducers/index.js
badd +1 ~/cursus/red_tetris/src/client/src/hooks/history.js
badd +2 ~/cursus/red_tetris/src/client/src/middleware/socket.js
badd +13 ~/cursus/red_tetris/src/client/src/actions/game.js
badd +13 ~/cursus/red_tetris/src/client/src/reducers/game.js
badd +1 ~/cursus/red_tetris/src/client/src/reducers/user.js
badd +1 ~/cursus/red_tetris/src/client/src/reducers/rooms.js
badd +1 ~/cursus/red_tetris/src/client/src/hooks/keyboard.js
badd +4 ~/cursus/red_tetris/src/client/src/containers/game.js
badd +1 ~/cursus/red_tetris/src/client/src/components/board.js
badd +1 ~/cursus/red_tetris/src/client/src/components/form.js
badd +0 ~/cursus/red_tetris/src/client/src/components/createRoom.js
badd +1 ~/cursus/red_tetris/src/client/src/components/roomList.js
badd +2 ~/cursus/red_tetris/.eslintignore
badd +1 ~/cursus/red_tetris/src/server
badd +1 ~/cursus/red_tetris/src/client
badd +36 ~/cursus/red_tetris/src/client/public/index.html
badd +1 ~/cursus/red_tetris/src/client/public/manifest.json
badd +2 ~/cursus/red_tetris/src/client/public/robots.txt
badd +1 ~/cursus/red_tetris/src/client/src/actions/user.js
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
