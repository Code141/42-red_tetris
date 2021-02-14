/* move */

export function moveDown(board, piece) {
  piece.y = piece.y + 1;
  if (checkCollision(board, piece)) {
    piece.y = piece.y - 1;
    return false;
  }
  return true;
}

export function rotate(board, piece) {
  let x = 0;
  let y = 0;
/*
  if (piece.width !== piece.height) {
    let min = Math.min(piece.height, piece.width);
    let max = Math.max(piece.height, piece.width);

    x = Math.floor(piece.height / 2);
    y = Math.floor(piece.width / 2);
  }

*/
  piece.x += x;
  piece.y += y; // I MUST BRODCAST TO VIEW

  piece.rotateClockwise();
  if (checkCollision(board, piece)) {
    piece.rotateAntiClockwise();

    piece.x -= x;
    piece.y -= y;

    return false;
  }
  return true;
}


export function turnClockwise(board, piece) {
}

export function strafeLeft(board, piece) {
  piece.x = piece.x - 1;
  if (checkCollision(board, piece)) {
    piece.x = piece.x + 1;
    return false;
  }
  return true;
}

export function strafeRight(board, piece) {
  piece.x = piece.x + 1;
  if (checkCollision(board, piece)) {
    piece.x = piece.x - 1;
    return false;
  }
  return true;
}

export function hardDrop(board, piece) {
  if (moveDown(board, piece)) { hardDrop(board, piece); }
  else { mergePieceInBoard(board, piece); }
}

/* */

export function checkCollision(board, piece) {
  let pieceBuffer = piece.buffer[piece.rotation];

  for (let y = 0, l = pieceBuffer.length; y < l; y++) {
    const pline = pieceBuffer[y];
    for (let x = 0, ll = pline.length; x < ll; x++) {
      const pcell = pline[x];
      if (pcell !== 0) {
        // hit left
        if (piece.x + x < 0) { return true; }
        // hit right
        if (piece.x + x >= board.width) { return true; }
        // check if the piece hit the bottom
        if (piece.y + y >= board.height) { return true; }
        // check if the piece is over something
        if (board.buffer[piece.y + y][piece.x + x]) { return true; }
      }
    }
  }

  // check if the piece is over something
  /*
  for (let y = 0, l = pieceBuffer.length; y < l; y++) {
    const pline = pieceBuffer[y];
    for (let x = 0, ll = pline.length; x < ll; x++) {
      const pcell = pline[x];
      if (pcell !== 0) {
        if (board.buffer[piece.y + y][piece.x + x]) {
          return true;
        }
      }
    }
  }
  */
  return false;
}

