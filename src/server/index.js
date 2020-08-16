import fs from 'fs'
import debug from 'debug'
import Game from '../game/game'
import Player from '../game/player'

const logerror = debug('tetris:error');
const loginfo = debug('tetris:info');

const initApp = (app, params, cb) => {
  const { host, port } = params
  const handler = (req, res) => {
    const file = req.url === '/bundle.js'
      ? '/../../build/bundle.js'
      : '/../../index.html'
    fs.readFile(__dirname + file, (err, data) => {
      if (err) {
        logerror(err)
        res.writeHead(500)
        return res.end('Error loading index.html')
      }
      res.writeHead(200)
      res.end(data)
    })
  }
  app.on('request', handler)
  app.listen({ host, port }, () => {
    loginfo(`tetris listen on ${params.url}`)
    cb()
  })
}

let GAMES = [];
var USERS = [];

const opts = {
  gridx: 10,
  gridy: 20,
  tickDuration: 2000,
  heatRoomTime: 1000,
}

function getRoomList() {
  return GAMES.map((game) => {
    return {
      id: game.id,
      players: game.players.map((player) => {
        return {
          id: player.id,
          pseudo: player.pseudo,
        }
      }),
    }
  })
}

const reducer = (socket, action) => {
  switch (action.type) {

  case 'CREATE_ROOM':
    let game = new Game(opts)
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

const initEngine = io => {
  io.on('connection', function(socket) {
    loginfo('Socket connected: ' + socket.id)

    let user = new Player(socket, 'jean')
    USERS.push(user);
    socket.emit('connected', { idPlayer: socket.id })

    socket.on('action', (action) => {
      reducer(socket, action);
    })

    socket.on('disconnect', function() {
      loginfo('Socket disconnected: ' + socket.id)

      // DISCONNECT FROM ALL ROOM
      var i = USERS.indexOf(user);
      USERS.splice(i, 1);
    });

  })
}

export function create(params) {
  const promise = new Promise((resolve, reject) => {
    const app = require('http').createServer()
    initApp(app, params, () => {
      const io = require('socket.io')(app)
      const stop = (cb) => {
        io.close()
        app.close(() => {
          app.unref()
        })
        loginfo('Engine stopped.')
        cb()
      }

      initEngine(io)
      resolve({ stop })
    })
  })
  return promise
}
