import React from 'react'
import BreadcrumbCustom from '@components/BreadcrumbCustom'
import { Form } from 'antd';
import {Row,Col,Select,Input,Table,Icon,Divider,Button,Modal,message} from 'antd'
const Option = Select.Option;
const Search = Input.Search;
const FormItem = Form.Item;
const confirm = Modal.confirm;

import httpServer from '@components/httpServer.js';
import { connect } from 'react-redux'
import * as URL from '@components/interfaceURL.js'
import axios from "axios";
import {examport} from "../../../constants/webport";
import {getJwtToken} from "../../../lib/utils";

class QueryQuestions extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      type:'select',
      render:'select',
      data:[],
    }
  }

  componentWillMount(){
    axios.post(examport+'/select/list',{},{
      headers:{
        "Authorization":getJwtToken()
      }
    }).then(response=>{
      const {data} = response.data.data;
      this.setState({
        data: data
      });
    })
  }

  //搜索类型选择
  handleChange(value) {
    //console.log(`selected ${value}`);
    this.setState({
      type: value,
    });
  }

  renderTableWithType(){
    const {type,data} = this.state;

    if (type === 'select'){
      return <Table columns={selectColumns} dataSource={data}/>
    }


  }

  render(){

    const columns = [
        {
      title: '编号',
      dataIndex: 'className',
      key: 'className',
    },
      {
      title: '科目',
      dataIndex: 'subjectName',
      key: 'subjectName',
    },
      {
      title: '创建时间',
      dataIndex: 'statusName',
      key: 'statusName',
    },
      {
      title: '创建时间',
      dataIndex: 'statusName',
      key: 'statusName',
    },
      {
      title: '创建时间',
      dataIndex: 'statusName',
      key: 'statusName',
    },
      {
      title: '操作',
      key: 'action',
      render: (text, record) => (
          <span>
          <Button type="danger" size="small" onClick={this.deleteClass.bind(this,record)}>删除</Button>
          <Divider type="vertical" />
          <Button size="small" onClick={this.changeClass.bind(this,record)}>修改</Button>
        </span>
      ),
    }];

    const {render,data} = this.state;
    return(
        <div>
          <BreadcrumbCustom pathList={['题库管理','试题管理']}></BreadcrumbCustom>
          <div className="score-search-content">
            <Row>
              <Col span={24}>
                <Search
                    className="f-r"
                    placeholder="请输入关键字"
                    onSearch={value => {
                      //console.log(value);
                      axios.post(examport+'/exam/getDataList?type='+this.state.type+'&value='+value,{},{
                        headers:{
                          "Authorization":getJwtToken()
                        }
                      }).then(response=>{
                        const {data} = response.data.data;
                        console.log(data);
                        this.setState({
                          data: data,
                          render: this.state.type,
                        });
                      })
                    }}
                    enterButton
                    style={{ width: 200 }}
                />
                <Select className="f-r m-r-20" defaultValue="select" style={{ width: 120 }} onChange={this.handleChange.bind(this)}>
                  <Option value="select">单选</Option>
                  <Option value="multiple">多选</Option>
                  <Option value="judge">判断</Option>
                  <Option value="input">填空</Option>
                  <Option value="shortAnswer">简答</Option>
                  <Option value="program">程序</Option>
                </Select>
              </Col>
            </Row>
            <div className="m-t-20">
              {
                (render==='select')?<Table columns={selectColumns} dataSource={data}/>:null
              }
              {
                (render==='multiple')?<Table columns={multipleColumns} dataSource={data}/>:null
              }
              {
                (render==='judge')?<Table columns={judgeColumns} dataSource={data}/>:null
              }
              {
                (render==='input')?<Table columns={inputColumns} dataSource={data}/>:null
              }
              {
                (render==='shortAnswer')?<Table columns={shortAnswerColumns} dataSource={data}/>:null
              }
              {
                (render==='program')?<Table columns={programColumns} dataSource={data}/>:null
              }
            </div>

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
)(Form.create()(QueryQuestions))

const selectColumns = [
  {
    title: '编号',
    dataIndex: 'sqId',
    key: 'sqId',
  },
  {
    title: '类型',
    dataIndex: 'sqSubject',
    key: 'sqSubject',
  },
  {
    title: '题目',
    dataIndex: 'sqQuestion',
    key: 'sqQuestion',
  },
  {
    title: '创建时间',
    dataIndex: 'createTime',
    key: 'createTime',
  }
]

const multipleColumns = [
  {
    title: '编号',
    dataIndex: 'mqId',
    key: 'mqId',
  },
  {
    title: '类型',
    dataIndex: 'mqSubject',
    key: 'mqSubject',
  },
  {
    title: '题目',
    dataIndex: 'mqQuestion',
    key: 'mqQuestion',
  },
  {
    title: '创建时间',
    dataIndex: 'createTime',
    key: 'createTime',
  }
]

const judgeColumns = [
  {
    title: '编号',
    dataIndex: 'jqId',
    key: 'jqId',
  },
  {
    title: '类型',
    dataIndex: 'jqSubject',
    key: 'jqSubject',
  },
  {
    title: '题目',
    dataIndex: 'jqQuestion',
    key: 'jqQuestion',
  },
  {
    title: '创建时间',
    dataIndex: 'createTime',
    key: 'createTime',
  }
]

const inputColumns = [
  {
    title: '编号',
    dataIndex: 'iqId',
    key: 'iqId',
  },
  {
    title: '类型',
    dataIndex: 'iqSubject',
    key: 'iqSubject',
  },
  {
    title: '题目',
    dataIndex: 'iqQuestion',
    key: 'iqQuestion',
  },
  {
    title: '创建时间',
    dataIndex: 'createTime',
    key: 'createTime',
  }
]

const shortAnswerColumns = [
  {
    title: '编号',
    dataIndex: 'saqId',
    key: 'saqId',
  },
  {
    title: '类型',
    dataIndex: 'saqSubject',
    key: 'saqSubject',
  },
  {
    title: '题目',
    dataIndex: 'saqQuestion',
    key: 'saqQuestion',
  },
  {
    title: '创建时间',
    dataIndex: 'createTime',
    key: 'createTime',
  }
]

const programColumns = [
  {
    title: '编号',
    dataIndex: 'pqId',
    key: 'pqId',
  },
  {
    title: '类型',
    dataIndex: 'pqSubject',
    key: 'pqSubject',
  },
  {
    title: '题目',
    dataIndex: 'pqQuestion',
    key: 'pqQuestion',
  },
  {
    title: '创建时间',
    dataIndex: 'createTime',
    key: 'createTime',
  }
]



