export function checkMove(buffer) {

}

export function moveDown(buffer) {
  let pieceHasLanded = false
  pieceHasLanded = true;
  return pieceHasLanded;
}

export function checkLines(buffer) {
  return buffer;
}

export function mergePieceInBuffer(piece, buffer) {
  let newBuffer;
  return newBuffer;
}

export function hardDrop(piece, buffer) {
  if (moveDown(piece, buffer))
    hardDrop(piece, buffer);
  else
    mergePieceInBuffer(piece, buffer);
}
