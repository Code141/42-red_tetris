import React from 'react'

const Line = ({ cells, y }) => (
  <ul className='line'>
    {
      cells.map((cell, x) => (
        <li className={`cell c${cell}`} key={x}>
          { cell }
        </li>
      )
      )
    }
  </ul>
)

const Board = ({ player, game }) => {
  const board = player.board;

  const piece = player.pieces[0];
  const buffer = game.rules.pieces[game.pieces[player.nbPiecesLanded].id];
  console.log(piece);

  const b2 = board.buffer.map((line, y) => line.map((cell, x) => {
    const relx = x - piece.x;
    const rely = y - piece.y;
    if (buffer[rely] === undefined ||
      buffer[rely][relx] === undefined ||
      buffer[rely][relx] === 0
    ) {
      return cell;
    }
    return (buffer[rely][relx]);
  }));

  return (
    <div className='board'>
    ID {player.id}
    USERNAME {player.username}
    SCORE {player.score}
      {
        b2.map((line, index) =>
          <Line
            cells={line}
            key={index}
            y={index}
          />
        )
      }
    </div>
  )
}

export default Board;
