import React from 'react'
import { connect } from 'react-redux'
import { setUserNameAction } from '../actions/user'

const Form = ({ message, setUserName }) => (
  <div>
            PLAYER SOCKET_ID

    <input
      placeholder='Player pseudo'
      type='text'
    />

    <button
      onClick={ () => { setUserName('TOTO') } }
    >
            change pseudo
    </button>

    <hr />

    <hr />

  </div>
)

const mapStateToProps = (state) => ({
  game: state.game,
})

const mapDispatchToProps = (dispatch, payload) => ({
  setUserName: (username) => dispatch(setUserNameAction(username)),
})

export default connect(mapStateToProps, mapDispatchToProps)(Form);
