import React from 'react'
import BreadcrumbCustom from '@components/BreadcrumbCustom'
import {Row, Col, Select, Input, Table, Icon, Divider, Button, Modal, Form, notification} from 'antd'
const Option = Select.Option;
const Search = Input.Search;
const FormItem = Form.Item;
const confirm = Modal.confirm;

//路由组件
import { Link } from 'react-router-dom';
import {withRouter} from "react-router-dom";

import httpServer from '@components/httpServer.js';
import * as URL from '@components/interfaceURL.js'
import axios from "axios";
import {examport} from "../../../constants/webport";
import {getJwtToken} from "../../../lib/utils";


class ScoringPaper extends React.Component {
  constructor(){
    super()
    this.state = {
      data : [],
      pagination : {
        pageSize : 10,
        current : 1,
        total : 0,
        defaultCurrent : 1,
      },
      visibleChangeModal : false,
      curPaperInfo : {}
    }
    this.searchKey = "1";
    this.turnStatus = "NORMAL"; //NORMAL:正常翻页   SEARCH:搜索翻页
    this.searchContent = ""; //搜索内容
  }

  //搜索类型
  handleChange(value) {
    this.searchKey = value;
  }

  //点击搜索
  searchPapers(value) {
    if(value == "") {
      Modal.error({
        content: "搜索内容不能为空！",
        okText : '确定'
      });
      return;
    }
    this.turnStatus = "SEARCH";//把翻页状态置为搜索
    this.state.pagination.current = 1;//当前页置为第一页
    this.setState({pagination : this.state.pagination});
    this.searchContent = value;
    this.getSearchData();
  }

  //选择某一行
  onSelectChange(selectedRowKeys) {
    console.log('selectedRowKeys changed: ', selectedRowKeys);
    this.setState({ selectedRowKeys });
  }

  componentWillMount(){
    axios.post(examport+'/exam/list',{},{
      headers:{
        "Authorization":getJwtToken()
      }
    }).then(response=>{
      const {message} = response.data;
      const {list} = response.data.data;
      if (message==='Info'){
        notification['info']({
          message: '认证失败',
          description: '您的认证信息已经失效，请重新登录。',
        })
      }else{
        this.setState({data:list})
      }

    })
  }

  //取消设置老师
  setCancel(){
    this.setState({visibleChangeModal:false})
  }

  //点击设置老师按钮
  setTeacherBtn(i){
    this.state.curPaperInfo = this.state.data[i];
    this.setState({curPaperInfo : this.state.curPaperInfo});
    const {form}=this.props;
    form.setFieldsValue({'managerId': ''});
    this.setState({visibleChangeModal:true})
  }

  //点击开始阅卷按钮
  beginScoring(i){
    this.state.curPaperInfo = this.state.data[i];
    this.setState({curPaperInfo : this.state.curPaperInfo});


    /*httpServer({
      url : URL.auto_read
    },{
      className : 'StuExamBatchImpl',
      classId : this.state.curPaperInfo.classId,
      paperId : this.state.curPaperInfo.paperId,
    })*/



    this.props.history.push("/main/paper_manage/scoring/all_papers/"+this.state.curPaperInfo.paperId+"/"+this.state.curPaperInfo.classId+"/"+this.state.data[i].managerList[0].managerId);//react-router 4.0 写法
  }

  //确认修改
  setTeacherOk(){
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {


        /*httpServer({
          url : URL.set_teacher
        },{
          className : "SetExamManagerIdImpl",
          classId : this.state.curPaperInfo.classId,
          paperId : this.state.curPaperInfo.paperId,
          managerId : values.managerId,
        })
        .then((res)=>{
          this.state.curPaperInfo.isSetTeacher = true;
          this.setState({curPaperInfo : this.state.curPaperInfo});
          if(this.turnStatus === "NORMAL") {
            this.getPageDate();
          }
          else {
            this.getSearchData();
          }
        })
        this.setState({visibleChangeModal:false})*/



      }
    });
  }

  //点击展示所有试卷
  showAllPapers(){
    //this.getPageDate();
  }

  render(){
    const { getFieldDecorator } = this.props.form;

    let localeObj = {
      emptyText: '暂无数据'
    }

    const columns = [{
      title: '编号',
      dataIndex: 'examId',
      key: 'examId',
    }, {
      title: '科目',
      dataIndex: 'examSource',
      key: 'examSource',
    }, {
      title: '考试时间',
      dataIndex: 'examDate',
      key: 'examDate',
    }, {
      title: '阅卷',
      key: 'action1',
      render: (text, record) => (
        <span>
          {
            //record.isSetTeacher ?
            <Button type="primary" size="small" onClick={()=> {
              console.log(record)
              const {examId, clazzId, paperId} = record;
              this.props.history.push('/main/paper_manage/scoring/all_papers/'+paperId+"/"+clazzId+"/"+examId)
            }}>开始阅卷</Button>
            //:<Button type="primary" disabled size="small">开始阅卷</Button>
          }
        </span>
      ),
    }];

    //教师列表
    let teacherArr = [];
    if(this.state.curPaperInfo.managerList) {
      teacherArr = this.state.curPaperInfo.managerList.map((item)=>{
        return (
          <Option value={item.managerId} key={item.managerId}>{item.name}</Option>
        )
      })
    }

    return(
      <div>
        <BreadcrumbCustom pathList={['考试管理',['在线阅卷']]}></BreadcrumbCustom>
        <div className="scoring-paper-content">
          <div className="m-b-20">
            <Row>
              <Col span={24}>
                <Search
                  className="f-r"
                  placeholder="请输入关键字"
                  onSearch={this.searchPapers.bind(this)}
                  enterButton
                  style={{ width: 200 }}
                />
                <Select className="f-r m-r-20" defaultValue="1" style={{ width: 120 }} onChange={this.handleChange.bind(this)}>
                  <Option value="1">班级</Option>
                  <Option value="2">科目</Option>
                  <Option value="3">考试时间</Option>
                  <Option value="4">阅卷老师</Option>
                </Select>
                <Button type="primary" className="f-l" onClick={this.showAllPapers.bind(this)}>所有试卷</Button>
              </Col>
            </Row>
          </div>
          <Table
            // rowSelection={rowSelection}
            columns={columns}
            dataSource={this.state.data}
            pagination={this.state.pagination}
            locale={localeObj}
            //onChange={this.handleTableChange.bind(this)}
          />
        </div>
        <Modal
          title="设置老师"
          visible={this.state.visibleChangeModal}
          footer={null}
          onCancel={this.setCancel.bind(this)}
        >
          <Form onSubmit={this.setTeacherOk.bind(this)}>
            <Row>
              <Col span="12" offset="6">
                <div className="m-b-20">
                  <FormItem>
                      {getFieldDecorator('managerId',{
                        rules: [{ required: true, message: '请选择阅卷老师！' }],
                      })(
                        <Select style={{ width: '100%' }}>
                          {teacherArr}
                        </Select>
                      )}
                  </FormItem>
                </div>
              </Col>
            </Row>
            <Row>
              <Col span="24">
                <Button type="primary" className="f-r" htmlType="submit">
                  确定
                </Button>
                <Button type="primary" className="f-r m-r-20" onClick={this.setCancel.bind(this)}>
                  取消
                </Button>
              </Col>
            </Row>
          </Form>
        </Modal>
      </div>
    )
  }
}
// export default Form.create()(ScoringPaper)
export default withRouter(Form.create()(ScoringPaper));
