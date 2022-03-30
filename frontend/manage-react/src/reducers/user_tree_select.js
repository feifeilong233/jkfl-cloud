import {STUDENT_SELECT, TEACHER_SELECT} from "../store/actionType";
import axios from "axios";
import {getJwtToken} from "../lib/utils";

const initialState = {}

export default function user_tree_select(state = initialState,action){
    switch (action.type){

        case TEACHER_SELECT:{
            let newState =JSON.parse(JSON.stringify(state));
            //console.log("teacher-select",action.value);
            newState.select_teacher = action.value;
            return newState;
        }
        case STUDENT_SELECT:{
            let newState =JSON.parse(JSON.stringify(state));
            newState.select_student = action.value;
            return newState;
        }
    }

    return state;
}