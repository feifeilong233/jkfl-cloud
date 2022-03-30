import React, {Component} from 'react';
import {List} from "antd";
import axios from "axios";
import {getJwtToken} from "../lib/utils";

class SysInterface extends Component {

    componentDidMount() {
        const jwt = getJwtToken();
        axios.post('http://localhost:3000/api/back/interface',{},{
            headers:{
                "Authorization":jwt
            }
        })
            .then(response=>{console.log(response)})
            .catch(error=>console.log(error));
    }

    render() {
        return (
            <div>
                <List
                    size="large"
                    header={<div><h2>响应码</h2></div>}
                    split={true}
                    bordered
                    dataSource={dataList}
                    renderItem={item => <List.Item>{item}</List.Item>}
                />
                <List
                    size="large"
                    header={<div><h2>日志类型</h2></div>}
                    split={true}
                    bordered
                    dataSource={LogList}
                    renderItem={item => <List.Item>{item}</List.Item>}
                />
            </div>
        );
    }
}

export default SysInterface;


const dataList = [
    'SUCCESS_CODE - 2000',
    'ERROR_CODE - 5555'
];

const LogList = [
    'LOGIN_MSG  -  管理员登录',
    'SEARCH_LOG  -  查询-日志',
    'SEARCH_USERINFO  -  查询-用户信息',
    'SEARCH_STUINFO  -  查询-学生信息',
    'SEARCH_TEAINFO  -  查询-老师信息',
    'SEARCH_DATABASE  -  查询-数据库接口',
    'SEARCH_SWAGGER  -  查询-Swagger文档接口',
    'DELETE_LOG_SUCCESS  -  删除成功-日志',
    'DELETE_LOG_FAIL  -  删除失败-日志',
    "SEARCH_INTERFACE  -  查询-数据接口文档"
]