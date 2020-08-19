import React from 'react'
import { connect } from 'react-redux'
import { gameAction } from '../actions/game'

const Board = ({ game, clickOnCell }) => (
  <div className='board'>
    {
      game.map((line, index) =>
        <Line
          callback={clickOnCell}
          cells={line}
          key={index}
          y={index}
        />
      )
    }
  </div>
)
const Cell2 = ({ game }) => (
  <div>
    {game}
  </div>
)

const Line = ({ cells, y, callback }) => (
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
          callback={callback}
          cell={cell}
          key={index}
          x={index}
          y={y}
        />
      )
    }
  </ul>
)

const Cell = ({ cell, x, y, callback }) => (
  <li
    className='cell'
    onClick={() => { callback({ x, y }) }}
  >
    { cell }
  </li>
)

const mapStateToProps = (state) => ({
  game: state.game,
})

const mapDispatchToProps = (dispatch, payload) => ({
  clickOnCell: (cell) => dispatch(gameAction(cell)),
})

export default connect(mapStateToProps, mapDispatchToProps)(Board);
