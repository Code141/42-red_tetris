class Piece {
  constructor(piece, id) {
    this.id = id;
    this.x = 0;
    this.y = 0;
    this.rotation = 0;

    this.height = piece.length;
    this.width = 0;
    for (let y = 0, l = piece.length; y < l; y++) {
      if (this.width < piece[y].length) { this.width = piece[y].length; }
    }
    this.buffer = piece;
  }

  info() {
    return ({
      id: this.id,
      x: this.x,
      y: this.y,
      rotation: this.rotation,
    });
  }

  rotateClockwise() {
    this.rotation = this.rotation + (this.rotation + 1) % 4;
  }

  rotateAntiClockwise() {
    this.rotation = this.rotation + (this.rotation - 1) % 4;
  }

  mirrorH() {
  }

  mirrorV() {
  }
}

export default Piece;
