import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'
import configureStore from './store/configureStore'
import 'antd/dist/antd.less'
import './assets/css/style.css'
import login from './containers/login/index.js'
import main from './containers/main/index.js'
import { HashRouter,BrowserRouter,Route,Link,Switch  } from 'react-router-dom'
import XLXS from 'xlsx';

const store = configureStore()

ReactDOM.render((
	<Provider store={store}>
		<BrowserRouter>
			<div>
				<Switch>
					<Route path="/login" component={login}/>
					<Route path="/main" component={main}/>
				</Switch>
			</div>
		</BrowserRouter>
	</Provider>
),document.getElementById('app'));
