import React from 'react'
import { connect } from 'react-redux'

import default_rules from '../game/default_rules.json'

const NumberInput = ({ min, max, value, name, suffix}) => {
  return (
    <div>
      <label>
        {name} :
        <input type="number"
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

const BoolInput = ({ value, name }) => {
  return (
    <div>
      <label>
        {name} :
        <input type="checkbox"
          value={value}
          checked={
            ((value !== "false" || value !== false)
              && (value === "true" || value === true))
            ? 'checked'
            : ''
          }
        />
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

            return (<NumberInput {...default_rules[key]} />)

          } else if (default_rules[key].type === "bool") {

            return (<BoolInput {...default_rules[key]} />)

          } else {

            return (<div>{key}</div>)

          }

        })

      }






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
