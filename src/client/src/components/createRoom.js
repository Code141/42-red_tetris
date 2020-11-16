import React from 'react'
import { connect } from 'react-redux'
import { setUserNameAction } from '../actions/user'

const CreateRoom = ({createRoom}) => (
  <div>
    CREATE ROOM
    <br />

    <hr />

    <form>
      GAME TYPE
      <br />

      <input type="radio" id="suddenDeath" name="gameType" value="suddenDeath" checked />
      <label for="all">Quicksand</label>

      <input type="radio" id="suddenDeath" name="gameType" value="suddenDeath" />
      <label for="all">Sudden death (with penality)</label>

      <hr />

      <label>
        Tick duration :
        <input type="number" placeholder="" value="150" />
        ms
      </label>
      <br />

      <label>
        Heat room time :
        <input type="number" placeholder="" value="3000" />
        ms
      </label>
      <br />

      <label>
        Max player :
        <input type="number" placeholder="" value="5" />
      </label>
      <br />

      <label>
        Allow spectator :
        <input type="checkbox" value="true" />
      </label>

      <hr />
      BOARD
      <br />

      <label>
        Width :
        <input type="number" placeholder="" value="10" />
      </label>
      <br />

      <label>
        Height :
        <input type="number" placeholder="" value="20" />
      </label>

      <hr/>
      PERMITED MOVES :
      <br />

      <label>
        Hard drop :
        <input type="checkbox" value="true" />
      </label>
      <br />

      <label>
        moveDown :
        <input type="checkbox" value="true" />
      </label>
      <br />

      <label>
        rotation :
        <input type="checkbox" value="true" />
      </label>

      <hr />
      PIECES
      <br />

      on/off
      <br />
      probability spawn
      <br />
      color
      <br />

      <button>
        Add custom piece
      </button>
      <br />

      <hr />

      FOG OF WAR
      <br />
      <input type="radio" id="all" name="fogOfWar" value="all" checked />
      <label for="all">All is visible</label>
      <input type="radio" id="vertical" name="fogOfWar" value="vertical" />
      <label for="vertical">Vertical only</label>
      <input type="radio" id="horizontal" name="fogOfWar" value="horizontal" />
      <label for="horizontal">Horizontal only</label>
      <hr />


      <button onClick={ () => createRoom('PAYLOAD/game_opts?') } >
        CREATE ROOM
      </button>
      <br />

    </form>


  </div>
)

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
