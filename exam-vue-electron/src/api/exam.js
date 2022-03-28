// 考试相关的接口，包括考试、问题、选项和评分等接口

import api from './index'
import { axios } from '../utils/request'

export function getExamList (parameter) {
  return axios({
    url: api.ExamList,
    method: 'get',
    params: parameter
  })
}

export function getExamCardList () {
  return axios({
    url: api.ExamCardList,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}

export function examCreate (parameter) {
  console.log(parameter)
  return axios({
    url: api.ExamCreate,
    method: 'post',
    data: parameter
  })
}

export function examUpdate (parameter) {
  console.log(parameter)
  return axios({
    url: api.ExamUpdate,
    method: 'post',
    data: parameter
  })
}

export function getExamDetail (examId) {
  return axios({
    url: api.ExamDetail + examId,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}

export function getExamRecordDetail (recordId) {
  return axios({
    url: api.recordDetail + recordId,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}

export function getQuestionDetail (questionId, questionType) {
  return axios({
    url: api.QuestionDetail + questionType + '/' + questionId,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}

export function getSubDetail (examId) {
  return axios({
    url: api.SubDetail + examId,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}

export function finishExam (examId, answersMap) {
  console.log(answersMap)
  return axios({
    url: api.FinishExam + examId,
    method: 'post',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    },
    data: answersMap
  })
}

export function finishSub (recordId, subMap) {
  console.log(subMap)
  return axios({
    url: api.FinishSub + recordId,
    method: 'post',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    },
    data: subMap
  })
}

export function getExamRecordList () {
  return axios({
    url: api.ExamRecordList,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}
