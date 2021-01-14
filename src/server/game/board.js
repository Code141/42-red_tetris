class Board {
  constructor(width, height) {
    this.width = width;
    this.height = height;
    this.buffer = undefined;
    this.resetBoard();
  }

  resetBoard() {
    this.buffer = new Array(this.height);
    for (let y = 0, l = this.height; y < l; y++) {
      this.buffer[y] = new Array(this.width);
      for (let x = 0, ll = this.width; x < ll; x++) {
        this.buffer[y][x] = 0;
      }
    }
  }

  clear() {
    for (let y = 0, l = this.height; y < l; y++) {
      for (let x = 0, ll = this.width; x < ll; x++) {
        this.buffer[y][x] = 0;
      }
    }
  }

  deleteLines(linesToDelete) {
    linesToDelete.forEach((lineNb) => {
      this.buffer.splice(lineNb, 1);

      const line = new Array(this.width);
      for (let i = 0, l = this.width; i < l; i++) {
        line[i] = 0;
      }
      this.buffer.unshift(line);
    })
  }

  setPenality() {
    let i = 0;
    while (i < this.width && this.buffer[0][i] === 0) { i++; }
    if (i !== this.width) { console.log('YOU LOOOOOOOOOSE (by penality)'); }

    /*
      for (let i = 0, l = this.width; i < l; i++) {
        line[i] = 0;
      }
      */
  }

  mergePiece(piece) {
    const pieceBuffer = piece.buffer;
    const l = piece.height;
    const ll = piece.width;
    let y = 0;
    let x = 0;

    while (y < l) {
      while (x < ll) {
        if (pieceBuffer[y][x] !== 0) {
          this.buffer[piece.y + y][piece.x + x] = pieceBuffer[y][x];
        }
        x++;
      }
      x = 0;
      y++;
    }
  }

  checkLine() {
    const lines = [];
    let y = 0;
    let x = 0;

    while (y < this.height) {
      while (x < this.width && this.buffer[y][x] !== 0 &&
        this.buffer[y][x] !== 255) {
        x++;
      }
      if (x === this.width) {
        lines.push(y);
      }
      x = 0;
      y++;
    }
    return lines;
  }

  debug() {
    let line = "";
    for (let y = 0; y < this.height; y++) {
      for (let x = 0; x < this.width; x++) {
        line += this.buffer[y][x] + "";
      }
      console.log(line);
      line = "";
    }
      console.log("");
  }

}

export default Board;
