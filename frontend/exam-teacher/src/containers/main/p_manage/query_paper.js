import React from 'react'
import BreadcrumbCustom from '@components/BreadcrumbCustom'
import {Row, Col, Select, Input, Table, Icon, Divider, Button, Modal} from 'antd'
import axios from "axios";
import {examport} from "../../../constants/webport";
import {getJwtToken} from "../../../lib/utils";
const Option = Select.Option;
const Search = Input.Search;

export default class QueryPaper extends React.Component {
  constructor(props){
    super(props);
    this.state={
      data:[],
      paper_detail:{
        select: [],
        multiple: [],
        judge: [],
        input: [],
        shortAnswer: [],
        program: [],
      },

      modalVisible:false,
    }
  }

  //搜索类型选择
  handleChange(value) {
    console.log(`selected ${value}`);
  }

  componentWillMount() {
    axios.post(examport+'/item_look/paperList',{},{
      headers:{
        "Authorization":getJwtToken()
      }
    }).then(response=>{
      const {data} = response.data.data;
      //console.log(response.data.data)
      this.setState({
        data:data,
      })
    })

  }

  //预览
  setModalVisible(modalVisible){
    this.setState({ modalVisible });
  }

  getInformation(record,index){
    console.log('获取当前行的年龄');
    console.log(record.age);
    console.log(`获取当前页面第${index+1}行，获取编号${index + (this.state.current-1)*this.state.pageSize+1}`);
  }

  render(){
    const columns = [
        {
      title: '编号',
      dataIndex: 'paperLookId',
      key: 'paperLookId',
    }, {
      title: '名称',
      dataIndex: 'paperLookTitle',
      key: 'paperLookTitle',
    }, {
      title: '总分',
      dataIndex: 'paperLookScore',
      key: 'paperLookScore',
    }, {
      title: '考试时间',
      dataIndex: 'paperLookTime',
      key: 'paperLookTime',
    }, {
      title: '出卷人',
      dataIndex: 'paperTeacherName',
      key: 'paperTeacherName',
    },{
      title: '创建时间',
      dataIndex: 'createTime',
      key: 'createTime',
    },
      {
        title: '操作',
        dataIndex: 'secret',
        align: 'center',
        render: (text, record,index)=>(
          <Button type="link" onClick={()=>{
            console.log(record)
            const paperId = record.paperId;
            axios.post(examport+'/paper/getPaperById?id='+paperId,{},{
              headers:{
                "Authorization":getJwtToken()
              }
            }).then(response=>{
              const {data} = response.data;
              console.log(data)
              this.setState({
                paper_detail: data,
                modalVisible: true
              })
            })

          }}>查看</Button>
        )
      },

    ];


    /*const datax = [];
    for (let i = 0; i < 46; i++) {
      datax.push({
        key: i,
        class: 'web1707',
        subject : 'web前端',
        time: '2018-1-22',
        teacher : '谢智'
      });
    }*/

    return(
      <div>
        <BreadcrumbCustom pathList={['试卷管理','试卷查询']}></BreadcrumbCustom>
        <div className="score-search-content">
          <Row>
            <Col span={24}>
              <Search
                className="f-r"
                placeholder="请输入关键字"
                onSearch={value => console.log(value)}
                enterButton
                style={{ width: 200 }}
              />
              <Select className="f-r m-r-20" defaultValue="name" style={{ width: 120 }} onChange={this.handleChange.bind(this)}>
                <Option value="name">班级</Option>
                <Option value="id">科目</Option>
                <Option value="class">考试时间</Option>
                <Option value="class">阅卷老师</Option>
              </Select>
            </Col>
          </Row>
          <div className="m-t-20">
            <Table columns={columns} dataSource={this.state.data} />
          </div>


          <Modal
              title="试卷预览"
              width={'65%'}
              centered
              visible={this.state.modalVisible}
              onOk={() => this.setModalVisible(false)}
              onCancel={() => this.setModalVisible(false)}
          >
            <h3>选择</h3>
            <div>
              {
                this.state.paper_detail.select.length===0?<p>无</p>:this.state.paper_detail.select.map((item,index)=>{
                  return(
                      <div key={index} style={{display:'flex'}}>
                        <p style={{fontWeight:'600'}}>{(index+1)+'. '}</p>
                        <p >{item.sqQuestion}</p>
                      </div>
                  )
                })
              }
            </div>
            <h3>多选</h3>
            <div>
              {
                this.state.paper_detail.multiple.length===0?<p>无</p>:this.state.paper_detail.multiple.map((item,index)=>{
                  return(
                      <div key={index} style={{display:'flex'}}>
                        <p style={{fontWeight:'600'}}>{(index+1)+'. '}</p>
                        <p key={index}>{item.mqQuestion}</p>
                      </div>
                  )
                })
              }
            </div>
            <h3>判断</h3>
            <div>
              {
                this.state.paper_detail.judge.length===0?<p>无</p>:this.state.paper_detail.judge.map((item,index)=>{
                  return(
                      <div key={index} style={{display:'flex'}}>
                        <p style={{fontWeight:'600'}}>{(index+1)+'. '}</p>
                        <p key={index}>{item.jqQuestion}</p>
                      </div>
                  )
                })
              }
            </div>
            <h3>填空</h3>
            <div>
              {
                this.state.paper_detail.input.length===0?<p>无</p>:this.state.paper_detail.input.map((item,index)=>{
                  return(
                      <div key={index} style={{display:'flex'}}>
                        <p style={{fontWeight:'600'}}>{(index+1)+'. '}</p>
                        <p key={index}>{item.iqQuestion}</p>
                      </div>
                  )
                })
              }
            </div>
            <h3>简答</h3>
            <div>
              {
                this.state.paper_detail.shortAnswer.length===0?<p>无</p>:this.state.paper_detail.shortAnswer.map((item,index)=>{
                  return(
                      <div key={index} style={{display:'flex'}}>
                        <p style={{fontWeight:'600'}}>{(index+1)+'. '}</p>
                        <p key={index}>{item.saqQuestion}</p>
                      </div>
                  )
                })
              }
            </div>
            <h3>程序</h3>
            <div>
              {
                this.state.paper_detail.program.length===0?<p>无</p>:this.state.paper_detail.program.map((item,index)=>{
                  return(
                      <div key={index} style={{display:'flex'}}>
                        <p style={{fontWeight:'600'}}>{(index+1)+'. '}</p>
                        <p key={index}>{item.pqQuestion}</p>
                      </div>
                  )
                })
              }
            </div>
          </Modal>

        </div>
      </div>
    )
  }
}
