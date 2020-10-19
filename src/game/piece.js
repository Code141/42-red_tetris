class Piece {
  constructor(pieceIndex, rules) {
    this.id = pieceIndex;
    this.x = 0;
    this.y = 0;
    this.rotation = 0;

    const piece = rules.pieces[pieceIndex]
    this.height = piece.length;
    this.width = 0;
    for (let y = 0, l = piece.length; y < l; y++) {
      if (this.width < piece[y].length) { this.width = piece[y].length; }
    }
    this.buffer = piece;
  }
}

export default Piece;
