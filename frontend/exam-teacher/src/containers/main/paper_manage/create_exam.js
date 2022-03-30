import React from 'react'

import {Form, Input, Select, Row, Col, Button, DatePicker, notification} from 'antd';
const FormItem = Form.Item;
const Option = Select.Option;

import { connect } from 'react-redux'

import BreadcrumbCustom from '@components/BreadcrumbCustom'
import httpServer from '@components/httpServer.js'
import * as URL from '@components/interfaceURL.js'

import moment from 'moment';
import 'moment/locale/zh-cn';
import axios from "axios";
import {examport, userport} from "../../../constants/webport";
import {getJwtToken} from "../../../lib/utils";
import TextArea from "antd/es/input/TextArea";
moment.locale('zh-cn');

class CreateExam extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      pathList : ['考试管理','创建考试'],//面包屑路径
      classId : 0,
      levelId : 0,
      paperIdList : [],
      classData:[],
      paperData:[],
      description:'模拟考试，请认真对待',
      tips:'请将与考试无关物品上交，一旦查到按违规处理。'
    }
    this.havePaperName = 0;
  }

  componentWillMount() {
    axios.post(examport+'/exam/createExamList',{},{
      headers:{
        "Authorization":getJwtToken()
      }
    }).then(response=>{
      const {data} = response.data.data;
      console.log(response)
      this.setState({
        classData: data
      });
    })

    axios.post(examport+'/exam/getPaperLook',{},{}).then(response=>{
      const {data} = response.data.data;
      this.setState({
        paperData: data
      });
    })
  }

  //选择班级
  handleChange(value) {
    //console.log('select',value)
    this.setState({
      classId: value
    });
  }

  bindPaperChange(value){
    //console.log('paper',value)
    this.setState({
      paperId: value
    });
  }

  //选择等级
  changeLevel(value){
    //console.log('level',value)
    this.setState({
      examType: value
    });
  }

  //表单提交
  handleSubmit(e) {
    e.preventDefault();
    this.props.form.validateFields((err, values) => {
      if (!err) {
        axios.post(examport+'/exam/createOneExam',{
          id: this.state.classId,
          examType: this.state.examType,
          paperId: this.state.paperId,
          examDescription: this.state.description,
          examTips: this.state.tips,
          beginTime: values.startTime.format('YYYY-MM-DD HH:mm:ss'),
          endTime: values.endTime.format('YYYY-MM-DD HH:mm:ss'),
        },{
          headers:{
            "Authorization":getJwtToken()
          }
        }).then(response=>{
          const {message} = response.data;
          //console.log(message);

          if (message==='Info'){
            notification['info']({
              message: '认证失败',
              description: '您的认证信息已经失效，请重新登录。',
            })
          }

          if (message==='Success'){
            notification['success']({
              message: '添加成功',
              description: '考试已添加，请通知考生注意考试信息。',
            })
          }

          if (message==='Fail'){
            notification['error']({
              message: '添加失败',
              description: '考试添加失败，请稍后重试。',
            })
          }

        })


      }
    });
  }

  render(){
    const { getFieldDecorator } = this.props.form;
    //表单布局
    const formItemLayout = {
      labelCol: {
        xs: { span: 24 },
        sm: { span: 4 , offset : 4},
      },
      wrapperCol: {
        xs: { span: 24 },
        sm: { span: 8 },
      },
    };

    /**
     * 班级寸的时班级的id
     * */
    //班级信息
    let classtArr = [];
    if(this.state.classData) {
      classtArr = this.state.classData.map((item, _) => {
        return (
            <Option value={item.id} key={item.id}>{item.className}</Option>
        )
      })
    }

    /**
     * paper存的是试卷的Name,
     * 存id导致精度丢失
     * */
    let paperArr = [];
    if(this.state.paperData) {
      paperArr = this.state.paperData.map((item, _) => {
        return (
            <Option value={item.paperLookTitle} key={item.paperLookTitle}>{item.paperLookTitle}</Option>
        )
      })
    }

    //试卷编号
    let paperIdList = [];
    paperIdList = this.state.paperIdList.map((item)=>{
      return(
        <Option value={item} key={item}>{item}</Option>
      )
    })

    return(
      <div>
        <BreadcrumbCustom pathList={this.state.pathList}></BreadcrumbCustom>
        <div className="change-password-content">
          <Form onSubmit={this.handleSubmit.bind(this)}>
            <FormItem
              {...formItemLayout}
              label="班级"
            >
              {getFieldDecorator('classId')(
                <Select style={{ width: '100%' }} onChange={this.handleChange.bind(this)}>
                  {classtArr}
                </Select>
              )}

            </FormItem>
            <FormItem
              {...formItemLayout}
              label="考试名称"
            >
              {getFieldDecorator('examName')(
                  <Select style={{ width: '100%' }} onChange={this.bindPaperChange.bind(this)}>
                    {paperArr}
                  </Select>
              )}
            </FormItem>
            <FormItem
              {...formItemLayout}
              label="级别"
            >
              {getFieldDecorator('level')(
                <Select style={{ width: '100%' }} onChange={this.changeLevel.bind(this)}>
                  <Option value={'ez'}>初级</Option>
                  <Option value={'nr'}>中级</Option>
                  <Option value={'hd'}>高级</Option>
                </Select>
              )}
            </FormItem>

            <FormItem
              {...formItemLayout}
              label="开始时间"
            >
              {getFieldDecorator('startTime')(
                <DatePicker
                  showTime
                  format="YYYY-MM-DD HH:mm:ss"
                  placeholder="选择时间"
                  style={{width:'100%'}}
                />
              )}
            </FormItem>
            <FormItem
              {...formItemLayout}
              label="结束时间"
            >
              {getFieldDecorator('endTime')(
                <DatePicker
                  showTime
                  format="YYYY-MM-DD HH:mm:ss"
                  placeholder="选择时间"
                  style={{width:'100%'}}
                />
              )}
            </FormItem>
            <FormItem
                {...formItemLayout}
                label="考试描述"
            >
              <TextArea onChange={(e)=>this.setState({description: e.target.value})}/>
            </FormItem>
            <FormItem
                {...formItemLayout}
                label="注意事项"
            >
              <TextArea onChange={(e)=>this.setState({tips: e.target.value})}/>
            </FormItem>
            <Row>
              <Col span={12} offset={4}>
                <Button type="primary" htmlType="submit" className="f-r">确定</Button>
              </Col>
            </Row>
          </Form>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
    return {
        classinfo: state.classinfo
    }
}

export default connect(
    mapStateToProps
)(Form.create()(CreateExam))
