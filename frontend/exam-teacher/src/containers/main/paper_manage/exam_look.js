import React from 'react'
import BreadcrumbCustom from '@components/BreadcrumbCustom'
import {Row, Col, Select, Input, Table, Icon, Divider, Button, Modal, Form, notification} from 'antd'
const Option = Select.Option;
const Search = Input.Search;

import axios from "axios";
import {examport} from "../../../constants/webport";
import {getJwtToken} from "../../../lib/utils";

class ExamLook extends React.Component {

    constructor(props) {
        super(props);
        this.state={
            pathList:['考试管理','监考'],
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

    render(){
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
            title: '监考详情',
            key: 'action',
            render: () => (
                <Button onClick={()=> {
                    this.props.history.push('/main/paper_manage/look_student');
                }}>监考详情</Button>
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
                <BreadcrumbCustom pathList={this.state.pathList}></BreadcrumbCustom>
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
                            </Col>
                        </Row>
                    </div>
                    <Table
                        columns={columns}
                        dataSource={this.state.data}
                        pagination={this.state.pagination}
                        locale={localeObj}
                    />
                </div>
            </div>
        )
    }
}

export default ExamLook;
