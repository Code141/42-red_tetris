import http from 'http'
import io from 'socket.io'
import fs from 'fs'

import Koa from 'koa'
import Router from 'koa-router'

import Game from '../game/game'
import Player from '../game/player'

const socket_port = 3004;
const server_port = 3005;

// import * as server from './index'

const app = new Koa();
const router = new Router();

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

const GAMES = [];
const USERS = [];

const opts = {
  gridx: 10,
  gridy: 20,
  tickDuration: 2000,
  heatRoomTime: 1000,
}

function getRoomList() {
  return GAMES.map((game) => ({
    id: game.id,
    players: game.players.map((player) => ({
      id: player.id,
      pseudo: player.pseudo,
    })),
  }))
}

const reducer = (socket, action) => {
  switch (action.type) {

  case 'CREATE_ROOM':
    const game = new Game(opts)
    GAMES.push(game);
    socket.emit('action', { type: 'ROOM_CREATED', payload: game.id })
    break;

  case 'JOINT_ROOM':
    socket.emit('action', { type: 'ROOM_JOINTED', payload: '' })
    break;

  case 'LEAVE_ROOM':
    socket.emit('action', { type: 'ROOM_LEAVED', payload: '' })
    break;

  case 'GET_ROOM_LIST':
    socket.emit('action', { type: 'ROOM_LIST', payload: getRoomList() })
    break;

  default:
    console.log('UNKNOW ACTION');
  }
}

const server = http.createServer();
server.listen(socket_port);
const socketio = io(server, { origins: '*:*' });

socketio.on('connection', (socket) => {
  console.log(`Socket connected: ${ socket.id}`)

  const user = new Player(socket, 'jean')
  USERS.push(user);
  socket.emit('connected', { idPlayer: socket.id })

  socket.on('action', (action) => {
    reducer(socket, action);
  })

  socket.on('disconnect', () => {
    console.log(`Socket disconnected: ${ socket.id}`)

    // DISCONNECT FROM ALL ROOM
    const i = USERS.indexOf(user);
    USERS.splice(i, 1);
  });
})

