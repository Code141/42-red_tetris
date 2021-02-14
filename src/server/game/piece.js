class Piece {
  constructor(piece, id, position) {
    this.id = id;
    this.x = position;
    this.y = 0;
    this.rotation = 0;

    this.height = piece.height;
    this.width = piece.width;
    this.buffer = piece.buffers;
    //this.buffer = this.generateBuffers(piece);
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
    [this.width, this.height] = [this.height, this.width];
    this.rotation = (this.rotation < 3) ? this.rotation + 1 : 0;
    return 2;
  }

  rotateAntiClockwise() {
    [this.width, this.height] = [this.height, this.width];
    this.rotation = (this.rotation > 0) ? this.rotation - 1 : 3;
  }

  mirrorH() {
  }

  mirrorV() {

  }

}

export default Piece;
