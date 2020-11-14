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
exe 'vert 1resize ' . ((&columns * 115 + 179) / 359)
exe '2resize ' . ((&lines * 27 + 45) / 91)
exe 'vert 2resize ' . ((&columns * 122 + 179) / 359)
exe '3resize ' . ((&lines * 24 + 45) / 91)
exe 'vert 3resize ' . ((&columns * 122 + 179) / 359)
exe '4resize ' . ((&lines * 38 + 45) / 91)
exe 'vert 4resize ' . ((&columns * 122 + 179) / 359)
exe '5resize ' . ((&lines * 39 + 45) / 91)
exe 'vert 5resize ' . ((&columns * 126 + 179) / 359)
exe '6resize ' . ((&lines * 51 + 45) / 91)
exe 'vert 6resize ' . ((&columns * 126 + 179) / 359)
argglobal
let s:l = 1 - ((0 * winheight(0) + 45) / 91)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/webpack.config.js") | buffer ~/cursus/red_tetris_boilerplate/webpack.config.js | else | edit ~/cursus/red_tetris_boilerplate/webpack.config.js | endif
let s:l = 18 - ((14 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 02|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/.babelrc") | buffer ~/cursus/red_tetris_boilerplate/.babelrc | else | edit ~/cursus/red_tetris_boilerplate/.babelrc | endif
let s:l = 10 - ((7 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/.editorconfig") | buffer ~/cursus/red_tetris_boilerplate/.editorconfig | else | edit ~/cursus/red_tetris_boilerplate/.editorconfig | endif
let s:l = 10 - ((9 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10
normal! 031|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/README.md") | buffer ~/cursus/red_tetris_boilerplate/README.md | else | edit ~/cursus/red_tetris_boilerplate/README.md | endif
let s:l = 1 - ((0 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/.eslintrc") | buffer ~/cursus/red_tetris_boilerplate/.eslintrc | else | edit ~/cursus/red_tetris_boilerplate/.eslintrc | endif
let s:l = 276 - ((41 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
276
normal! 032|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
exe 'vert 1resize ' . ((&columns * 115 + 179) / 359)
exe '2resize ' . ((&lines * 27 + 45) / 91)
exe 'vert 2resize ' . ((&columns * 122 + 179) / 359)
exe '3resize ' . ((&lines * 24 + 45) / 91)
exe 'vert 3resize ' . ((&columns * 122 + 179) / 359)
exe '4resize ' . ((&lines * 38 + 45) / 91)
exe 'vert 4resize ' . ((&columns * 122 + 179) / 359)
exe '5resize ' . ((&lines * 39 + 45) / 91)
exe 'vert 5resize ' . ((&columns * 126 + 179) / 359)
exe '6resize ' . ((&lines * 51 + 45) / 91)
exe 'vert 6resize ' . ((&columns * 126 + 179) / 359)
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
exe '1resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 1resize ' . ((&columns * 91 + 179) / 359)
exe '2resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 2resize ' . ((&columns * 91 + 179) / 359)
exe '3resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 3resize ' . ((&columns * 91 + 179) / 359)
exe '4resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 4resize ' . ((&columns * 91 + 179) / 359)
exe '5resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 5resize ' . ((&columns * 84 + 179) / 359)
exe '6resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 6resize ' . ((&columns * 84 + 179) / 359)
exe '7resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 7resize ' . ((&columns * 90 + 179) / 359)
exe '8resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 8resize ' . ((&columns * 90 + 179) / 359)
argglobal
let s:l = 119 - ((21 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
119
normal! 021|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/server/index.js") | buffer ~/cursus/red_tetris_boilerplate/src/server/index.js | else | edit ~/cursus/red_tetris_boilerplate/src/server/index.js | endif
let s:l = 22 - ((20 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
22
normal! 036|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/game/board.js") | buffer ~/cursus/red_tetris_boilerplate/src/game/board.js | else | edit ~/cursus/red_tetris_boilerplate/src/game/board.js | endif
let s:l = 40 - ((35 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
40
normal! 014|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/server/game.js") | buffer ~/cursus/red_tetris_boilerplate/src/server/game.js | else | edit ~/cursus/red_tetris_boilerplate/src/server/game.js | endif
let s:l = 148 - ((30 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
148
normal! 040|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/game/piece.js") | buffer ~/cursus/red_tetris_boilerplate/src/game/piece.js | else | edit ~/cursus/red_tetris_boilerplate/src/game/piece.js | endif
let s:l = 28 - ((27 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
28
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/server/player.js") | buffer ~/cursus/red_tetris_boilerplate/src/server/player.js | else | edit ~/cursus/red_tetris_boilerplate/src/server/player.js | endif
let s:l = 39 - ((28 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
39
let s:c = 20 - ((5 * winwidth(0) + 42) / 84)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 20 . '|'
else
  normal! 020|
endif
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/game/rules.js") | buffer ~/cursus/red_tetris_boilerplate/src/game/rules.js | else | edit ~/cursus/red_tetris_boilerplate/src/game/rules.js | endif
let s:l = 16 - ((14 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 03|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/game/default_rules.json") | buffer ~/cursus/red_tetris_boilerplate/src/game/default_rules.json | else | edit ~/cursus/red_tetris_boilerplate/src/game/default_rules.json | endif
let s:l = 14 - ((12 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
14
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
6wincmd w
exe '1resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 1resize ' . ((&columns * 91 + 179) / 359)
exe '2resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 2resize ' . ((&columns * 91 + 179) / 359)
exe '3resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 3resize ' . ((&columns * 91 + 179) / 359)
exe '4resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 4resize ' . ((&columns * 91 + 179) / 359)
exe '5resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 5resize ' . ((&columns * 84 + 179) / 359)
exe '6resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 6resize ' . ((&columns * 84 + 179) / 359)
exe '7resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 7resize ' . ((&columns * 90 + 179) / 359)
exe '8resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 8resize ' . ((&columns * 90 + 179) / 359)
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
exe '1resize ' . ((&lines * 27 + 45) / 91)
exe 'vert 1resize ' . ((&columns * 84 + 179) / 359)
exe '2resize ' . ((&lines * 24 + 45) / 91)
exe 'vert 2resize ' . ((&columns * 84 + 179) / 359)
exe '3resize ' . ((&lines * 38 + 45) / 91)
exe 'vert 3resize ' . ((&columns * 84 + 179) / 359)
exe '4resize ' . ((&lines * 30 + 45) / 91)
exe 'vert 4resize ' . ((&columns * 86 + 179) / 359)
exe '5resize ' . ((&lines * 60 + 45) / 91)
exe 'vert 5resize ' . ((&columns * 86 + 179) / 359)
exe '6resize ' . ((&lines * 19 + 45) / 91)
exe 'vert 6resize ' . ((&columns * 93 + 179) / 359)
exe '7resize ' . ((&lines * 19 + 45) / 91)
exe 'vert 7resize ' . ((&columns * 93 + 179) / 359)
exe '8resize ' . ((&lines * 20 + 45) / 91)
exe 'vert 8resize ' . ((&columns * 93 + 179) / 359)
exe '9resize ' . ((&lines * 30 + 45) / 91)
exe 'vert 9resize ' . ((&columns * 93 + 179) / 359)
exe 'vert 10resize ' . ((&columns * 99 + 179) / 359)
argglobal
let s:l = 1 - ((0 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/reducers/index.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/reducers/index.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/reducers/index.js | endif
let s:l = 4 - ((3 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 026|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/index.html") | buffer ~/cursus/red_tetris_boilerplate/index.html | else | edit ~/cursus/red_tetris_boilerplate/index.html | endif
let s:l = 1 - ((0 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 012|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/index.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/index.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/index.js | endif
let s:l = 1 - ((0 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/containers/app.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/containers/app.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/containers/app.js | endif
let s:l = 24 - ((23 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 013|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/actions/user.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/actions/user.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/actions/user.js | endif
let s:l = 9 - ((8 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/reducers/user.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/reducers/user.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/reducers/user.js | endif
let s:l = 17 - ((14 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 010|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/actions/rooms.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/actions/rooms.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/actions/rooms.js | endif
let s:l = 7 - ((6 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
7
normal! 018|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/reducers/rooms.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/reducers/rooms.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/reducers/rooms.js | endif
let s:l = 1 - ((0 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 016|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/middleware/socket.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/middleware/socket.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/middleware/socket.js | endif
let s:l = 44 - ((43 * winheight(0) + 45) / 91)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
44
normal! 03|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
exe '1resize ' . ((&lines * 27 + 45) / 91)
exe 'vert 1resize ' . ((&columns * 84 + 179) / 359)
exe '2resize ' . ((&lines * 24 + 45) / 91)
exe 'vert 2resize ' . ((&columns * 84 + 179) / 359)
exe '3resize ' . ((&lines * 38 + 45) / 91)
exe 'vert 3resize ' . ((&columns * 84 + 179) / 359)
exe '4resize ' . ((&lines * 30 + 45) / 91)
exe 'vert 4resize ' . ((&columns * 86 + 179) / 359)
exe '5resize ' . ((&lines * 60 + 45) / 91)
exe 'vert 5resize ' . ((&columns * 86 + 179) / 359)
exe '6resize ' . ((&lines * 19 + 45) / 91)
exe 'vert 6resize ' . ((&columns * 93 + 179) / 359)
exe '7resize ' . ((&lines * 19 + 45) / 91)
exe 'vert 7resize ' . ((&columns * 93 + 179) / 359)
exe '8resize ' . ((&lines * 20 + 45) / 91)
exe 'vert 8resize ' . ((&columns * 93 + 179) / 359)
exe '9resize ' . ((&lines * 30 + 45) / 91)
exe 'vert 9resize ' . ((&columns * 93 + 179) / 359)
exe 'vert 10resize ' . ((&columns * 99 + 179) / 359)
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
exe '1resize ' . ((&lines * 1 + 45) / 91)
exe 'vert 1resize ' . ((&columns * 89 + 179) / 359)
exe '2resize ' . ((&lines * 1 + 45) / 91)
exe 'vert 2resize ' . ((&columns * 89 + 179) / 359)
exe 'vert 3resize ' . ((&columns * 89 + 179) / 359)
exe '4resize ' . ((&lines * 12 + 45) / 91)
exe 'vert 4resize ' . ((&columns * 84 + 179) / 359)
exe '5resize ' . ((&lines * 78 + 45) / 91)
exe 'vert 5resize ' . ((&columns * 84 + 179) / 359)
exe '6resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 6resize ' . ((&columns * 91 + 179) / 359)
exe '7resize ' . ((&lines * 47 + 45) / 91)
exe 'vert 7resize ' . ((&columns * 91 + 179) / 359)
exe '8resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 8resize ' . ((&columns * 98 + 179) / 359)
exe '9resize ' . ((&lines * 47 + 45) / 91)
exe 'vert 9resize ' . ((&columns * 98 + 179) / 359)
argglobal
let s:l = 9 - ((0 * winheight(0) + 0) / 1)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 041|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/reducers/game.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/reducers/game.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/reducers/game.js | endif
let s:l = 14 - ((0 * winheight(0) + 0) / 1)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
14
normal! 012|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/reducers/game.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/reducers/game.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/reducers/game.js | endif
let s:l = 96 - ((60 * winheight(0) + 43) / 87)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
96
normal! 014|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/containers/game.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/containers/game.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/containers/game.js | endif
let s:l = 48 - ((6 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
48
let s:c = 12 - ((4 * winwidth(0) + 42) / 84)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 12 . '|'
else
  normal! 012|
endif
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/components/board.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/components/board.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/components/board.js | endif
let s:l = 35 - ((34 * winheight(0) + 39) / 78)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
35
normal! 011|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/components/form.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/components/form.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/components/form.js | endif
let s:l = 16 - ((14 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 021|
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/src/client/components/roomList.js") | buffer ~/cursus/red_tetris_boilerplate/src/client/components/roomList.js | else | edit ~/cursus/red_tetris_boilerplate/src/client/components/roomList.js | endif
let s:l = 1 - ((0 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/style.css") | buffer ~/cursus/red_tetris_boilerplate/style.css | else | edit ~/cursus/red_tetris_boilerplate/style.css | endif
let s:l = 4 - ((3 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
argglobal
if bufexists("~/cursus/red_tetris_boilerplate/reset.css") | buffer ~/cursus/red_tetris_boilerplate/reset.css | else | edit ~/cursus/red_tetris_boilerplate/reset.css | endif
let s:l = 2 - ((1 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~/cursus/red_tetris_boilerplate
wincmd w
exe '1resize ' . ((&lines * 1 + 45) / 91)
exe 'vert 1resize ' . ((&columns * 89 + 179) / 359)
exe '2resize ' . ((&lines * 1 + 45) / 91)
exe 'vert 2resize ' . ((&columns * 89 + 179) / 359)
exe 'vert 3resize ' . ((&columns * 89 + 179) / 359)
exe '4resize ' . ((&lines * 12 + 45) / 91)
exe 'vert 4resize ' . ((&columns * 84 + 179) / 359)
exe '5resize ' . ((&lines * 78 + 45) / 91)
exe 'vert 5resize ' . ((&columns * 84 + 179) / 359)
exe '6resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 6resize ' . ((&columns * 91 + 179) / 359)
exe '7resize ' . ((&lines * 47 + 45) / 91)
exe 'vert 7resize ' . ((&columns * 91 + 179) / 359)
exe '8resize ' . ((&lines * 43 + 45) / 91)
exe 'vert 8resize ' . ((&columns * 98 + 179) / 359)
exe '9resize ' . ((&lines * 47 + 45) / 91)
exe 'vert 9resize ' . ((&columns * 98 + 179) / 359)
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
badd +1 ~/cursus/red_tetris_boilerplate/src/server/game.js
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
badd +0 ~/cursus/red_tetris_boilerplate/src/client/middleware/socket.js
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
