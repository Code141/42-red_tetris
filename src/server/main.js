import http from 'http'
import io from 'socket.io'
import fs from 'fs'

import Koa from 'koa'
import Router from 'koa-router'

import Game from './game'
import Player from './player'

const socket_port = 3004;
const server_port = 3005;

const app = new Koa();
const router = new Router();

/* ------------------------------------------------------------------------*/
/* - TOOL COLOR CONSOLE ---------------------------------------------------*/
/* ------------------------------------------------------------------------*/

const termColors = {
  Reset: '\x1b[0m',
  bright: '\x1b[1m',
  dim: '\x1b[2m',
  underscore: '\x1b[4m',
  blink: '\x1b[5m',
  Reverse: '\x1b[7m',
  Hidden: '\x1b[8m',
  FgBlack: '\x1b[30m',
  FgRed: '\x1b[31m',
  FgGreen: '\x1b[32m',
  FgYellow: '\x1b[33m',
  FgBlue: '\x1b[34m',
  FgMagenta: '\x1b[35m',
  FgCyan: '\x1b[36m',
  FgWhite: '\x1b[37m',
  BgBlack: '\x1b[40m',
  BgRed: '\x1b[41m',
  BgGreen: '\x1b[42m',
  BgYellow: '\x1b[43m',
  BgBlue: '\x1b[44m',
  BgMagenta: '\x1b[45m',
  BgCyan: '\x1b[46m',
  BgWhite: '\x1b[47m',
}

function colorise(str, color) {
  return `${termColors[color]}${str}${termColors.Reset}`;
}

/* ------------------------------------------------------------------------*/
/* - HTTP SERVER ----------------------------------------------------------*/
/* ------------------------------------------------------------------------*/

router.get('/', (ctx, next) => {
  fs.readFile('./index.html', null, (error, data) => {
    console.log(error)
    console.log(__dirname);

    if (error) {
      ctx.response.status = 404;
      ctx.body = 'Whoops! File not found!';
    }
    else {
      console.log(data);
      ctx.body = data;
    }
    next();
  });
});

router.get('/room/:id', (ctx, next) => {
  const roomId = ctx.params.id;
  console.log(roomId);
});

app
  .use(router.routes())
  .use(router.allowedMethods())
  .listen(server_port);

/*
const file = req.url === '/bundle.js' ?
'/../../build/bundle.js' :
'/../../index.html'
*/

/* ------------------------------------------------------------------------*/
/* - SOCKET ---------------------------------------------------------------*/
/* ------------------------------------------------------------------------*/

/* - SOCKET ROUTER --------------------------------------------------------*/

const ROOMS = [];

function getRoomInfo(room) {
  return {
    id: room.id,
    admin: room.admin.id,
    players: room.players.map((player) => ({
      id: player.id,
      username: player.username,
    })),
  }
}

function getRoomList() {
  return ROOMS.map((room) => getRoomInfo(room));
}

const reducer = (user, action) => { // RENAME INTO ROUTER !! ??
  switch (action.type) {

  case 'CREATE_ROOM':
    // check users right to creating room
    const defaults_opts = {
      gridx: 10,
      gridy: 20,
      tickDuration: 100,
      heatRoomTime: 1000,
      maxPlayer: 2,
      allowSpectator: true,
    }

    const room = new Game(defaults_opts, user)
    ROOMS.push(room);

    // room.addPlayer(user)
    user.socket.emit('action', { type: 'ROOM_CREATED', payload: getRoomInfo(room) });
    user.socket.broadcast.emit('action', { type: 'ROOM_CREATED', payload: getRoomInfo(room) });

    // OBSOLETE ACTION'S PAYLOAD
    // user.socket.emit('action', { type: 'ROOM_JOINTED', payload: room.id })
    console.log(`room_created: ${room.id}`);
    break;

  case 'JOINT_ROOM':

    console.log('JOINT_ROOM', action);
    const room_to_join = ROOMS.find(room => room.id === action.payload);
    if (!room_to_join) {
      user.socket.emit('action', { type: 'ERROR', payload: 'room_doesn\'t existe' })
      return;
    }

    // THIS USER TRY TO JOIN ROOM
    // CHECK ABILITY TO JOIN ROOM

    if (room_to_join.addPlayer(user)) {

      user.socket.broadcast.emit('action', { type: 'ROOM_LIST', payload: getRoomList() })
    }
    break;

  case 'LEAVE_ROOM':
    user.leaveRoom();

    user.socket.emit('action', { type: 'ROOM_LEAVED', payload: '' })
    break;

  case 'START_GAME':
    if (user.room.admin !== user) { return; } // FAIL MUST CHECK BETTER
    user.room.startGame();
    break;

  case 'GET_ROOM_LIST':
    user.socket.emit('action', { type: 'ROOM_LIST', payload: getRoomList() })
    console.log(getRoomList());
    console.log('GET_ROOM_LIST');
    break;

  default:
    console.log('WARNING UNKNOW ACTION');
  }
}

/* - SOCKET CREATE --------------------------------------------------------*/
const server = http.createServer();
server.listen(socket_port);
const socketio = io(server, { origins: '*:*' });

socketio.on('connection', (socket) => {
  console.log(`Socket connected: ${socket.id}`)

  const user = new Player(socket, 'jean')

  socket.emit('connected', { idPlayer: socket.id })

  socket.on('action', (action) => {
    console.log(` ${colorise('ACTION', 'FgRed')} ${colorise(action.type, 'FgGreen')} ${colorise('FROM', 'FgRed')} ${user.id} ${user.username} `);
    reducer(user, action);
  })

  socket.on('disconnect', () => {
    console.log(`Socket disconnected: ${ socket.id}`)

    // DISCONNECT FROM ALL ROOM
  });
})

