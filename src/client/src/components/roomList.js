import React from 'react'
import { Link } from 'react-router-dom';
import { connect } from 'react-redux'

const Room = ({ room, jointRoom }) => (
  <div>
    <hr />
    <div>
      {room.id}
      <br />
      nb_players : {room.players.length}
      <br />
      <Link to={`/room/${room.id}`}>
        <button onClick={ () => jointRoom(room.id) } >
          JOINT ROOM
        </button>
      </Link>
    </div>
  </ div>
)

const RoomList = ({ rooms, createRoom, getRoomList, jointRoom }) => (
  <div>
    <hr />

    <button onClick={ () => createRoom('PAYLOAD/game_opts?') } >
      CREATE ROOM
    </button>
    <button onClick={ () => getRoomList('PAYLOAD/filters?') } >
      GET ROOM LIST
    </button>

    <hr />

    ROOMLIST

    ({rooms.length} room)
    {
      rooms.map((room) =>
        <Room
          jointRoom={jointRoom}
          key={room.id}
          room={room}
        />
      )
    }
  </ div>
)

function createRoomAction(options) {
  return {
    type: 'CREATE_ROOM',
    payload: options,
  }
}

function getRoomListAction(filters) {
  return {
    type: 'GET_ROOM_LIST',
    payload: filters,
  }
}

function jointRoomAction(roomId) {
  return {
    type: 'JOINT_ROOM',
    payload: roomId,
  }
}

const mapStateToProps = (state) => ({
  rooms: state.rooms,
})

const mapDispatchToProps = (dispatch) => ({
  createRoom: (options) => dispatch(createRoomAction(options)),
  getRoomList: (filters) => dispatch(getRoomListAction(filters)),
  jointRoom: (roomId) => dispatch(jointRoomAction(roomId)),
})

export default connect(mapStateToProps, mapDispatchToProps)(RoomList);
