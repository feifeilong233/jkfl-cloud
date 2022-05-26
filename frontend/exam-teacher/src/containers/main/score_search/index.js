import React from 'react'
import BreadcrumbCustom from '@components/BreadcrumbCustom'
import {Card, Form} from 'antd';
import {Row,Col,Select,Input,Table, Icon, Divider,Button,Modal,message} from 'antd'
const Option = Select.Option;
const Search = Input.Search;
const FormItem = Form.Item;
const confirm = Modal.confirm;
import ReactECharts from 'echarts-for-react';

import httpServer from '@components/httpServer.js';
import { connect } from 'react-redux'
import * as URL from '@components/interfaceURL.js'
import axios from "axios";
import {examport} from "../../../constants/webport";
import {getJwtToken} from "../../../lib/utils";
import * as XLSX from "xlsx";

class ScoreSearch extends React.Component {

  constructor(props){
    super(props)
    this.state = {
      selectedRowKeys : [], //选择的行
      modalVisible:false,
      data : [],
      visibleChangeModal : false,//修改框是否显示
      curSelectClass : {//当前所选的学生
        key : 0,
        name : "",
        class : "",
        studentId : 1,
      },

      //人数统计option
      option : {
        title:{
          text: 'Score'
        },
        toolbox: {
          feature: {
            saveAsImage: {}
          }
        },
        tooltip: {},
        legend: {
          data:['人数']
        },
        xAxis: {
          data: ['前20%', '20% ~ 40%', '40% ~ 60%', '60% ~ 80%', '80% ~ 100%']
        },
        yAxis: {},
        series: [{
          name: '人数',
          type: 'bar',
          animationEasing: 'elasticOut',
          data: []
        }]
      },
    }
    this.searchKey = "1";//默认按照班级搜索  1班级 2科目  3状态
    this.turnStatus = "NORMAL"; //NORMAL:正常翻页   SEARCH:搜索翻页
    this.searchContent = ""; //搜索内容
  }


  //得到搜索的数据
  getSearchData(){
    console.log(`search - ${this.searchKey} - ${this.searchContent}`)

    axios.post(examport+'/answer/getListWithParam?type='+this.searchKey+'&text='+this.searchContent,{},{
      headers:{
        "Authorization": getJwtToken()
      }
    }).then(response=>{
      const {data} = response.data.data;

      const r = [];
      data.map((item,_)=>{
        r.push(item.total)
      })
      let min = Math.min(...r);
      let max = Math.max(...r);

      let sc = 0;
      data.map((item,_)=>{
        sc  = sc + item.total;
      })
      sc = sc / data.length;

      const title = data[0].title;

      const total = new Array(5).fill(0);
      data.map((item,_)=>{

        const val = item.total / 120;
        const _val = Math.floor(val / 0.2);

        total[_val] = total[_val] + 1;
      })

      const newOptions = this.state.option;
      newOptions.title.text = title;
      newOptions.series[0].data = total;

      this.setState({
        data: data,
        option: newOptions,
        min: min,
        max: max,
        sc: sc
      });
    })

  }


  componentWillMount(){

    axios.post(examport+'/answer/getListWithSubScore',{},{
      headers:{
        "Authorization":getJwtToken()
      }
    }).then(response=>{
      const {date} = response.data.data;

      const r = [];
      date.map((item,_)=>{
        r.push(item.total)
      })
      let min = Math.min(...r);
      let max = Math.max(...r);

      let sc = 0;
      date.map((item,_)=>{
        sc  = sc + item.total;
      })
      sc = sc / date.length;


      this.setState({
        data: date,
        min: min,
        max: max,
        sc: sc
      });

    })

  }


  //搜索类型选择
  handleChange(value) {
    this.searchKey = value;
  }

  //点击搜索
  searchClass(value) {
    if(value === "") {
      Modal.error({
        content: "搜索内容不能为空！",
        okText : '确定'
      });
      return;
    }
    this.searchContent = value;
    this.getSearchData();
  }

  //选择某一行
  onSelectChange(selectedRowKeys) {
    console.log('selectedRowKeys changed: ', selectedRowKeys);
    this.setState({ selectedRowKeys });
  }

  //预览
  setModalVisible(modalVisible){
    this.setState({ modalVisible });
  }

  handleAnalysis(){
    this.setModalVisible(true);
  }

