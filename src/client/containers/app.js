import React from 'react'
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
} from 'react-router-dom';
import { connect } from 'react-redux'
import Board from '../components/test'
import Form from '../components/form'

const App = ({ message }) => {
  return (
    <div className='wrap'>
      <Router>

          <nav>
            <ul>

              <li>
                <Link to='/'>
                  Home
                </Link>
              </li>

              <li>
                <Link to='/game'>
                  Game
                </Link>
              </li>

            </ul>
          </nav>

          <Switch>

            <Route path='/game'>
              <Board />
            </Route>

            <Route path='/'>
              <Form />
            </Route>

          </Switch>

      </Router>

    </div>
  )
}

export default App;
