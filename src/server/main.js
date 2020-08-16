import params from '../../params'
import * as server from './index'

const Koa = require('koa');
const app = new Koa();

app.use(async ctx => {
  ctx.body = 'Hello World';
});

app.listen(3000);

server
  .create(params.server)
  .then(() =>
    console.log('not yet ready to play tetris with U ...')
  )
