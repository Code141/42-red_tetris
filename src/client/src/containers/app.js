import React from 'react'
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import history from '../hooks/history';

import Game from '../containers/game'

import CreateRoom from '../components/createRoom'
import Form from '../components/form'
import RoomList from '../components/roomList'

const App = () => {

  return (
    <div className='wrap'>
      <Router history={history}>
        <nav>
          <Link to='/'>
            Home
          </Link>
          |
          <Link to='createRoom'>
            CreateRoom 
          </Link>
          |
          <Link to='/room'>
            Game
          </Link>
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
