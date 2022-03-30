import {CHANGE_DRAWER, STUDENT_SELECT, TEACHER_SELECT} from "./actionType";

/**
 * 打开个人中心面板（抽屉）
 * @param value
 * @returns {{type: boolean, value}}
 */
export const changeDrawer = (value)=>({
    type: CHANGE_DRAWER,
    value
})

/**
 * 老师管理-数状表选择
 * @param value
 * @returns {{type: string, value}}
 */
export const teacherSelect = (value)=>({
    type: TEACHER_SELECT,
    value
})

/**
 * 学生管理-树状表选择
 * @param value
 * @returns {{type: string, value}}
 */
export const studentSelect = (value)=>({
    type:STUDENT_SELECT,
    value
})
