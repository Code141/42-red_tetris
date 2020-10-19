import React from 'react'
import { connect } from 'react-redux'
import { setUserNameAction } from '../actions/user'

const Form = ({ message, setUserName }) => (
  <div>
    PLAYER SOCKET_ID
    <input
      placeholder='Player username'
      type='text'
    />

    <button
      onClick={ () => { setUserName('TOTO') } }
    >
      change username
    </button>

    <hr />

    <hr />

  </div>
)

const mapDispatchToProps = (dispatch, payload) => ({
  setUserName: (username) => dispatch(setUserNameAction(username)),
})

export default connect(null, mapDispatchToProps)(Form);
