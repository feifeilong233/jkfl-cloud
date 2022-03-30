import React from 'react'
import BreadcrumbCustom from '@components/BreadcrumbCustom'
import { Form,Input,Select,Icon,Radio,Row,Col,Button,message,InputNumber,Card,DatePicker,Modal} from 'antd';
const FormItem = Form.Item;
const Option = Select.Option;
const { TextArea } = Input;
const RadioGroup = Radio.Group;

import moment from 'moment';
import 'moment/locale/zh-cn';
moment.locale('zh-cn');

import { connect } from 'react-redux'

import ChooseCard from './subpage/choose_card'

import httpServer from '@components/httpServer.js'
import * as URL from '@components/interfaceURL.js'
import axios from "axios";
import {examport, paperId} from "../../../constants/webport";
import {getJwtToken} from "../../../lib/utils";
import {data} from "autoprefixer";
const { RangePicker } = DatePicker;

class ChooseQuestions extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      title: '计算机模拟试卷',
      pathList : ['试卷管理', '出卷'],
      localCounter : 0,
      ChooseQuestionList :[{//出卷列表
        "score": 2,
        "num" : 0,
        "questionType": 1,  //选择
        "knowledgePointInfo": []
      },{
        "score": 4,
        "num" : 0,
        "questionType": 2,  //多选
        "knowledgePointInfo": []
      },{
        "score": 2,
        "num" : 0,
        "questionType": 3,  //判断
        "knowledgePointInfo": []
      },{
        "score": 3,
        "num" : 0,
        "questionType": 4,  //填空
        "knowledgePointInfo": []
      },{
        "score": 10,
        "num" : 0,
        "questionType": 5,  //简答
        "knowledgePointInfo": []
      },{
        "score": 10,
        "num" : 0,
        "questionType": 6,  //程序
        "knowledgePointInfo": []
      }],
      knowledgePointInfo : [] //知识点列表
    }
    this.subjectId = -1;
    this.gradeId = -1;
  }

  //发送出卷请求
  sendChooseQuestion(sendObj){
    /*httpServer({
      url : URL.paper_info
    },sendObj)*/

    console.log(sendObj)
    axios.post(examport+'/item/create',{
      selectList: sendObj.SelectList,
      inputList: sendObj.InputList,
      judgeList: sendObj.JudgeList,
      multipleList: sendObj.MultipleList,
      shortAnswerList: sendObj.ShortAnswerList,
      programList: sendObj.ProgramList,
      title: this.state.title,
      total: sendObj.total,
      time: sendObj.time,
    },{
      headers:{
        "Authorization":getJwtToken()
      }
    })

  }

  //提交
  handleSubmit(e){
    e.preventDefault();

    let totalScore = 0;//这套试卷的总分

    let sendList = {
      SelectList: [],
      InputList: [],
      JudgeList: [],
      MultipleList: [],
      ShortAnswerList: [],
      ProgramList: [],
      paperId: 1,
      total: 0,
      time: this.state.time,
    }

    //整合出题信息
    this.state.ChooseQuestionList.forEach((item,_)=>{//循环每种类型的题目

      if(item.num > 0) {
        //console.log(_,item)
        const {questionType, knowledgePointInfo} = item;
        let countTotal = 0;

        //循环每个知识点
        /** 单选 = 1 */
        if (questionType === 1) {
          knowledgePointInfo.forEach((_item, _index) => {
            const obj = {
              sqSubject: _item.knowledge,
              sqNumber: _item.count,
            }
            sendList.SelectList.push(obj);
            countTotal += _item.count;
          })
        }


        /** 多选 = 2 */
        if (questionType === 2) {
          knowledgePointInfo.forEach((_item, _index) => {
            const obj = {
              mqSubject: _item.knowledge,
              mqNumber: _item.count,
            }
            sendList.MultipleList.push(obj);
            countTotal += _item.count;
          })
        }


        /** 判断 = 3 */
        if (questionType === 3) {
          knowledgePointInfo.forEach((_item, _index) => {
            const obj = {
              jqSubject: _item.knowledge,
              jqNumber: _item.count,
            }
            sendList.JudgeList.push(obj);
            countTotal += _item.count;
          })
        }


        /** 填空 = 4 */
        if (questionType === 4) {
          knowledgePointInfo.forEach((_item, _index) => {
            const obj = {
              iqSubject: _item.knowledge,
              iqNumber: _item.count,
            }
            sendList.InputList.push(obj);
            countTotal += _item.count;
          })
        }


        /** 简答 = 5 */
        if (questionType === 5) {
          knowledgePointInfo.forEach((_item, _index) => {
            const obj = {
              saqSubject: _item.knowledge,
              saqNumber: _item.count,
            }
            sendList.ShortAnswerList.push(obj);
            countTotal += _item.count;
          })
        }


        /** 程序 = 6 */
        if (questionType === 6) {
          knowledgePointInfo.forEach((_item, _index) => {
            const obj = {
              pgSubject: _item.knowledge,
              pgNumber: _item.count,
            }
            sendList.ProgramList.push(obj);
            countTotal += _item.count;
          })
        }

        totalScore += countTotal * item.score;
      }
    })

    sendList.total = totalScore;
    if(totalScore !== 100) {//总分不是100
      Modal.confirm({
        title: '提示',
        content: '这套试卷的总分是'+totalScore+"分,你确定提交吗？",
        okText: '确认',
        cancelText: '取消',
        onOk: ()=>{
          //用户点击确认
          //console.log(sendList)
          this.sendChooseQuestion(sendList);
        },
      });
    }
    else {//总分是100
      this.sendChooseQuestion(sendList);
    }
    // console.log(sendOutObj)

    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        // console.log('Received values of form: ', values);
      }
    });
  }

  getKnowledgePoint(){
    //获取知识点
    axios.post(examport+'/exam/knowledge_point',{},{
      headers:{
        "Authorization":getJwtToken()
      }
    }).then(response=>{
      const {data} = response.data.data;
      this.state.knowledgePointInfo = data;
      this.setState({knowledgePointInfo : this.state.knowledgePointInfo});
    })

  }

  //选择科目
  subjectChange(e){
    this.setState({
      title: e.target.value,
    });
  }

  //选择等级
  gradeChange(value){
    this.gradeId = value;
    //科目和等级都已经选择
    if(this.gradeId >=0) {

        this.getKnowledgePoint();
    }
  }

  bindExamTimeChange(e){
    this.setState({
      time: e.target.value
    })
  }

  render(){
    //验证
    const { getFieldDecorator } = this.props.form;

    //表单项布局
    const formItemLayout = {
      labelCol: {
        sm: { span: 12 },
      },
      wrapperCol: {
        sm: { span: 12 },
      },
    };

    const formItemLayoutTop = {
      labelCol: {
        sm: { span: 24 },
        md: { span: 6 }
      },
      wrapperCol: {
        sm: { span: 24 },
        md: { span: 18 }
      },
    }

    //科目信息
    let subjectArr = [];
    if(this.props.subjectinfo.subjectArr) {
      subjectArr = this.props.subjectinfo.subjectArr.map((item)=>{
        return (
          <Option value={item.subjectid} key={item.subjectid}>{item.subjectname}</Option>
        )
      })
    }

    return (
      <div>
        <BreadcrumbCustom pathList={this.state.pathList}></BreadcrumbCustom>
        <div className="choose-questions-content" style={{ background: '#F5F5F5', padding: '30px' }}>
          <Form onSubmit={this.handleSubmit.bind(this)} className="ant-advanced-search-form">
            <Row>
              <Col span={8}>
                <FormItem
                  label="科目"
                  {...formItemLayoutTop}
                >
                  {getFieldDecorator('subjectId')(
                    /*<Select style={{ width: 120 }} onChange={this.subjectChange.bind(this)}>
                      {subjectArr}
                    </Select>*/
                      <Input style={{width: 240}} onChange={this.subjectChange.bind(this)}/>
                  )}
                </FormItem>
              </Col>
              <Col span={8}>
                <FormItem
                  label="级别"
                  {...formItemLayoutTop}
                >
                  {getFieldDecorator('gradeId')(
                    <Select style={{ width: 120 }} onChange={this.gradeChange.bind(this)}>
                      <Option value="1">初级</Option>
                      <Option value="2">中级</Option>
                      <Option value="3">高级</Option>
                    </Select>
                  )}
                </FormItem>
              </Col>
              <Col span={8}>
                <FormItem
                    label="考试时间"
                    {...formItemLayoutTop}
                >
                  <Input onChange={this.bindExamTimeChange.bind(this)} style={{width:120}}/>
                </FormItem>
              </Col>
            </Row>
            <ChooseCard title="选择题" knowledgePointInfo={this.state.knowledgePointInfo} singleQuestion={this.state.ChooseQuestionList[0]}></ChooseCard>
            <ChooseCard title="多选题" knowledgePointInfo={this.state.knowledgePointInfo} singleQuestion={this.state.ChooseQuestionList[1]}></ChooseCard>
            <ChooseCard title="判断题" knowledgePointInfo={this.state.knowledgePointInfo} singleQuestion={this.state.ChooseQuestionList[2]}></ChooseCard>
            <ChooseCard title="填空题" knowledgePointInfo={this.state.knowledgePointInfo} singleQuestion={this.state.ChooseQuestionList[3]}></ChooseCard>
            <ChooseCard title="简答题" knowledgePointInfo={this.state.knowledgePointInfo} singleQuestion={this.state.ChooseQuestionList[4]}></ChooseCard>
            <ChooseCard title="程序题" knowledgePointInfo={this.state.knowledgePointInfo} singleQuestion={this.state.ChooseQuestionList[5]}></ChooseCard>

            <FormItem
            >
              <Row>
                  <Col span={22} style={{paddingRight : '24px'}}>
                    <Button type="primary" htmlType="submit" className="f-r">生成试卷</Button>
                  </Col>
              </Row>
            </FormItem>
          </Form>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
    return {
        subjectinfo: state.subjectinfo
    }
}

export default connect(
    mapStateToProps
)(Form.create()(ChooseQuestions))
