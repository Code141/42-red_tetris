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
import RoomList from '../components/roomList'

const App = ({ message }) => (
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

      <hr/>

      <Switch>

        <Route path='/game'>
          <button>
            LEAVE_ROOM
          </button>
          <Board />
        </Route>

        <Route path='/'>
          <Form />
          <RoomList />
        </Route>

      </Switch>

    </Router>

  </div>
)

export default App;
