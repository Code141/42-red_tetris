import React from 'react'
import { connect } from 'react-redux'
import { setUserNameAction } from '../actions/user'

const Form = ({ message, setUserName, messageToServer }) => {
  return (
        <div>
            PLAYER SOCKET_ID

          <input
            type='text'
            placeholder='Player pseudo'
          />

          <button
            onClick={ () => { setUserName('TOTO') } }
          >
            change pseudo
          </button>

          <hr />

          <button
            onClick={ () => { messageToServer('PAYLOAD') } }
          >
            CREATE ROOM
          </button>

          <button>
            JOINT ROOM
          </button>

          <hr />

        </div>
  )
}

function sendSocketMessageAction(payload) {
  return {
    type: 'CREATE_ROOM',
    payload,
  }
}

const mapStateToProps = (state) => {
  return {
    game: state.game,
  }
}

const mapDispatchToProps = (dispatch, payload) => {
  return {
    setUserName: (username) => dispatch(setUserNameAction(username)),
    messageToServer: (message) => dispatch(sendSocketMessageAction(message)),
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Form);
