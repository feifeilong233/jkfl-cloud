import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import reportWebVitals from './reportWebVitals';
import {BrowserRouter, HashRouter, Route, Switch} from "react-router-dom";
import Login from "./router/Login";
import Home from "./router/Home";
import 'antd/dist/antd.css';

ReactDOM.render(
  <HashRouter>
      <Switch>
          <Route path="/login" component={Login}/>
          <Route path='/back' component={Home}/>
      </Switch>
  </HashRouter>
  ,document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
