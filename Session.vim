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
$argadd ~/cursus/red_tetris/README.md
tabnew
tabnew
tabnew
tabrewind
edit package.json
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
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
exe '1resize ' . ((&lines * 87 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 117 + 182) / 365)
exe '2resize ' . ((&lines * 28 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 118 + 182) / 365)
exe '3resize ' . ((&lines * 26 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 118 + 182) / 365)
exe '4resize ' . ((&lines * 31 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 118 + 182) / 365)
exe '5resize ' . ((&lines * 41 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 122 + 182) / 365)
exe '6resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 122 + 182) / 365)
argglobal
let s:l = 1 - ((0 * winheight(0) + 43) / 87)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/webpack.config.js") | buffer ~/cursus/red_tetris_boilerplate/webpack.config.js | else | edit ~/cursus/red_tetris_boilerplate/webpack.config.js | endif
let s:l = 18 - ((15 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 02|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/.babelrc") | buffer ~/cursus/red_tetris_boilerplate/.babelrc | else | edit ~/cursus/red_tetris_boilerplate/.babelrc | endif
let s:l = 10 - ((8 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/.editorconfig") | buffer ~/cursus/red_tetris_boilerplate/.editorconfig | else | edit ~/cursus/red_tetris_boilerplate/.editorconfig | endif
let s:l = 10 - ((9 * winheight(0) + 15) / 31)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10
normal! 031|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/README.md") | buffer ~/cursus/red_tetris_boilerplate/README.md | else | edit ~/cursus/red_tetris_boilerplate/README.md | endif
let s:l = 1 - ((0 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/.eslintrc") | buffer ~/cursus/red_tetris_boilerplate/.eslintrc | else | edit ~/cursus/red_tetris_boilerplate/.eslintrc | endif
let s:l = 276 - ((37 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
276
normal! 032|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
exe '1resize ' . ((&lines * 87 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 117 + 182) / 365)
exe '2resize ' . ((&lines * 28 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 118 + 182) / 365)
exe '3resize ' . ((&lines * 26 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 118 + 182) / 365)
exe '4resize ' . ((&lines * 31 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 118 + 182) / 365)
exe '5resize ' . ((&lines * 41 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 122 + 182) / 365)
exe '6resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 122 + 182) / 365)
tabnext
edit ~/cursus/red_tetris_boilerplate/src/server/main.js
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
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 89 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 93 + 182) / 365)
exe '2resize ' . ((&lines * 1 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 93 + 182) / 365)
exe '3resize ' . ((&lines * 19 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 84 + 182) / 365)
exe '4resize ' . ((&lines * 71 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 84 + 182) / 365)
exe '5resize ' . ((&lines * 19 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 93 + 182) / 365)
exe '6resize ' . ((&lines * 71 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 93 + 182) / 365)
exe '7resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 92 + 182) / 365)
exe '8resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 92 + 182) / 365)
argglobal
let s:l = 54 - ((53 * winheight(0) + 44) / 89)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
54
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/server/index.js") | buffer ~/cursus/red_tetris_boilerplate/src/server/index.js | else | edit ~/cursus/red_tetris_boilerplate/src/server/index.js | endif
let s:l = 18 - ((0 * winheight(0) + 0) / 1)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 019|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/game/board.js") | buffer ~/cursus/red_tetris_boilerplate/src/game/board.js | else | edit ~/cursus/red_tetris_boilerplate/src/game/board.js | endif
let s:l = 15 - ((14 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
15
normal! 07|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/server/game.js") | buffer ~/cursus/red_tetris_boilerplate/src/server/game.js | else | edit ~/cursus/red_tetris_boilerplate/src/server/game.js | endif
let s:l = 102 - ((27 * winheight(0) + 35) / 71)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
102
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/game/piece.js") | buffer ~/cursus/red_tetris_boilerplate/src/game/piece.js | else | edit ~/cursus/red_tetris_boilerplate/src/game/piece.js | endif
let s:l = 11 - ((10 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
11
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/server/player.js") | buffer ~/cursus/red_tetris_boilerplate/src/server/player.js | else | edit ~/cursus/red_tetris_boilerplate/src/server/player.js | endif
let s:l = 23 - ((20 * winheight(0) + 35) / 71)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
23
normal! 02|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/game/rules.js") | buffer ~/cursus/red_tetris_boilerplate/src/game/rules.js | else | edit ~/cursus/red_tetris_boilerplate/src/game/rules.js | endif
let s:l = 80 - ((27 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
80
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/game/default_rules.json") | buffer ~/cursus/red_tetris_boilerplate/src/game/default_rules.json | else | edit ~/cursus/red_tetris_boilerplate/src/game/default_rules.json | endif
let s:l = 14 - ((13 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
14
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 89 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 93 + 182) / 365)
exe '2resize ' . ((&lines * 1 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 93 + 182) / 365)
exe '3resize ' . ((&lines * 19 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 84 + 182) / 365)
exe '4resize ' . ((&lines * 71 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 84 + 182) / 365)
exe '5resize ' . ((&lines * 19 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 93 + 182) / 365)
exe '6resize ' . ((&lines * 71 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 93 + 182) / 365)
exe '7resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 92 + 182) / 365)
exe '8resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 92 + 182) / 365)
tabnext
edit ~/cursus/red_tetris_boilerplate/src/client/history.js
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
2wincmd k
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
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
3wincmd k
wincmd w
wincmd w
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 28 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 83 + 182) / 365)
exe '2resize ' . ((&lines * 26 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 83 + 182) / 365)
exe '3resize ' . ((&lines * 31 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 83 + 182) / 365)
exe '4resize ' . ((&lines * 32 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 89 + 182) / 365)
exe '5resize ' . ((&lines * 54 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 89 + 182) / 365)
exe '6resize ' . ((&lines * 20 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 89 + 182) / 365)
exe '7resize ' . ((&lines * 20 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 89 + 182) / 365)
exe '8resize ' . ((&lines * 21 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 89 + 182) / 365)
exe '9resize ' . ((&lines * 23 + 47) / 95)
exe 'vert 9resize ' . ((&columns * 89 + 182) / 365)
exe '10resize ' . ((&lines * 87 + 47) / 95)
exe 'vert 10resize ' . ((&columns * 95 + 182) / 365)
argglobal
let s:l = 1 - ((0 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/reducers/index.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/reducers/index.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/reducers/index.js | endif
let s:l = 4 - ((3 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 026|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/index.html") | buffer ~/cursus/red_tetris_boilerplate/index.html | else | edit ~/cursus/red_tetris_boilerplate/index.html | endif
let s:l = 1 - ((0 * winheight(0) + 15) / 31)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 012|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/index.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/index.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/index.js | endif
let s:l = 1 - ((0 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/containers/app.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/containers/app.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/containers/app.js | endif
let s:l = 24 - ((22 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 017|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/actions/user.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/actions/user.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/actions/user.js | endif
let s:l = 9 - ((8 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/reducers/user.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/reducers/user.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/reducers/user.js | endif
let s:l = 17 - ((15 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 010|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/actions/rooms.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/actions/rooms.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/actions/rooms.js | endif
let s:l = 1 - ((0 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 035|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/reducers/rooms.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/reducers/rooms.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/reducers/rooms.js | endif
let s:l = 1 - ((0 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 016|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/middleware/socket.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/middleware/socket.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/middleware/socket.js | endif
let s:l = 50 - ((47 * winheight(0) + 43) / 87)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
50
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
exe '1resize ' . ((&lines * 28 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 83 + 182) / 365)
exe '2resize ' . ((&lines * 26 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 83 + 182) / 365)
exe '3resize ' . ((&lines * 31 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 83 + 182) / 365)
exe '4resize ' . ((&lines * 32 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 89 + 182) / 365)
exe '5resize ' . ((&lines * 54 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 89 + 182) / 365)
exe '6resize ' . ((&lines * 20 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 89 + 182) / 365)
exe '7resize ' . ((&lines * 20 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 89 + 182) / 365)
exe '8resize ' . ((&lines * 21 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 89 + 182) / 365)
exe '9resize ' . ((&lines * 23 + 47) / 95)
exe 'vert 9resize ' . ((&columns * 89 + 182) / 365)
exe '10resize ' . ((&lines * 87 + 47) / 95)
exe 'vert 10resize ' . ((&columns * 95 + 182) / 365)
tabnext
edit ~/cursus/red_tetris_boilerplate/src/client/actions/game.js
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
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 1 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 90 + 182) / 365)
exe '2resize ' . ((&lines * 85 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 90 + 182) / 365)
exe '3resize ' . ((&lines * 9 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 83 + 182) / 365)
exe '4resize ' . ((&lines * 77 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 83 + 182) / 365)
exe '5resize ' . ((&lines * 41 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 89 + 182) / 365)
exe '6resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 89 + 182) / 365)
exe '7resize ' . ((&lines * 41 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 94 + 182) / 365)
exe '8resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 94 + 182) / 365)
argglobal
let s:l = 5 - ((0 * winheight(0) + 0) / 1)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 017|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/reducers/game.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/reducers/game.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/reducers/game.js | endif
let s:l = 31 - ((29 * winheight(0) + 42) / 85)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
31
normal! 019|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/containers/game.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/containers/game.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/containers/game.js | endif
let s:l = 48 - ((4 * winheight(0) + 4) / 9)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
48
let s:c = 70 - ((62 * winwidth(0) + 41) / 83)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 70 . '|'
else
  normal! 070|
endif
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/components/board.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/components/board.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/components/board.js | endif
let s:l = 22 - ((20 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
22
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/components/form.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/components/form.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/components/form.js | endif
let s:l = 16 - ((14 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 021|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/components/roomList.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/components/roomList.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/components/roomList.js | endif
let s:l = 1 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/style.css") | buffer ~/cursus/red_tetris_boilerplate/style.css | else | edit ~/cursus/red_tetris_boilerplate/style.css | endif
let s:l = 4 - ((3 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/reset.css") | buffer ~/cursus/red_tetris_boilerplate/reset.css | else | edit ~/cursus/red_tetris_boilerplate/reset.css | endif
let s:l = 2 - ((1 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
exe '1resize ' . ((&lines * 1 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 90 + 182) / 365)
exe '2resize ' . ((&lines * 85 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 90 + 182) / 365)
exe '3resize ' . ((&lines * 9 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 83 + 182) / 365)
exe '4resize ' . ((&lines * 77 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 83 + 182) / 365)
exe '5resize ' . ((&lines * 41 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 89 + 182) / 365)
exe '6resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 89 + 182) / 365)
exe '7resize ' . ((&lines * 41 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 94 + 182) / 365)
exe '8resize ' . ((&lines * 45 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 94 + 182) / 365)
tabnext 2
badd +1 ~/cursus/red_tetris_boilerplate/package.json
badd +1 ~/cursus/red_tetris/README.md
badd +1 ~/cursus/red_tetris_boilerplate/src/server/main.js
badd +1 ~/cursus/red_tetris_boilerplate/src/client/history.js
badd +1 ~/cursus/red_tetris_boilerplate/src/client/actions/game.js
badd +1 ~/cursus/red_tetris_boilerplate/webpack.config.js
badd +1 ~/cursus/red_tetris_boilerplate/.babelrc
badd +1 ~/cursus/red_tetris_boilerplate/.editorconfig
badd +1 ~/cursus/red_tetris_boilerplate/README.md
badd +1 ~/cursus/red_tetris_boilerplate/.eslintrc
badd +1 ~/cursus/red_tetris_boilerplate/src/server/index.js
badd +1 ~/cursus/red_tetris_boilerplate/src/game/board.js
badd +0 ~/cursus/red_tetris_boilerplate/src/server/game.js
badd +1 ~/cursus/red_tetris_boilerplate/src/game/piece.js
badd +1 ~/cursus/red_tetris_boilerplate/src/server/player.js
badd +1 ~/cursus/red_tetris_boilerplate/src/game/rules.js
badd +1 ~/cursus/red_tetris_boilerplate/src/game/default_rules.json
badd +10 ~/cursus/red_tetris_boilerplate/src/client/reducers/index.js
badd +6 ~/cursus/red_tetris_boilerplate/index.html
badd +26 ~/cursus/red_tetris_boilerplate/src/client/index.js
badd +1 ~/cursus/red_tetris_boilerplate/src/client/containers/app.js
badd +5 ~/cursus/red_tetris_boilerplate/src/client/actions/user.js
badd +1 ~/cursus/red_tetris_boilerplate/src/client/reducers/user.js
badd +9 ~/cursus/red_tetris_boilerplate/src/client/actions/rooms.js
badd +16 ~/cursus/red_tetris_boilerplate/src/client/reducers/rooms.js
badd +1 ~/cursus/red_tetris_boilerplate/src/client/middleware/socket.js
badd +1 ~/cursus/red_tetris_boilerplate/src/client/reducers/game.js
badd +1 ~/cursus/red_tetris_boilerplate/src/client/containers/game.js
badd +1 ~/cursus/red_tetris_boilerplate/src/client/components/board.js
badd +1 ~/cursus/red_tetris_boilerplate/src/client/components/form.js
badd +1 ~/cursus/red_tetris_boilerplate/src/client/components/roomList.js
badd +1 ~/cursus/red_tetris_boilerplate/style.css
badd +1 ~/cursus/red_tetris_boilerplate/reset.css
badd +1 ~/cursus/red_tetris_boilerplate/src/client/components/test.js
badd +37 ~/cursus/red_tetris_boilerplate/src/game/game.js
badd +2 ~/cursus/red_tetris_boilerplate/src/game/player.js
badd +12 ~/cursus/red_tetris_boilerplate/params.js
badd +4 ~/cursus/red_tetris_boilerplate/.eslintignore
badd +6 ~/cursus/red_tetris_boilerplate/.gitignore
badd +2 ~/cursus/red_tetris_boilerplate/src/client/middleware/storeStateMiddleWare.js
badd +5 ~/cursus/red_tetris_boilerplate/src/client/actions/server.js
badd +2 ~/cursus/red_tetris_boilerplate/test/helpers/server.js
badd +3 ~/cursus/red_tetris_boilerplate/test/index.js
badd +1 ~/cursus/red_tetris_boilerplate/src/client
badd +1 ~/cursus/red_tetris_boilerplate/src/client/reducers/alert.js
badd +9 ~/cursus/red_tetris_boilerplate/src/client/actions/alert.js
badd +1 ~/cursus/red_tetris_boilerplate/src/client/components/style.module.css
badd +1 ~/cursus/red_tetris_boilerplate/src/client/reducers
badd +1 ~/cursus/codeGraph/class/ctags_parser.js
badd +1 ~/cursus
badd +1 ~/cursus/bittorent_cli/class/torrent.js
badd +6 ~/cursus/red_tetris_boilerplate/node_modules/debug/index.js
badd +1 ~/cursus/code_graphe/react/src/modules/socket.js
badd +1 ~/cursus/code_graphe/react/src/store/store.js
badd +1 ~/cursus/red_tetris_boilerplate/.nyc_output/65456.json
badd +50 ~/cursus/codeGraph/react/src/App.js
badd +1 ~/cursus/red_tetris_boilerplate/src/game/toolbox.js
badd +2 ~/cursus/red_tetris_boilerplate/node_modules/debug/src/index.js
badd +1 ~/cursus/red_tetris_boilerplate/node_modules/debug
badd +84 ~/cursus/red_tetris_boilerplate/node_modules/debug/README.md
badd +32 ~/cursus/code_graphe/index.js
badd +1 ~/.vim/vimrc
badd +2 ~/cursus/red_tetris_boilerplate/README_2.md
badd +6 ~/cursus/red_tetris_boilerplate/src/client/hooks/keyboard.js
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
