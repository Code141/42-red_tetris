import React from 'react'

const Line = ({ cells, y, colors }) => (
  <ul className='line'>
    {
      cells.map((cell, x) => (
        <li
          className={`cell c${cell} ${cell ? 'block' : ''}`}
          key={x}
          style={(cell !== 0 && cell !== 254 && cell !== 255) ? {backgroundColor: colors[cell - 1]} : {}}
        >
        </li>
      ))
    }
  </ul>
)

const Preview = ({ piece, size, colors }) => {
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
            colors={colors}
          />
        )
      }
    </div>
  );
}

const StandardBoard = ({ board, piece, pieceBuffer, colors }) => {

  const b2 = board.buffer.map((line, y) => line.map((cell, x) => {
    const relx = x - piece.x;
    const rely = y - piece.y;
    if (pieceBuffer[rely] === undefined ||
      pieceBuffer[rely][relx] === undefined ||
      pieceBuffer[rely][relx] === 0
    ) {
      return cell;
    }
    return (pieceBuffer[rely][relx]);
  }));

  return (
    <div className="board">
      {
        b2.map((line, index) =>
          <Line
            cells={line}
            key={index}
            y={index}
            colors={colors}
          />
        )
      }
    </div>
  );

}


const HorizontalBoard = ({ board, fillWith, colors }) => {

  const b2 = [];
  let isLine = false;
  for (let y = 0, l = board.height; y < l; y++) {
    b2[y] = [];
    for (let x = 0, ll = board.width; x < ll; x++) {
      if (board.buffer[y][x] !== 0 && board.buffer[y][x] !== 254 ) {
        isLine = true;
      }
    }
    if (isLine) {
      for (let x = 0, ll = board.width; x < ll; x++) {
        b2[y][x] = fillWith;
      }
      isLine = false;
    } else {
      for (let x = 0, ll = board.width; x < ll; x++) {
        b2[y][x] = board.buffer[y][x];
      }
    }
  }

  return (
    <div className="board">
      {
        b2.map((line, index) =>
          <Line
            cells={line}
            key={index}
            y={index}
            colors={colors}
          />
        )
      }
    </div>
  );
}

const VerticalBoard = ({ board, fillWith, colors }) => {
  const b2 = [];
  for (let y = 0, l = board.height; y < l; y++) {
    if (!b2[y]) { b2[y] = []; }
    for (let x = 0, ll = board.width; x < ll; x++) {
      if (board.buffer[y][x] !== 0 && board.buffer[y][x] !== 255) {
        for (let yy = y ; yy < l; yy++) {
          if (!b2[yy]) { b2[yy] = []; }
          b2[yy][x] = fillWith;
        }
      } else if (b2[y][x] !== fillWith){
        b2[y][x] = board.buffer[y][x];
      }
    }
  }

  return (
    <div className="board">
      {
        b2.map((line, index) =>
          <Line
            cells={line}
            key={index}
            y={index}
            colors={colors}
          />
        )
      }
    </div>
  );

}


const Board = ({ player, game, type }) => {

  // TRY TO PUT THESES CONST ONE LEVEL COMPONENT UPPER
  const board = player.board;
  const piece = player.pieces[player.nbPiecesLanded];
  const pieceBuffer = game.rules.pieces.values[game.pieces[player.nbPiecesLanded].id].buffers[piece.rotation];
  const nextPiece = game.rules.pieces.values[game.pieces[player.nbPiecesLanded + 1].id].buffers[0];
  const colors = game.rules.pieces.pieceColors;
  let b;

  if (type === "personal" || game.rules.fogOfWar === "all") {
    b = ( <StandardBoard board={board} piece={piece} pieceBuffer={pieceBuffer} colors={colors} />);
  }
  else{
    if (game.rules.fogOfWar === "horizontal") {
      b = ( <HorizontalBoard board={board} fillWith="254" colors={colors}/>);
    } else {
      b = (<VerticalBoard board={board} fillWith="254" colors={colors}/>);
    }
  }

  return (
    <div className={`game ${(player.loose) ? 'loose' : ''}`} >
      {b}

      <div className="cartridge">
        <Preview piece={nextPiece} size="4" colors={colors} />
        <div className="username">
          {player.username}
        </div>
        <div className="score"> score {player.score} </div>
        <div className="level"> level {player.level} </div>
      </div>
    </div>
  )
}

export default Board;
