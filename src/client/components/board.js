import React from 'react'

const Board = ({ board }) => (
  <div className='board'>
    {
      board.map((line, index) =>
        <Line
          cells={line}
          key={index}
          y={index}
        />
      )
    }
  </div>
)

const Line = ({ cells, y }) => (
  <ul className='line'>
    {
      cells.map((cell, index) =>
        <li className='cell'> { cell } </li>
      )
    }
  </ul>
)

export default Board;
