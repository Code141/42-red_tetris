import React from 'react'
import { connect } from 'react-redux'

import default_rules from '../game/default_rules.json'

const Input = ({type, min, max, value, name, suffix}) => {
  return (
    <div>
      <label>
        {name} :
        <input
          type="number"
          min={min}
          max={max}
          value={value}
        />
        {suffix}
      </label>
      <hr/>
    </div>
  )
}

const CreateRoom = ({createRoom}) => {

  console.log(typeof default_rules);

  return (
    <div>
      CREATE ROOM
      <hr />

      {
        Object.keys(default_rules).map(key => {

          if (default_rules[key].type === "number") {

            return (<Input {...default_rules[key]} />)

          } else {

            return (<div>{key}</div>)

          }

        })
      }













      <Input type="number" min="100" max="1000" value="500" name="Tick" suffix="ms"/>
      <button onClick={ () => createRoom('PAYLOAD/game_opts?') } >
        CREATE ROOM
      </button>
      <br />

    </div>
  )
};

function createRoomAction(options) {
  return {
    type: 'CREATE_ROOM',
    payload: options,
  }
}

const mapDispatchToProps = (dispatch, payload) => ({
  createRoom: (options) => dispatch(createRoomAction(options))
})

export default connect(null, mapDispatchToProps)(CreateRoom);
