import React from 'react'
import { Link } from 'react-router-dom';
import { connect } from 'react-redux'
import useKeyboardEvent from '../hooks/keyboard'
import Board from '../components/board'

const AdminPanel = ({ startGame }) => (
  <div>
    ADMIN PANNEL
    <br />
    <button onClick={() => startGame('PAYLOAD/roomId?')}>
      startGame
    </button>
  </div>
)

const Game = ({ user, game, leaveRoom, startGame, move }) => {

  useKeyboardEvent('ArrowLeft', () => { move('STRAFE_LEFT') });
  useKeyboardEvent('ArrowRight', () => { move('STRAFE_RIGHT') });

  let boards = '';

  if (game.gameHasStarted) {
    boards = game.players.map((player, index) => (
      <Board
        game={game}
        key={index}
        player={player}
      />
    ));
  }

  return (
    <div className='wrap'>
      <Link to='/' onClick={ () => leaveRoom('PAYLOAD/roomId?') }>
        LEAVE GAME !
      </Link>

      gameID: {game.id}
      <br />
      admin: {game.admin}
      <hr />
      { user.id === game.admin &&
        <AdminPanel startGame={startGame} />
      }

      <hr />
      gameHasStarted: {(game.gameHasStarted) ? 'TRUE' : 'FALSE'}
      <hr />
      start in
      <br />
      tick: {game.tick}
      <br />
      PLAYERS :
      <br />
      { game.players.map((player) => (`${player.id}: ${player.username}`)) }
      <br />
      SPECTATORS :
      <br />
      { game.spectators.map((spectator) => (`${spectator.id}: ${spectator.username}`)) }
      <hr />

      { boards }

    </div>
  )
}

function leaveRoomAction(roomId) {
  return {
    type: 'LEAVE_ROOM',
    payload: roomId,
  }
}

function startGameAction(roomId) {
  return {
    type: 'START_GAME',
    payload: roomId,
  }
}

function moveAction(move) {
  return {
    type: 'MOVE',
    payload: move,
  }
}

const mapStateToProps = (state) => ({
  game: state.game,
  user: state.user
})

const mapDispatchToProps = (dispatch) => ({
  leaveRoom: (roomId) => dispatch(leaveRoomAction(roomId)),
  startGame: (roomId) => dispatch(startGameAction(roomId)),
  move: (move) => dispatch(moveAction(move)),
})

export default connect(mapStateToProps, mapDispatchToProps)(Game);
