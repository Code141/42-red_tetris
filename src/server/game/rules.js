/* move */

export function moveDown(board, piece) {
  piece.y = piece.y + 1;
  if (checkCollision(board, piece)) {
    piece.y = piece.y - 1;
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
  // APPLY ROTATION WHILE COPY PIECE IN NEW BUFFER

  // THEN CHECK COLLISION

  // check if the piece hit the bottom
  if (piece.height + piece.y > board.height) {
    return true;
  }

  // hit left
  if (piece.x < 0) {
    return true;
  }

  // hit right
  if (piece.x + piece.width > board.width) {
    return true;
  }

  // check if the piece is over something
  for (let y = 0, l = piece.buffer.length; y < l; y++) {
    const pline = piece.buffer[y];
    for (let x = 0, ll = pline.length; x < ll; x++) {
      const pcell = pline[x];
      if (pcell !== 0) {
        if (board.buffer[piece.y + y][piece.x + x]) {
          return true;
        }
      }
    }
  }
  return false;
}

