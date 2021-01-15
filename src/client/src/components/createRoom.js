import React from 'react'
import { connect } from 'react-redux'


const NumberInput = ({ min, max, value, name, suffix, cb }) => {
  return (
    <div>
      <label>
        {name} :
        <input type="number"
          min={min}
          max={max}
          value={value}
          onChange={ (e)=>{ cb(e.target.value) } }
        />
        {suffix}
      </label>
      <hr/>
    </div>
  )
}

const BoolInput = ({ value, name, cb }) => {
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
          onChange={ (e)=>{ cb(e.target.value) } }
        />
      </label>
      <hr/>
    </div>
  )
}

const CreateRoom = ({ roomForm, createRoom, setRoomOptions }) => {

  const printForm = Object.keys(roomForm).map(key => {
    let cb = (value) => { setRoomOptions({key:key, value:value}); }
    if (roomForm[key].type === "number") {
      return (<NumberInput {...roomForm[key]} cb={cb} />)
    } else if (roomForm[key].type === "bool") {
      return (<BoolInput {...roomForm[key]} cb={cb}/>)
    } else {
      return (<div>{key}</div>)
    }
  });

  return (
    <div>
      CREATE ROOM
      <hr />
      { printForm }
      <button onClick={ () => {
        let roomFormCleaned = {};
        Object.keys(roomForm).forEach(key => 
          roomFormCleaned[key] = (roomForm[key].hasOwnProperty("value"))
            ? roomForm[key].value
            : roomForm[key].values
        );
        createRoom(roomFormCleaned);
      }
        } >
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

function setRoomOptions(options) {
  return {
    type: 'SET_FORM',
    payload: {
      key: options.key,
      value: options.value
    },
  }
}

const mapStateToProps = (state) => ({
  roomForm: state.roomForm
})

const mapDispatchToProps = (dispatch, payload) => ({
  createRoom: (options) => dispatch(createRoomAction(options)),
  setRoomOptions: (options) => dispatch(setRoomOptions(options))
})

export default connect(mapStateToProps, mapDispatchToProps)(CreateRoom);
