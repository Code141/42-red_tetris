import io from 'socket.io-client';

const Socket = (url) => store => {

  const socket = io(url);

  socket.on('connect', () => {
    console.log('CONNECTED');
    socket.send('hello')
    store.dispatch({
      type: 'SET_SOCKET_CONNECTED',
      payload: true,
    });
  });

  socket.on('connected', (data) => {
    console.log(data);
  });

  socket.on('disconnect', (reason) => {
    console.log('DISCONNECTED');
    console.log(reason);
  });

  socket.on('reconnect_attempt', (attemptNumber) => {
    console.log('RECONNECT ATTEMPT');
    console.log(attemptNumber);
  });

  socket.on('reconnect_error', (error) => {
    console.log('RECONNECT ERROR');
    console.log(error);
  });

  socket.on('action', (action) => {
    console.log('ACTION FROM SERVER =>');

    console.log(action);

    store.dispatch(action);
  });

  return next => action => {

    /*
    'ROOM_CREATED'
    'ROOM_JOINTED'
    'ROOM_LEAVED'
    'ROOM_LIST',
    'NEXT_TICK'
    */

    switch (action.type) {

    case 'CREATE_ROOM':
    case 'JOINT_ROOM':
    case 'LEAVE_ROOM':
    case 'GET_ROOM_LIST':
      socket.emit('action', action);
      return;
      break;
    default:
      return next(action);
    }
  }
}

export default Socket;