  bindScoreDownloadClick(){
    //console.log("download");

    const aoa = [
      ['姓名', '学号', '考试名称', '主观题得分', '客观题得分', '总分'],
    ]

    this.state.data.map((item,_)=>{
      const list = new Array(6).fill(null);
      list[0] = item.nickname;
      list[1] = item.pid;
      list[2] = item.title;
      list[3] = item.join;
      list[4] = item.sub;
      list[5] = item.total;
      aoa.push(list);
    })

    const ws = XLSX.utils.aoa_to_sheet(aoa);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb,ws,'Sheet1');
    XLSX.writeFile(wb,`成绩导出-${new Date()}.xlsx`);

  }

  render(){
    const { getFieldDecorator } = this.props.form;
    console.log(this.state.total_echart)

    const columns = [
        {
      title: '姓名',
      dataIndex: 'nickname',
      key: 'nickname',
    }, {
      title: '学号',
      dataIndex: 'pid',
      key: 'pid',
    }, {
      title: '考试名称',
      dataIndex: 'title',
      key: 'title',
    },{
        title: '主观题得分',
        dataIndex: 'join',
        key: 'join',
    },{
        title: '客观题得分',
        dataIndex: 'sub',
        key: 'sub',
    }, {
      title: '总分',
      dataIndex: 'total',
      key: 'total',
    }];
    let localeObj = {
      emptyText: '暂无数据'
    }

    return(
      <div>
        <BreadcrumbCustom pathList={['成绩查询']}></BreadcrumbCustom>
        <div className="class-manage-content">

          <Modal
              title="成绩分析"
              width={'80%'}
              centered
              visible={this.state.modalVisible}
              onOk={() => this.setModalVisible(false)}
              onCancel={() => this.setModalVisible(false)}
          >
            <Row>
              <Col span={6}>
                <Card title="最低分" style={{ width: 300,height: 150 }}>
                  <p style={{fontWeight:'bolder',fontSize:'25px'}}>{this.state.min}</p>
                </Card>
              </Col>

              <Col span={6}>
                <Card title="最高分" style={{ width: 300,height: 150 }}>
                  <p style={{fontWeight:'bolder',fontSize:'25px'}}>{this.state.max}</p>
                </Card>
              </Col>

              <Col span={6}>
                <Card title="平均分" style={{ width: 300,height: 150 }}>
                  <p style={{fontWeight:'bolder',fontSize:'25px'}}>{this.state.sc}</p>
                </Card>
              </Col>

              <Col span={6}>
                <Card title="参与考试人数" style={{ width: 300,height: 150 }}>
                  <p style={{fontWeight:'bolder',fontSize:'25px'}}>{this.state.data.length}</p>
                </Card>
              </Col>
            </Row>

            <ReactECharts
                  option={this.state.option}
                  style={{ height: 400, marginTop:'6vh' }}
                  notMerge={true}
                  lazyUpdate={true}
                  opts={{ renderer: 'png' }}
              />
          </Modal>


          <Row>
            <Col span={2}>

              <Button type='primary' onClick={()=>{
                axios.post(examport+'/answer/getListWithSubScore',{},{
                  headers:{
                    "Authorization":getJwtToken()
                  }
                }).then(response=>{
                  const {date} = response.data.data;
                  this.setState({
                    data: date
                  });

                })
              }}>显示所有</Button>

            </Col>

            <Col span={2}>
              <Button onClick={this.handleAnalysis.bind(this)}
                      disabled={(!(this.searchKey === '3' && this.searchContent !== ''))}
                      title="请在查询具体的考试在进行教学班成绩分析"
              >分析</Button>

            </Col>

            <Col span={2}>
              <Button onClick={this.bindScoreDownloadClick.bind(this)}>导出Excel</Button>
            </Col>

            <Col span={14}>
              <Search
                className="f-r"
                placeholder="请输入关键字"
                onSearch={this.searchClass.bind(this)}
                enterButton
                style={{ width: 200 }}
              />
              <Select className="f-r m-r-20" defaultValue="1" style={{ width: 120 }} onChange={this.handleChange.bind(this)}>
                <Option value="1">姓名</Option>
                <Option value="2">学号</Option>
                <Option value="3">考试</Option>
              </Select>
            </Col>
          </Row>
          <div className="m-t-20">
            <Table
              // rowSelection={rowSelection}
              columns={columns}
              dataSource={this.state.data}
              locale={localeObj}
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
)(Form.create()(ScoreSearch))
