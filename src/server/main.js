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
const GAMES = [];
const USERS = [];

function getRoomList() {
  return GAMES.map((game) => ({
    id: game.id,
    players: game.players.map((player) => ({
      id: player.id,
      pseudo: player.pseudo,
    })),
  }))
}

const reducer = (socket, action) => { // RENAME INTO ROUTER !! ??
  switch (action.type) {

  case 'CREATE_ROOM':
    // check users right to creating room
    const defaults_opts = {
      gridx: 10,
      gridy: 20,
      tickDuration: 2000,
      heatRoomTime: 1000,
    }
    const game = new Game(defaults_opts)
    GAMES.push(game);

    // game.addPlayer(user)
    socket.emit('action', {
      type: 'ROOM_CREATED',
      payload:
      {
        id: game.id,
        players: game.players.map((player) => ({
          id: player.id,
          pseudo: player.pseudo,
        })),
      },

    })
    socket.broadcast.emit(
      'action', {
        type: 'ROOM_CREATED',
        payload:
        {
          id: game.id,
          players: game.players.map((player) => ({
            id: player.id,
            pseudo: player.pseudo,
          })),
        },
      }
    );
    console.log(`room_created: ${game.id}`);
    break;

  case 'JOINT_ROOM':
    console.log('JOINT_ROOM', action);

    // THIS USER TRY TO JOIN ROOM
    socket.emit('action', { type: 'ROOM_JOINTED', payload: '' })
    break;

  case 'LEAVE_ROOM':
    socket.emit('action', { type: 'ROOM_LEAVED', payload: '' })
    break;

  case 'GET_ROOM_LIST':
    socket.emit('action', { type: 'ROOM_LIST', payload: getRoomList() })

    console.log(getRoomList());
    console.log('GET_ROOM_LIST');
    break;

  default:
    console.log('UNKNOW ACTION');
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
    reducer(socket, action);
  })

  socket.on('disconnect', () => {
    console.log(`Socket disconnected: ${ socket.id}`)

    // DISCONNECT FROM ALL ROOM
    const i = USERS.indexOf(user);
    USERS.splice(i, 1);
  });
})

