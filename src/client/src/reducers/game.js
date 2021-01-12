import {
  GAME_STATUS,
  ROOM_JOINTED,
  ROOM_LEAVED,
  NEXT_TICK,
  NEXT_PIECE,
  LOOSE,
  STRAFE_LEFT,
  STRAFE_RIGHT,
  ADMIN_ID,
  LAND_PIECE,
  DELETE_LINES
} from '../actions/game'

//import { moveDown, strafeLeft, strafeRight, checkCollision } from '../game/rules.js'

function deleteLines(board, linesToDelete) {
  let newBoard = {...board};
  let buffer = new Array(board.height);

    for (let y = 0, l = board.height; y < l; y++) {
      buffer[y] = new Array(board.width);
      for (let x = 0, ll = board.width; x < ll; x++) {
        buffer[y][x] = board.buffer[y][x];
      }
    }
    newBoard.buffer = buffer;
    linesToDelete.forEach((lineNb) => {
     buffer.splice(lineNb, 1);
      const line = new Array(board.width);
      for (let i = 0, l = board.width; i < l; i++) {
        line[i] = 0;
      }
      buffer.unshift(line);
    })
  return newBoard;
  }

const game = {
  id: null,
  admin: null,
  players: [],
  pieces: [],
  spectators: [],
  tick: 0,
};

const reducer = (state = game, action) => {
  let player, players, id_player;

  switch (action.type) {

    case GAME_STATUS:
      return {
        ...state,
        ...action.payload,
      }

    case LOOSE:
      players = state.players.map((player) => {
        if (player.id === action.payload.userid) { return { ...player, loose: true } }
        return { ...player }
      });

      return {
        ...state,
        players,
      }

    case ADMIN_ID:
      return {
        ...state,
        admin: action.payload,
      };

    case ROOM_JOINTED:
      return {
        ...state,
        id: action.payload.id,
        admin: action.payload.admin,
        players: action.payload.players,
        pieces: action.payload.pieces,
        spectators: action.payload.spectators,
        gameHasStarted: action.payload.gameHasStarted,
        rules: action.payload.rules,
      };

    case ROOM_LEAVED:
      return game;

    case NEXT_TICK:
      return {
        ...state,
        tick: action.payload.tick,
        players: state.players.map((player, id) => {
          if (player.loose)
            return player

          let nextStatePlayer = { ...player };

          if (nextStatePlayer.landed) {
            const buffer = state.rules.pieces.values[state.pieces[player.nbPiecesLanded].id];
            const piece = player.pieces[player.nbPiecesLanded];
            nextStatePlayer.landed = false;
            nextStatePlayer.nbPiecesLanded += 1;
            nextStatePlayer.board = {
              ...nextStatePlayer.board,
              buffer: player.board.buffer.map((line, y) => {
                return line.map((cell, x) => {
                  const relx = x - piece.x;
                  const rely = y - piece.y;
                  if (buffer[rely] === undefined ||
                    buffer[rely][relx] === undefined ||
                    buffer[rely][relx] === 0
                  ) {
                    return cell;
                  }
                  return (buffer[rely][relx]);
                })
              }),
            }
          }
          else {
            nextStatePlayer.pieces = player.pieces.map((piece, indexPiece) => 
              (indexPiece !== player.nbPiecesLanded)
              ? { ...piece }
              : { ...piece, y: piece.y + 1 }
            )
          }

          if (nextStatePlayer.linesToDelete)
          {
            nextStatePlayer.board = deleteLines(nextStatePlayer.board, nextStatePlayer.linesToDelete);
            nextStatePlayer.linesToDelete = undefined;
          }

          return nextStatePlayer 
        }),
      };

    case DELETE_LINES:

      id_player = action.payload.id_player;
      player = state.players[id_player];

      return {
        ...state,
        players: state.players.map((player, id) =>
          (id !== id_player)
          ? { ...player }
          : { ...player, linesToDelete: action.payload.linesToDelete }
        )
      }

    case NEXT_PIECE:
      players = state.players.map((player) => ({
        ...player,
        pieces: [
          ...player.pieces,
          action.payload,
        ],
      }));

      return {
        ...state,
        players,
        pieces: [
          ...state.pieces,
          action.payload,
        ],
      };

    case LAND_PIECE:
      id_player = action.payload.id_player;
      player = state.players[id_player];

      return {
        ...state,
        players: state.players.map((player, id) =>
          (id !== id_player)
          ? { ...player }
          : { ...player, landed: true }
        )
      }

    case STRAFE_LEFT:
      id_player = action.payload.id_player;
      return {
        ...state,
        players: state.players.map((player, id) => {
          if (id !== id_player) { return { ...player } }
          return {
            ...player,
            pieces: player.pieces.map((piece, indexPiece) => {
              if (indexPiece !== player.nbPiecesLanded) { return { ...piece } }
              return {
                ...piece,
                x: piece.x - 1,
              }
            }),
          }
        }),
      };

    case STRAFE_RIGHT:
      id_player = action.payload.id_player;
      return {
        ...state,
        players: state.players.map((player, id) => {
          if (id !== id_player) { return { ...player } }
          return {
            ...player,
            pieces: player.pieces.map((piece, indexPiece) => {
              if (indexPiece !== player.nbPiecesLanded) { return { ...piece } }
              return {
                ...piece,
                x: piece.x + 1,
              }
            }),
          }
        }),
      };
    default:
      return state
  }
}

export default reducer


