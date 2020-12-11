import React from 'react'
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import history from '../hooks/history';

import Game from '../containers/game'

import CreateRoom from '../components/createRoom'
import Form from '../components/form'
import RoomList from '../components/roomList'

const App = () => {

  console.log(history);
  return (
    <div className='wrap'>
      <Router history={history}>
        <nav>
          <ul>
            <li>
              <Link to='/'>
                Home
              </Link>
            </li>
            <li>
              <Link to='createRoom'>
                CreateRoom 
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

      <Route path='/createRoom' component={CreateRoom} />
      <Route path='/room' component={Game} />

      <Route exact path='/'>
        <Form />
        <RoomList />
      </Route>

      </Router>
    </div>
  )
}

export default App;
