import React from 'react'
import BreadcrumbCustom from '@components/BreadcrumbCustom'
import {Row,Col,Select,Input,Table, Icon, Divider,Button} from 'antd'
const Option = Select.Option;
const Search = Input.Search;

import {Link} from 'react-router-dom'
import {withRouter} from "react-router-dom";
import httpServer from '@components/httpServer.js'
import * as URL from '@components/interfaceURL.js'
import axios from "axios";
import {examport} from "../../../constants/webport";
import {getJwtToken} from "../../../lib/utils";

class AllPapers extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      data : [],
    }
  }

  componentWillMount(){
    //this.getAllPapers(this.props.match.params.paperId,this.props.match.params.classId,this.props.match.params.managerId);
    //console.log(this.props.match.params.examId)

    const {examId} = this.props.match.params;

    axios.post(examport+'/read/readAllPaper?examId='+examId,{},{
      headers:{
        "Authorization":getJwtToken()
      }
    }).then(response=>{
      const {data} = response.data.data;
      console.log(data)
      this.setState({
        data: data
      });
    }).catch((err)=>{
      this.props.history.push('/main/paper_manage/scoring');
    })

  }

  beginReading(){
    console.log('2333')
  }

  render(){
    const columns = [{
      title: '姓名',
      dataIndex: 'userNickname',
      key: 'userNickname',
    }, {
      title: '学号',
      dataIndex: 'userPid',
      key: 'userPid',
    }, {
      title: '状态',
      dataIndex: 'status',
      key: 'status',
    }, {
      title: '阅卷',
      key: 'action',
      render: (text, record) => (
        <span>
          {
            record.status === '已批阅'?
          <Button size="small" onClick={()=>console.log(record.status)}>
            <Link
              to={`/main/paper_manage/scoring/all_papers/reading_paper/${this.props.match.params.paperId}/${this.props.match.params.classId}/${record.userPid}/${this.props.match.params.examId}`}
            >重新阅卷</Link>
          </Button>:
          <Button type="primary" size="small" onClick={this.beginReading.bind(this)}>
            <Link
              to={`/main/paper_manage/scoring/all_papers/reading_paper/${this.props.match.params.paperId}/${this.props.match.params.classId}/${record.userPid}/${this.props.match.params.examId}`}
            >开始阅卷</Link>
          </Button>
          }
        </span>
      ),
    }];

    let localeObj = {
      emptyText: '暂无数据'
    }

    return(
      <div>
        <BreadcrumbCustom pathList={['考试管理',['在线阅卷'],['所有试卷']]}></BreadcrumbCustom>
        <div className="scoring-paper-content">
          <Row>
            <Button type="primary" className="f-r m-b-20"><Link to="/main/paper_manage/scoring"><Icon type="left" />返回</Link></Button>
          </Row>
          <Table
            // rowSelection={rowSelection}
            columns={columns}
            dataSource={this.state.data}
            locale={localeObj}
          />
        </div>
      </div>
    )
  }
}

export default withRouter(AllPapers);
