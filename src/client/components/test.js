import React from 'react'
import { connect } from 'react-redux'
import { gameAction } from '../actions/game'

const Board = ({ game, clickOnCell }) => {
  return (
    <div className='board'>
      {
        game.map((line, index) =>
          <Line
            key={index}
            cells={line}
            y={index}
            callback={clickOnCell}
          />
        )
      }
    </div>
  )
}
const Cell2 = ({ game }) => {
  return (
    <div>
      {game}
    </div>
  )
}

const Line = ({ cells, y, callback }) => {

  return (
    <ul className='line'>
      {

      /*
    cells.map((cell, x) => {
      return connect(
      (state) => {
        return {
          game: state.game[y][x],
        }
      }
      ,
     (dispatch, payload) => {
       return {
         clickOnCell: (cell) => dispatch(gameAction(cell)),
       }
     }
    )(Cell2);
    })
    */
      }
      {
        cells.map((cell, index) =>
          <Cell
            key={index}
            cell={cell}
            x={index}
            y={y}
            callback={callback}
          />
        )
      }
    </ul>
  )
}
const Cell = ({ cell, x, y, callback }) => {
  return (
    <li
      className='cell'
      onClick={() => { callback({ x, y }) }}
    >
      { cell }
    </li>
  )
}

const mapStateToProps = (state) => {
  return {
    game: state.game,
  }
}

const mapDispatchToProps = (dispatch, payload) => {
  return {
    clickOnCell: (cell) => dispatch(gameAction(cell)),
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Board);
