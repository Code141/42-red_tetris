'use strict';
import fs from 'fs'
import http from 'http'

import Koa from 'koa'
import Router from 'koa-router'

import io from 'socket.io'

import Game from './game/game.js'
import Player from './game/player.js'
import default_rules from './game/default_rules.json'

const socket_port = 3004;
const server_port = 3005;

const app = new Koa();
const router = new Router();

/* ------------------------------------------------------------------------*/
/* - TOOL COLOR CONSOLE ---------------------------------------------------*/
/* ------------------------------------------------------------------------*/

const termColors = {
  Reset:      '\x1b[0m',
  bright:     '\x1b[1m',
  dim:        '\x1b[2m',
  underscore: '\x1b[4m',
  blink:      '\x1b[5m',
  Reverse:    '\x1b[7m',
  Hidden:     '\x1b[8m',
  FgBlack:    '\x1b[30m',
  FgRed:      '\x1b[31m',
  FgGreen:    '\x1b[32m',
  FgYellow:   '\x1b[33m',
  FgBlue:     '\x1b[34m',
  FgMagenta:  '\x1b[35m',
  FgCyan:     '\x1b[36m',
  FgWhite:    '\x1b[37m',
  BgBlack:    '\x1b[40m',
  BgRed:      '\x1b[41m',
  BgGreen:    '\x1b[42m',
  BgYellow:   '\x1b[43m',
  BgBlue:     '\x1b[44m',
  BgMagenta:  '\x1b[45m',
  BgCyan:     '\x1b[46m',
  BgWhite:    '\x1b[47m',
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
      if (user.room && user.room.admin === user) {
        console.log("YOU CANNOT BE ADMIN OF TWO ROOM");
        return;
      }
      const room = new Game(default_rules, user, socketio)
      room.on('autodestruct', () => {
        console.log('WE ARE GOING TO AUTODESTRUCT');
        room.autodestruct();
        if (ROOMS.find(someroom => someroom === room)) {
          ROOMS.splice(ROOMS.indexOf(room), 1);
        };
      });

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
      if (!user.room) { return }
      if (user.room.admin === user) {
        user.room.startGame();
      }
      break;

    case 'GET_ROOM_LIST':
      user.socket.emit('action', { type: 'ROOM_LIST', payload: getRoomList() })
      console.log('Rooms ------------')
      let totalRooms = 0;
      let totalPlayers = 0;
      ROOMS.forEach((room) => {
        console.log(`ROOM ${room.id} | ${room.players.length} players | round ${room.round} | tick ${room.tick}`)
        totalPlayers = totalPlayers + room.players.length;
        totalRooms = totalRooms + 1;
      });
      console.log(`TOTAL - ${totalRooms} rooms -- ${totalPlayers} players`)
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

  socket.emit('connected', { type: 'CONNECTED', payload: {
    ...user.info()
  }
  });

  socket.on('action', (action) => {
    console.log(` ${colorise('ACTION', 'FgRed')} ${colorise(action.type, 'FgGreen')} ${colorise('FROM', 'FgRed')} ${user.id} ${user.username} `);
    reducer(user, action);
  })

  socket.on('disconnect', () => {
    console.log(`Socket disconnected: ${ socket.id}`)
    user.leaveRoom();
    // DISCONNECT FROM ALL ROOM
  });
})

