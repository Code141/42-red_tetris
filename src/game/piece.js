class Piece {
  constructor(pieceIndex, rules) {
    const piece = rules.pieces[pieceIndex]

    this.height = piece.length;
    this.width = 0;
    for (let y = 0, l = piece.length; y < l; y++) {
      if (this.width < piece[y].length) { this.width = piece[y].length; }
    }
    this.buffer = piece;

    this.id = pieceIndex;
    this.x = Math.round(Math.random() * (rules.board.width - this.width));
    this.y = 0;
    this.rotation = 0;
  }

  info() {
    return ({
      id: this.id,
      x: this.x,
      y: this.y,
      rotation: this.rotation,
    });
  }
}

export default Piece;
