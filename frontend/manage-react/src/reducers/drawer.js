import {CHANGE_DRAWER} from "../store/actionType";

const initialState = {}

/**
 * 个人信息面板的action
 * @type {{}}
 */
export default function drawer(state = initialState,action){
    switch (action.type){
        case CHANGE_DRAWER:{
            let newState =JSON.parse(JSON.stringify(state));
            newState.visible = action.value.visible;
            newState.user = action.value.user;
            console.log(newState)
            return newState;
        }
    }
    return state;

}