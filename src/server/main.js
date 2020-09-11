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
const USERS = [];

function getRoomInfo(room) {
  return {
    id: room.id,
    admin: room.admin.id,
    players: room.players.map((player) => ({
      id: player.id,
      pseudo: player.pseudo,
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
      tickDuration: 2000,
      heatRoomTime: 10000,
      maxPlayer: 2,
      allowSpectator: true,
    }
    const room = new Game(defaults_opts, user)
    ROOMS.push(room);

    // room.addPlayer(user)
    user.socket.emit('action', { type: 'ROOM_CREATED', payload: getRoomInfo(room) });
    user.socket.broadcast.emit('action', { type: 'ROOM_CREATED', payload: getRoomInfo(room) });

    // OBSOLETE ACTION PAYLOAD
    // user.socket.emit('action', { type: 'ROOM_JOINTED', payload: room.id })
    console.log(`room_created: ${room.id}`);
    break;

  case 'JOINT_ROOM':

    console.log('JOINT_ROOM', action);
    const room_to_join = ROOMS.find(room => room.id === action.payload);
    if (!room_to_join) { user.socket.emit('action', { type: 'ERROR', payload: 'room_doesn\'t existe' }) }

    // THIS USER TRY TO JOIN ROOM
    // CHECK ABILITY TO JOIN ROOM

    if (room_to_join.addPlayer(user)) {
      user.socket.emit('action', { type: 'ROOM_JOINTED', payload: {
        id: room_to_join.id,
        admin: room_to_join.admin.id,
        players: room_to_join.players.map((player) => ({
          id: player.id,
          pseudo: player.pseudo,
        })),
        spectators: room_to_join.spectators.map((spectator) => ({
          id: spectator.id,
          pseudo: spectator.pseudo,
        })),
      },
      })
      user.socket.broadcast.emit('action', { type: 'ROOM_LIST', payload: getRoomList() })
    }
    break;

  case 'LEAVE_ROOM':
    user.socket.emit('action', { type: 'ROOM_LEAVED', payload: '' })
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
  console.log(`Socket connected: ${ socket.id}`)

  const user = new Player(socket, 'jean')
  USERS.push(user);

  socket.emit('connected', { idPlayer: socket.id })

  socket.on('action', (action) => {
    reducer(user, action);
  })

  socket.on('disconnect', () => {
    console.log(`Socket disconnected: ${ socket.id}`)

    // DISCONNECT FROM ALL ROOM
    const i = USERS.indexOf(user);
    USERS.splice(i, 1);
  });
})

