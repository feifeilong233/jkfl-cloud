import React from 'react'
import BreadcrumbCustom from '@components/BreadcrumbCustom'

import {Row, Col, Select, Input, Table, Icon, Divider, Button, Card, Tag, Modal, notification} from 'antd'
const Option = Select.Option;
const Search = Input.Search;

import {Link} from 'react-router-dom'
import {withRouter} from "react-router-dom";

import ReadingCard from './subpage/reading_card'
import httpServer from '@components/httpServer.js'
import * as URL from '@components/interfaceURL.js'
import axios from "axios";
import {examport} from "../../../constants/webport";
import {getJwtToken} from "../../../lib/utils";

class ReadingPaper extends React.Component {
  constructor(){
    super()
    this.state = {
      fillInList : [],
      shortAnswerList : [],
      programList : [],
    }
    this.gapscorelist = [];
    this.shoscorelist = [];
    this.proscorelist = [];
    this.totalScore = 0;
  }

  getStuAnswer(instId){
    httpServer({
      url : URL.get_stu_answer
    },{
      className : 'GetQuestionStuAnswerImpl',
      instId : instId,
    })
    .then((res)=>{
      let respDate = res.data.data;
      let fillInList =[];
      let shortAnswerList=[];
      let programList=[];
      for(let i=0;i<respDate.length;i++) {
        if(respDate[i].type == '1') { //填空题
          fillInList.push(respDate[i]);
        }
        else if(respDate[i].type == '5') { //简答题
          shortAnswerList.push(respDate[i]);
        }
        else if(respDate[i].type == '6') {//编程题
          programList.push(respDate[i]);
        }
      }
      this.gapscorelist.length = fillInList.length;
      this.shoscorelist.length = shortAnswerList.length;
      this.proscorelist.length = programList.length;
      this.setState({
        fillInList : fillInList,
        shortAnswerList : shortAnswerList,
        programList : programList,
      })
    })
  }

  //老师打分框框改变
  scoreChange(i,value,type){
    if(type === '4') { //填空题
      this.gapscorelist[i] = value;
      //console.log('input',this.gapscorelist)
    }
    else if(type === '5') { //简答题
      this.shoscorelist[i] = value;
      //console.log('short',this.shoscorelist)
    }
    else if(type === '6') {//编程题
      this.proscorelist[i] = value;
      //console.log('program',this.proscorelist)
    }
  }

  handleSumbitTotal(totalScore) {
    const {paperId, classId, examId, pid} = this.props.match.params;
    axios.post(examport + '/read/updateSubScore?pid=' + pid + '&total=' + totalScore, {}, {
      headers: {
        "Authorization": getJwtToken()
      }
    }).then(response => {
      const {message} = response.data;

      if (message === 'None') {
        notification['warning']({
          message: '认证失败',
          description:
              '您的登陆信息已经失效，请重新登陆。',
        });
      }

      if (message === 'Success') {
        notification['success']({
          message: '添加成功',
          description: '主观题分数已添加',
        })
      }

      if (message === 'Fail') {
        notification['error']({
          message: '添加失败',
          description: '阅卷提交失败，请检查网络设置并稍后重试。',
        })
      }

      this.props.history.push(`/main/paper_manage/scoring/all_papers/${paperId}/${classId}`);
    })

  }

  //提交
  submitScore(){

    //总分
    let totalScore = 0;
    let flag = false;
    let jump = false;
    for(let i = 0;i<this.gapscorelist.length;i++) {
      if(typeof this.gapscorelist[i] == "undefined") {
        flag = true;
        this.gapscorelist[i] = 0;
      }
      totalScore += parseInt(this.gapscorelist[i]);
    }

    for(let i = 0;i<this.shoscorelist.length;i++) {
      if(typeof this.shoscorelist[i] == "undefined") {
        flag = true;
        this.shoscorelist[i] = 0;
      }
      totalScore += parseInt(this.shoscorelist[i]);
    }

    for(let i = 0;i<this.proscorelist.length;i++) {
      if(typeof this.proscorelist[i] == "undefined") {
        flag = true;
        this.proscorelist[i] = 0;
      }
      totalScore += parseInt(this.proscorelist[i]);
    }

    if(flag) {
      Modal.warning({
        title: '您有题目还没有评分，请评分后再提交',
        okText : '确定'
      });
      return;
    }else{
      Modal.confirm({
        title:'提交确认',
        content: `主观题评分${totalScore}，您确定提交吗？`,
        okText:'提交',
        cancelText:"取消",
        onOk: this.handleSumbitTotal.bind(this, totalScore)
      })
    }
  }

  handleCancel(){}

  componentWillMount(){
    const {paperId, classId, examId, pid} = this.props.match.params;

    axios.post(examport+'/read/readSinglePaper?pid='+pid,{},{
      headers:{
        "Authorization":getJwtToken()
      }
    }).then(response=>{
      const {data} = response.data.data;
   /*   console.log('data',data)*/

      const ia = [], saa = [], pa = [];
      //ids存放的对应题目的id+answer
      const ids = data.examInputAnswer.split(`\$\$`)
      ids.map((item, _)=>{
        const f = item.split('__');
        const obj = {
          iqId: f[0],
          iqAnswer: f[1],
        }
        ia.push(obj);
      })

      const ids1 = data.examShortAnswer.split(`\$\$`)
      ids1.map((item, _)=>{
        const f = item.split('__');
        const obj = {
          saqId: f[0],
          saqAnswer: f[1],
        }
        saa.push(obj);
      })

      const ids2 = data.examProgramAnswer.split(`\$\$`)
      ids2.map((item, _)=>{
        const f = item.split('__');
        const obj = {
          pqId: f[0],
          pqAnswer: f[1],
        }
        pa.push(obj);
      })

      //console.log(data)
      this.setState({
        inputAnswer: ia,
        shortAnswerAnswer: saa,
        programAnswer: pa,
      })
    })

    axios.post(examport+'/paper/getReadList?id='+paperId,{},{
      headers:{
        "Authorization":getJwtToken()
      }
    }).then(response=>{
      const {data} = response.data;
   /*   console.log(data)*/
      this.setState({
        fillInList : data.input,
        shortAnswerList : data.shortAnswer,
        programList : data.program,
      })
    })




  }

  render(){
    return(
      <div>
        <BreadcrumbCustom pathList={['考试管理','在线阅卷','所有试卷','正在阅卷']}></BreadcrumbCustom>
        <div className="reading-paper-content">
          <Row>
            <Button type="primary" className="f-r m-b-20"><Link to={`/main/paper_manage/scoring/all_papers/${this.props.match.params.paperId}/${this.props.match.params.classId}/${this.props.match.params.examId}`}><Icon type="left" />返回</Link></Button>
          </Row>
          <div className="paper">
            <div className="m-b-20">
              <ReadingCard title="填空题" scoreChange={this.scoreChange.bind(this)} questionList={this.state.fillInList} answerList={this.state.inputAnswer}></ReadingCard>
            </div>
            <div className="m-b-20">
              <ReadingCard title="简答题" scoreChange={this.scoreChange.bind(this)} questionList={this.state.shortAnswerList} answerList={this.state.shortAnswerAnswer}></ReadingCard>
            </div>
            <ReadingCard title="程序题" scoreChange={this.scoreChange.bind(this)} questionList={this.state.programList} answerList={this.state.programAnswer}></ReadingCard>
            <div className="m-t-20 clearfix">
              <Button type="primary" className="f-r" onClick={this.submitScore.bind(this)}>提交</Button>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default withRouter(ReadingPaper);
