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
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 87 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 38 + 182) / 365)
exe '2resize ' . ((&lines * 87 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 285 + 182) / 365)
exe '3resize ' . ((&lines * 87 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 40 + 182) / 365)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 17 - ((15 * winheight(0) + 43) / 87)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/package.json") | buffer ~/cursus/red_tetris/src/client/package.json | else | edit ~/cursus/red_tetris/src/client/package.json | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 7 - ((6 * winheight(0) + 43) / 87)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
7
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/NetrwTreeListing") | buffer ~/cursus/red_tetris/NetrwTreeListing | else | edit ~/cursus/red_tetris/NetrwTreeListing | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 43) / 87)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
exe '1resize ' . ((&lines * 87 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 38 + 182) / 365)
exe '2resize ' . ((&lines * 87 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 285 + 182) / 365)
exe '3resize ' . ((&lines * 87 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 40 + 182) / 365)
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
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 87 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 30 + 182) / 365)
exe '2resize ' . ((&lines * 29 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 27 + 182) / 365)
exe '3resize ' . ((&lines * 27 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 27 + 182) / 365)
exe '4resize ' . ((&lines * 29 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 27 + 182) / 365)
exe '5resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 276 + 182) / 365)
exe '6resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 276 + 182) / 365)
exe '7resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 29 + 182) / 365)
exe '8resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 29 + 182) / 365)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 109 - ((20 * winheight(0) + 43) / 87)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
109
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/board.js") | buffer ~/cursus/red_tetris/src/server/game/board.js | else | edit ~/cursus/red_tetris/src/server/game/board.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 90 - ((23 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
90
normal! 05|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/game.js") | buffer ~/cursus/red_tetris/src/server/game/game.js | else | edit ~/cursus/red_tetris/src/server/game/game.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 107 - ((13 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
107
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/ruleParser.js") | buffer ~/cursus/red_tetris/src/server/game/ruleParser.js | else | edit ~/cursus/red_tetris/src/server/game/ruleParser.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 33 - ((17 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
33
normal! 011|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/piece.js") | buffer ~/cursus/red_tetris/src/server/game/piece.js | else | edit ~/cursus/red_tetris/src/server/game/piece.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 20 - ((18 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
20
normal! 016|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/player.js") | buffer ~/cursus/red_tetris/src/server/game/player.js | else | edit ~/cursus/red_tetris/src/server/game/player.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 78 - ((4 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
78
normal! 07|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/rules.js") | buffer ~/cursus/red_tetris/src/server/game/rules.js | else | edit ~/cursus/red_tetris/src/server/game/rules.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 24 - ((0 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
let s:c = 43 - ((12 * winwidth(0) + 14) / 29)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 43 . '|'
else
  normal! 043|
endif
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/default_rules.json") | buffer ~/cursus/red_tetris/src/server/game/default_rules.json | else | edit ~/cursus/red_tetris/src/server/game/default_rules.json | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 15 - ((7 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
15
normal! 011|
lcd ~/cursus/red_tetris
wincmd w
exe '1resize ' . ((&lines * 87 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 30 + 182) / 365)
exe '2resize ' . ((&lines * 29 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 27 + 182) / 365)
exe '3resize ' . ((&lines * 27 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 27 + 182) / 365)
exe '4resize ' . ((&lines * 29 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 27 + 182) / 365)
exe '5resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 276 + 182) / 365)
exe '6resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 276 + 182) / 365)
exe '7resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 29 + 182) / 365)
exe '8resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 29 + 182) / 365)
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
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 21 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 30 + 182) / 365)
exe '2resize ' . ((&lines * 21 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 30 + 182) / 365)
exe '3resize ' . ((&lines * 25 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 30 + 182) / 365)
exe '4resize ' . ((&lines * 21 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 30 + 182) / 365)
exe '5resize ' . ((&lines * 55 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 27 + 182) / 365)
exe '6resize ' . ((&lines * 6 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 27 + 182) / 365)
exe '7resize ' . ((&lines * 28 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 27 + 182) / 365)
exe '8resize ' . ((&lines * 47 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 276 + 182) / 365)
exe '9resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 9resize ' . ((&columns * 276 + 182) / 365)
exe '10resize ' . ((&lines * 47 + 47) / 95)
exe 'vert 10resize ' . ((&columns * 29 + 182) / 365)
exe '11resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 11resize ' . ((&columns * 29 + 182) / 365)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 5 - ((3 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/reducers/index.js") | buffer ~/cursus/red_tetris/src/client/src/reducers/index.js | else | edit ~/cursus/red_tetris/src/client/src/reducers/index.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 12 - ((8 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12
normal! 02|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/hooks/history.js") | buffer ~/cursus/red_tetris/src/client/src/hooks/history.js | else | edit ~/cursus/red_tetris/src/client/src/hooks/history.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/css/style.css") | buffer ~/cursus/red_tetris/src/client/src/css/style.css | else | edit ~/cursus/red_tetris/src/client/src/css/style.css | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/middleware/socket.js") | buffer ~/cursus/red_tetris/src/client/src/middleware/socket.js | else | edit ~/cursus/red_tetris/src/client/src/middleware/socket.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 2 - ((1 * winheight(0) + 27) / 55)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/actions/roomForm.js") | buffer ~/cursus/red_tetris/src/client/src/actions/roomForm.js | else | edit ~/cursus/red_tetris/src/client/src/actions/roomForm.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 2 - ((1 * winheight(0) + 3) / 6)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
let s:c = 38 - ((11 * winwidth(0) + 13) / 27)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 38 . '|'
else
  normal! 038|
