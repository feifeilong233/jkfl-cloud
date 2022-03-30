import React from 'react'

import {Form, Input, Select, Row, Col, Button, notification} from 'antd';
const FormItem = Form.Item;
const Option = Select.Option;

import BreadcrumbCustom from '@components/BreadcrumbCustom'
import { connect } from 'react-redux'
import httpServer from '@components/httpServer.js'
import * as URL from '@components/interfaceURL.js'
import axios from "axios";
import {userport} from "../../../constants/webport";
import {getJwtToken} from "../../../lib/utils";

class AddStudent extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      pathList : ['学生管理','添加学生'],//面包屑路径
    }
  }

  componentWillMount() {
    axios.post(userport+'/class/getClassList',{},{
      headers:{
        "Authorization":getJwtToken()
      }
    }).then(response=>{
      const {data} = response.data.data;
      this.setState({
        classData: data
      });
    })
  }

  //选择班级
  handleChange(value) {
    //console.log(`selected ${value}`);
    this.setState({
      value: value
    });
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.form.validateFields((err, values) => {
      if (!err) {
        axios.post(userport + '/class/addStu?value=' + this.state.value + '&text=' + this.state.text, {}, {
          headers: {
            "Authorization": getJwtToken()
          }
        })
            .then(response => {
              const {message} = response.data;
              //console.log('message',message);

              if (message === 'None') {
                notification['warning']({
                  message: '未找到对应学生',
                  description:
                      '未能找到对应学生，请检查学生姓名拼写是否正确。',
                });
              }

              if (message === 'Success') {
                notification['success']({
                  message: '添加成功',
                  description: '该学生已加入班级',
                })
              }

              if (message === 'Fail') {
                notification['error']({
                  message: '添加失败',
                  description: '学生添加失败，请检查网络设置并稍后重试。',
                })
              }

              if (message === 'Have') {
                notification['info']({
                  message: '该学生存在班级',
                  description: '此学生已经加入了班级，请联系该学生或后台管理进行操作。',
                })
              }

            })
      }

    })
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

    //科目信息
    let classtArr = [];
    if(this.state.classData) {
      classtArr = this.state.classData.map((item, _) => {
        return (
            <Option value={item.className} key={item.classId}>{item.className}</Option>
        )
      })
    }

    return(
      <div>
        <BreadcrumbCustom pathList={this.state.pathList}></BreadcrumbCustom>
        <div className="add-student-content">
          <Form onSubmit={this.handleSubmit.bind(this)}>
            <FormItem
              {...formItemLayout}
              label="姓名"
            >
              {getFieldDecorator('name',{
                rules: [{ required: true, message: '请输入姓名！' }],
              })(
                <Input onChange={(e)=>{
                  this.setState({
                    text:e.target.value
                  });
                }}/>
              )}
            </FormItem>
            <FormItem
              {...formItemLayout}
              label="班级"
              key = "subject"
            >
              {getFieldDecorator('class',{
                rules: [{ required: true, message: '请选择班级！' }],
              })(
                <Select style={{ width: '100%' }} onChange={this.handleChange.bind(this)}>
                  {classtArr}
                </Select>
              )}
            </FormItem>
            <Row>
              <Col span={12} offset={4}>
                <Button type="primary" htmlType="submit" className="f-r">添加</Button>
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
)(Form.create()(AddStudent))
