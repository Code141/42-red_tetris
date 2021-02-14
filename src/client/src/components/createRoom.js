import React from 'react'
import { connect } from 'react-redux'


const NumberInput = ({ min, max, value, suffix, cb }) => {
  return (
    <input type="number"
      min={min}
      max={max}
      value={value}
      onChange={ (e)=>{ cb(e.target.value) } }
    />
  )
}

const BoolInput = ({ value, cb }) => {
  return (
    <input type="checkbox"
      value={value}
      checked={
        ((value !== "false" || value !== false)
          && (value === "true" || value === true))
            ? 'checked'
            : ''
      }
      onChange={ (e)=>{ cb( e.target.checked ) } }
    />
  )
}

const RadioInput = ({ value, values, cb }) => {
  return values.map((element, index) => {
    return (
      <div>
        <input
          type="radio"
          id={element}
          value={element}
          onChange={ () => { cb( element ) } }
          checked={(value === element ? true : false )}
        />
        <label for={element} >
          { element }
        </label>
      </div>
    );
  });
}

const Line = ({ cells, y, color }) => (
  <ul className='line'>
    {
      cells.map((cell, x) => (
        <li
          className={`cell ${cell ? 'block' : ''}`}
          style={(cell) ? {backgroundColor: color} : {}}
          key={x}>
        </li>
      ))
    }
  </ul>
)

const Preview = ({ piece, size, color }) => {
  let nextP = [];
  for (let y = 0; y < size; y++) {
    nextP[y] = [];
    for (let x = 0; x < size; x++) {
      nextP[y][x] = 0;
      if (piece[y] && piece[y][x]) {
        nextP[y][x] = piece[y][x];
      }
    }
  }

  return (
    <div className="board">
      {
        nextP.map((line, index) =>
          <Line
            cells={line}
            key={index}
            y={index}
            color={color}
          />
        )
      }
    </div>
  );
}

const PiecesInput = ({ values, pieceProbabilitySpawn, pieceColors, name, cb }) => {

  const printForm = values.map((element, index) => {
    return (
      <div className="piece">
        <Preview piece={element} color={pieceColors[index]} size="4"/>
        {pieceProbabilitySpawn[index]}
        <input
          type="color"
          value={`${pieceColors[index]}`}
          onInput={(e)=>{
            cb({
              index: index,
              buffer: element,
              proba: pieceProbabilitySpawn[index],
              color: e.target.value,
            });
          }}
        />
      </div>
    )
  });

  return ( printForm )
}

const CreateRoom = ({ roomForm, createRoom, setRoomOptions, resetForm }) => {

  const printForm = Object.keys(roomForm).map(key => {
    let cb = (value) => { setRoomOptions({key:key, value:value}); }
    let input;
    let item = roomForm[key];

    if (roomForm[key].type === "number") {
      input = <NumberInput {...roomForm[key]} cb={cb} />;

    } else if (roomForm[key].type === "bool") {
      input = <BoolInput {...roomForm[key]} cb={cb} />;

    } else if (roomForm[key].type === "radio") {
      input = <RadioInput {...roomForm[key]} cb={cb} />;

    } else if (roomForm[key].type === "pieces") {
      input = <PiecesInput {...roomForm[key]} cb={cb} />;

    } else {
      input = (<div style={{color: 'red'}}>{key}{item.name}</div>)
    }

    return (
      <div className="inputForm">
        <label>
          {item.name}
        </label>
        <div>
          {input}
          {item.suffix}
        </div>
      </div>
    )

  });

  return (
    <div className="modale">
      <form onSubmit={ (evt) => { evt.preventDefault() } }>

        <div className="title">
          CREATE ROOM
        </div>

        <div className="gametype">

          Rules

          <button onClick={ () => { resetForm() } } >
            42
          </button>

          <button onClick={ () => { resetForm() } } >
            Default rules
          </button>

          <button onClick={ () => { resetForm() } } >
            Default rules
          </button>

          <button onClick={ () => { resetForm() } } >
            Default
          </button>

        </div>

        { printForm }


        <button onClick={
          () => {

            let roomFormCleaned = {};

            Object.keys(roomForm).forEach(key => 
              roomFormCleaned[key] = (roomForm[key].hasOwnProperty("value"))
                ? roomForm[key].value
                : roomForm[key].values
            );
            roomFormCleaned["pieces"] = roomForm["pieces"];
            createRoom(roomFormCleaned);

          }
          } >
          CREATE ROOM
        </button>

      </form>


    </div>
  )
};

function createRoomAction(options) {
  return {
    type: 'CREATE_ROOM',
    payload: options,
  }
}

// EDIT PIECE COLOR / PROBA / DELETE

// CREATE NEW PIECE

function setRoomOptionsAction(options) {
  return {
    type: 'SET_FORM',
    payload: {
      key: options.key,
      value: options.value
    },
  }
}

function resetFormAction() {
  return {
    type: 'RESET_FORM',
    payload: {},
  }
}
const mapStateToProps = (state) => ({
  roomForm: state.roomForm
})

const mapDispatchToProps = (dispatch, payload) => ({
  createRoom: (options) => dispatch(createRoomAction(options)),
  setRoomOptions: (options) => dispatch(setRoomOptionsAction(options)),
  resetForm: () => dispatch(resetFormAction())
})

export default connect(mapStateToProps, mapDispatchToProps)(CreateRoom);