endif
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/reducers/roomForm.js") | buffer ~/cursus/red_tetris/src/client/src/reducers/roomForm.js | else | edit ~/cursus/red_tetris/src/client/src/reducers/roomForm.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 2 - ((1 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 011|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/actions/game.js") | buffer ~/cursus/red_tetris/src/client/src/actions/game.js | else | edit ~/cursus/red_tetris/src/client/src/actions/game.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 19 - ((18 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
19
normal! 05|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/reducers/game.js") | buffer ~/cursus/red_tetris/src/client/src/reducers/game.js | else | edit ~/cursus/red_tetris/src/client/src/reducers/game.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 3 - ((2 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 02|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/reducers/user.js") | buffer ~/cursus/red_tetris/src/client/src/reducers/user.js | else | edit ~/cursus/red_tetris/src/client/src/reducers/user.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 2 - ((1 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/reducers/rooms.js") | buffer ~/cursus/red_tetris/src/client/src/reducers/rooms.js | else | edit ~/cursus/red_tetris/src/client/src/reducers/rooms.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
exe '1resize ' . ((&lines * 21 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 30 + 182) / 365)
exe '2resize ' . ((&lines * 21 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 30 + 182) / 365)
exe '3resize ' . ((&lines * 25 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 30 + 182) / 365)
exe '4resize ' . ((&lines * 21 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 30 + 182) / 365)
exe '5resize ' . ((&lines * 55 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 27 + 182) / 365)
exe '6resize ' . ((&lines * 6 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 27 + 182) / 365)
exe '7resize ' . ((&lines * 28 + 47) / 95)
exe 'vert 7resize ' . ((&columns * 27 + 182) / 365)
exe '8resize ' . ((&lines * 47 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 276 + 182) / 365)
exe '9resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 9resize ' . ((&columns * 276 + 182) / 365)
exe '10resize ' . ((&lines * 47 + 47) / 95)
exe 'vert 10resize ' . ((&columns * 29 + 182) / 365)
exe '11resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 11resize ' . ((&columns * 29 + 182) / 365)
tabnext
edit ~/cursus/red_tetris/src/client/src/containers/app.js
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
4wincmd h
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
exe '1resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 84 + 182) / 365)
exe '2resize ' . ((&lines * 47 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 84 + 182) / 365)
exe '3resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 84 + 182) / 365)
exe '4resize ' . ((&lines * 47 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 84 + 182) / 365)
exe '5resize ' . ((&lines * 10 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 84 + 182) / 365)
exe '6resize ' . ((&lines * 80 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 84 + 182) / 365)
exe 'vert 7resize ' . ((&columns * 25 + 182) / 365)
exe '8resize ' . ((&lines * 10 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 84 + 182) / 365)
exe '9resize ' . ((&lines * 80 + 47) / 95)
exe 'vert 9resize ' . ((&columns * 84 + 182) / 365)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 33 - ((19 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
33
normal! 015|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/hooks/keyboard.js") | buffer ~/cursus/red_tetris/src/client/src/hooks/keyboard.js | else | edit ~/cursus/red_tetris/src/client/src/hooks/keyboard.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 13 - ((12 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/containers/game.js") | buffer ~/cursus/red_tetris/src/client/src/containers/game.js | else | edit ~/cursus/red_tetris/src/client/src/containers/game.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 50 - ((35 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
50
normal! 05|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/components/board.js") | buffer ~/cursus/red_tetris/src/client/src/components/board.js | else | edit ~/cursus/red_tetris/src/client/src/components/board.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 9 - ((4 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 08|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/components/form.js") | buffer ~/cursus/red_tetris/src/client/src/components/form.js | else | edit ~/cursus/red_tetris/src/client/src/components/form.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 5) / 10)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/components/createRoom.js") | buffer ~/cursus/red_tetris/src/client/src/components/createRoom.js | else | edit ~/cursus/red_tetris/src/client/src/components/createRoom.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 94 - ((4 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
94
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/components/roomList.js") | buffer ~/cursus/red_tetris/src/client/src/components/roomList.js | else | edit ~/cursus/red_tetris/src/client/src/components/roomList.js | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 4 - ((3 * winheight(0) + 45) / 91)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 0
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/client/src/css/style.css") | buffer ~/cursus/red_tetris/src/client/src/css/style.css | else | edit ~/cursus/red_tetris/src/client/src/css/style.css | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 18 - ((4 * winheight(0) + 5) / 10)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 03|
lcd ~/cursus/red_tetris
wincmd w
argglobal
if bufexists("~/cursus/red_tetris/src/server/game/default_rules.json") | buffer ~/cursus/red_tetris/src/server/game/default_rules.json | else | edit ~/cursus/red_tetris/src/server/game/default_rules.json | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 128 - ((71 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
128
normal! 07|
lcd ~/cursus/red_tetris
wincmd w
6wincmd w
exe '1resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 1resize ' . ((&columns * 84 + 182) / 365)
exe '2resize ' . ((&lines * 47 + 47) / 95)
exe 'vert 2resize ' . ((&columns * 84 + 182) / 365)
exe '3resize ' . ((&lines * 43 + 47) / 95)
exe 'vert 3resize ' . ((&columns * 84 + 182) / 365)
exe '4resize ' . ((&lines * 47 + 47) / 95)
exe 'vert 4resize ' . ((&columns * 84 + 182) / 365)
exe '5resize ' . ((&lines * 10 + 47) / 95)
exe 'vert 5resize ' . ((&columns * 84 + 182) / 365)
exe '6resize ' . ((&lines * 80 + 47) / 95)
exe 'vert 6resize ' . ((&columns * 84 + 182) / 365)
exe 'vert 7resize ' . ((&columns * 25 + 182) / 365)
exe '8resize ' . ((&lines * 10 + 47) / 95)
exe 'vert 8resize ' . ((&columns * 84 + 182) / 365)
exe '9resize ' . ((&lines * 80 + 47) / 95)
exe 'vert 9resize ' . ((&columns * 84 + 182) / 365)
tabnext 4
badd +1 ~/cursus/red_tetris/src/server/package.json
badd +1 ~/cursus/red_tetris/src/server/index.mjs
badd +1 ~/cursus/red_tetris/src/client/src/index.js
badd +1 ~/cursus/red_tetris/src/client/src/containers/app.js
badd +7 ~/cursus/red_tetris/src/client/package.json
badd +1 ~/cursus/red_tetris/NetrwTreeListing
badd +1 ~/cursus/red_tetris/src/server/game/board.js
badd +1 ~/cursus/red_tetris/src/server/game/game.js
badd +1 ~/cursus/red_tetris/src/server/game/ruleParser.js
badd +1 ~/cursus/red_tetris/src/server/game/piece.js
badd +1 ~/cursus/red_tetris/src/server/game/player.js
badd +1 ~/cursus/red_tetris/src/server/game/rules.js
badd +1 ~/cursus/red_tetris/src/server/game/default_rules.json
badd +2 ~/cursus/red_tetris/src/client/src/reducers/index.js
badd +1 ~/cursus/red_tetris/src/client/src/hooks/history.js
badd +18 ~/cursus/red_tetris/src/client/src/css/style.css
badd +2 ~/cursus/red_tetris/src/client/src/middleware/socket.js
badd +1 ~/cursus/red_tetris/src/client/src/actions/roomForm.js
badd +3 ~/cursus/red_tetris/src/client/src/reducers/roomForm.js
badd +13 ~/cursus/red_tetris/src/client/src/actions/game.js
badd +1 ~/cursus/red_tetris/src/client/src/reducers/game.js
badd +1 ~/cursus/red_tetris/src/client/src/reducers/user.js
badd +1 ~/cursus/red_tetris/src/client/src/reducers/rooms.js
badd +1 ~/cursus/red_tetris/src/client/src/hooks/keyboard.js
badd +1 ~/cursus/red_tetris/src/client/src/containers/game.js
badd +1 ~/cursus/red_tetris/src/client/src/components/board.js
badd +1 ~/cursus/red_tetris/src/client/src/components/form.js
badd +1 ~/cursus/red_tetris/src/client/src/components/createRoom.js
badd +1 ~/cursus/red_tetris/src/client/src/components/roomList.js
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
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
