/* move */

export function moveDown(buffer, piece) {
  let pieceHasLanded = false
  pieceHasLanded = true;
  return pieceHasLanded;
}

export function turnClockwise(piece, buffer) {
}

export function strafeLeft(piece, buffer) {
}

export function strafeRight(piece, buffer) {
}

export function hardDrop(piece, buffer) {
  if (moveDown(piece, buffer)) { hardDrop(piece, buffer); }
  else { mergePieceInBuffer(piece, buffer); }
}

/* */

export function checkMove(buffer, piece) {

}

export function mergePieceInBuffer(piece, buffer) {
  let newBuffer;
  return newBuffer;
}

export function checkLines(buffer) {
  return buffer;
}
