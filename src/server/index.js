import fs from 'fs'
import Game from '../game/game'
import Player from '../game/player'

const initApp = (app, params, cb) => {
  const { host, port } = params
  const handler = (req, res) => {
    const file = req.url === '/bundle.js' ?
      '/../../build/bundle.js' :
      '/../../index.html'
    fs.readFile(__dirname + file, (err, data) => {
      if (err) {
        console.log(err)
        res.writeHead(500)
        return res.end('Error loading index.html')
      }
      res.writeHead(200)
      res.end(data)
    })
  }
  app.on('request', handler)
  app.listen({ host, port }, () => {
    console.log(`tetris listen on ${params.url}`)
    cb()
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
        console.log('Engine stopped.')
        cb()
      }

      //    initEngine(io)
      resolve({ stop })
    })
  })
  return promise
}
