import {createStore} from "redux";
import rootReducer from "../reducers";

/**
 * redux - store
 * @type {Store<unknown, Action>}
 */
const store = createStore(
    rootReducer,
    window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
)

export default store;