import React from 'react'
import BreadcrumbCustom from '@components/BreadcrumbCustom'
import { Form } from 'antd';
import {Row,Col,Select,Input,Table, Icon, Divider,Button,Modal,message} from 'antd'
const Option = Select.Option;
const Search = Input.Search;

import { connect } from 'react-redux'
import axios from "axios";
import {userport} from "../../../constants/webport";
import {getJwtToken} from "../../../lib/utils";

class QueryStudent extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      data : [],
      type:'stuName',
    }
    this.searchKey = "1";//默认按照班级搜索  1班级 2科目  3状态
    this.turnStatus = "NORMAL"; //NORMAL:正常翻页   SEARCH:搜索翻页
    this.searchContent = ""; //搜索内容
  }

  componentWillMount(){
    axios.post(userport+'/class/findStuListWithTea',{},{
      headers:{
        "Authorization":getJwtToken()
      }
    }).then(response=>{
      const {data} = response.data.data;
      this.fakeLook(data);
      this.setState({
        data: data
      });
      console.log(this.state.data);
    })
  }

  handleChange(value) {
    //console.log(`selected ${value}`);
    this.setState({
      type: value,
    });
  }

  fakeLook(data) {
    let arrObject = [
      {
        time:'2022-04-14 16:02:56',
        face:'通过',
        screen:'4',
        shot:'8',
        cheat:'7%'
      },
      {
        time:'2022-04-14 16:03:09',
        face:'通过',
        screen:'3',
        shot:'0',
        cheat:'0%'
      },
    ]
    data.map((item, index) =>{
      return Object.assign(item, arrObject[index])
    });
  }

  render(){
    return(
      <div>
        <BreadcrumbCustom pathList={['考试管理','监考','监考详情']}></BreadcrumbCustom>
        <div className="class-manage-content">
          <Row>
            <Col span={24}>
              <Search
                className="f-r"
                placeholder="请输入关键字"
                onSearch={value => {
                  axios.post(userport+'/class/getDataList?type='+ this.state.type+'&value='+value,{},{
                    headers:{
                      "Authorization":getJwtToken()
                    }
                  }).then(response=>{
                    const {data} = response.data.data;
                    console.log(data);
                    this.setState({
                      data: data,
                      //render: this.state.type,
                    });
                    this.fakeLook();
                  })
                }}
                enterButton
                style={{ width: 200 }}
              />
              <Select className="f-r m-r-20"
                      defaultValue="stuName"
                      style={{ width: 120 }}
                      onChange={this.handleChange.bind(this)}
              >
                <Option value="stuName">姓名</Option>
                <Option value="pid">学号</Option>
              </Select>
              <Button type="primary"
                      className="f-l"
                      onClick={()=>{
                        axios.post(userport+'/class/findStuListWithTea',{},{
                          headers:{
                            "Authorization":getJwtToken()
                          }
                        }).then(response=>{
                          const {data} = response.data.data;
                          this.setState({
                            data: data
                          });
                        })
                      }}
              >所有学生</Button>
            </Col>
          </Row>
          <div className="m-t-20">
            <Table
              columns={columns}
              dataSource={this.state.data}
            />
          </div>
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
)(Form.create()(QueryStudent))

const columns = [
  {
    title: '用户名',
    dataIndex: 'userName',
    key:'userName',
  },
  {
    title: '姓名',
    dataIndex: 'stuName',
    key: 'stuName',
  },
  {
    title: '学号',
    dataIndex: 'pid',
    key: 'pid',
  },
  {
    title: '电话',
    dataIndex: 'tel',
    key: 'tel',
  },
  {
    title: '进入时间',
    dataIndex: 'time',
    key: 'time',
  },
  {
    title: '人脸识别',
    dataIndex: 'face',
    key: 'face',
  },
  {
    title: '切屏次数',
    dataIndex: 'screen',
    key: 'screen',
  },
  {
    title: '识别异常次数',
    dataIndex: 'shot',
    key: 'shot',
  },
  {
    title: '异常率',
    dataIndex: 'cheat',
    key: 'cheat',
  },
  {
    title: '详情',
    render: () => (
        <Button size="small" onClick={()=> {
          this.props.history.push('/main/paper_manage/look_student');
        }}>详情</Button>
    ),
    key: 'detail',
  },
]
