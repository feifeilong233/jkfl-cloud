import {combineReducers} from "redux";
import drawer from "./drawer";
import user_tree_select from "./user_tree_select";

const rootReducer = combineReducers({
    drawer,
    user_tree_select
})

export default rootReducer;