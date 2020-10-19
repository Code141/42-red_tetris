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
}

export default Board;
