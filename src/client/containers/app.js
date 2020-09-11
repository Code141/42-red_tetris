import React from 'react'
import {
  Switch,
  Route,
  Link,
} from 'react-router-dom';

import Game from '../containers/game'
import Form from '../components/form'
import RoomList from '../components/roomList'

const App = () => (
  <div className='wrap'>
    <nav>
      <ul>
        <li>
          <Link to='/'>
                  Home
          </Link>
        </li>
        <li>
          <Link to='/room'>
                  Game
          </Link>
        </li>
      </ul>
    </nav>

    <hr/>

    <Route path='/room'>
      <Game />
    </Route>

    <Route exact path='/'>
      <Form />
      <RoomList />
    </Route>

  </div>
)

export default App;
