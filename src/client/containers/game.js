import React from 'react'
import { connect } from 'react-redux'
import Board from '../components/board'

const AdminPanel = () => (
  <div>
    ADMIN PANNEL
    <br />
    <button>
      startGame
    </button>
  </div>
)

const Game = ({ game, leaveRoom }) => {
  console.log(game);

  return (
    <div className='wrap'>
      gameID: {game.id}
      <br />
      admin: {game.admin}
      <hr />
      <AdminPanel />
      <hr />
      start in
      <br />
      tick: {game.tick}
      <br />
      { game.players.map((player) => (`${player.id}: ${player.pseudo}`)) }
      <button>
        LEAVE_ROOM
      </button>
      <Board
        board={game.board}
      />
    </div>
  )
}

function leaveRoomAction(roomId) {
  return {
    type: 'LEAVE_ROOM',
    payload: roomId,
  }
}

const mapStateToProps = (state) => ({
  game: state.game,
})

const mapDispatchToProps = (dispatch) => ({
  leaveRoom: (roomId) => dispatch(leaveRoomAction(roomId)),
})

export default connect(mapStateToProps, mapDispatchToProps)(Game);
