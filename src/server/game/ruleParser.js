class RuleParser {
  constructor(rule) {
    this.rules = rule;
  }

  check(inputRules)
  {
    let parsedRules = {};

    Object.keys(this.rules).forEach(key => {

      let rule = this.rules[key];
      /* OVERWRITE BOOL
      if (!inputRules[key])
        return; ///////// REPLACE WITH THISRULE VALUE;
        */

      let value = inputRules[key];
      /*
         .hasOwnProperty("value"))
        ? inputRules[key].value
        : inputRules[key].values;
        */

      switch (rule.type) {
        case "number" :
          value = this.parseNumber(rule, value);
          break;
        case "bool" :
          value = this.parseBool(rule, value);
          break;

        case "pieces" :
          value = this.parsePieces(rule, value);
          break;
        default:
          console.log("WARNING UNKNOW INPUT TYPE FOR " + key);
          break;
      }

      parsedRules[key] = value;
    });
    return parsedRules;
  }

  parseNumber(rule, value) {
    value = parseInt(value);
    return (value <= rule.max && value >= rule.min)
      ? value
      : rule.value;
  }

  parseBool(rule, value) {
    return ((value !== "false" || value !== false)
      && (value === "true" || value === true))
      ? true
      : false
  }

  parsePieces(rule, value) {
    let pieces = value.values;

    let newPiece = [];
    for (let i = 0, l = pieces.length; i < l; i++) {
      let piece = pieces[i];
      let {width, height} = this.getPieceSize(piece);
      let buffers = this.generateRotations(piece, width, height);
      newPiece[i] = {width, height, buffers};
    }

    value.values = newPiece;
    return value;
  }
  getPieceSize(piece)
  {
      let height = piece.length;
      let width = 0;
      for (let y = 0, l = piece.length; y < l; y++) {
        if (width < piece[y].length) { width = piece[y].length; }
      }
    return {height, width};
  }
  generateRotations (piece, width, height) {
    let buffers = new Array(
      new Array(height),
      new Array(width),
      new Array(height),
      new Array(width)
    );

    for (let i = 0; i < height; i++) {
      buffers[0][i] = new Array(width);
      buffers[2][i] = new Array(width);
    }

    for (let i = 0; i < width; i++) {
      buffers[1][i] = new Array(height);
      buffers[3][i] = new Array(height);
    }

    for (let y = 0; y < height; y++) {
      for (let x = 0; x < width; x++) {
        let value = piece[y][x];
        buffers[0][y][x] = value;
        buffers[1][x][height - y - 1] = value;
        buffers[2][height - y - 1][width - x - 1] = value;
        buffers[3][width - x - 1][y] = value;
      }
    }
    return buffers;
  }
}

export default RuleParser;
