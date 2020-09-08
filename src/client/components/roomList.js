import React from 'react'
import { Link } from 'react-router-dom';
import { connect } from 'react-redux'

const Room = (room, index, jointRoom) => (
  <div>
    <hr />

    <div>
      local_id : {index}  nb_players : {room.players.length}
      <br />
      <Link to={`/game/${room.id}`}>
        <button
          onClick={ () => {
            jointRoom({
              type: 'JOINT_ROOM',
              payload: room.id,
            })
          } }
        >
          JOINT ROOM {room.id}
        </button>
      </Link>

    </div>

  </ div>
)

const RoomList = ({ rooms, createRoom, getRoomList, jointRoom }) => (
  <div>
    <hr />
    <button
      onClick={ () => {
        createRoom({
          type: 'CREATE_ROOM',
          payload: 'PAYLOAD/game_opts?',
        })
      } }
    >
            CREATE ROOM
    </button>

    <button
      onClick={ () => {
        createRoom({
          type: 'GET_ROOM_LIST',
          payload: 'PAYLOAD/filters?',
        })
      } }
    >
            GET ROOM LIST
    </button>
    <hr />
      ROOMLIST
    ({rooms.length} room)

    {
      rooms.map((room, index) => (Room(room, index, jointRoom)))
    }
    <hr />
  </ div>
)

const mapStateToProps = (state) => ({
  rooms: state.rooms,
})

function sendSocketMessageAction(payload) {
  return (payload);
}

const mapDispatchToProps = (dispatch, payload) => ({
  createRoom: (message) => dispatch(sendSocketMessageAction(message)),
  getRoomList: (message) => dispatch(sendSocketMessageAction(message)),
  jointRoom: (message) => dispatch(sendSocketMessageAction(message)),
})

export default connect(mapStateToProps, mapDispatchToProps)(RoomList);
