import React, {Component} from 'react';
import axios from "axios";
import {getJwtToken} from "../lib/utils";
import {Space, Table} from "antd";

class SysLog extends Component {

    constructor(props) {
        super(props);
        this.state={
            loginfo:[]
        }
    }

    UNSAFE_componentWillMount() {

        const jwt = getJwtToken();
        axios.post('http://localhost:3000/api/back/loginfo',{},{
            headers: {
                "Authorization":jwt
            }
        })
            .then(response=>{
                const {log} = response.data.data;
                console.log(log)
                this.setState({
                    loginfo:log
                });
            })

    }

    componentDidMount() {
        let socket;
        if(typeof(WebSocket) == "undefined") {
            console.log("您的浏览器不支持WebSocket");
        }else{
            console.log("您的浏览器支持WebSocket");
            socket = new WebSocket('ws://localhost:8000/websocket');

            //打开事件
            socket.onopen = function() {
                console.log("Socket 已打开");
                //socket.send("这是来自客户端的消息" + location.href + new Date());
            };

            //获得消息事件
            socket.onmessage = function(msg) {
                console.log(msg.data);
                //发现消息进入 调后台获取
            };

            //关闭事件
            socket.onclose = function() {
                console.log("Socket已关闭");
            };

            //发生了错误事件
            socket.onerror = function() {
                alert("Socket发生了错误");
            }

        }

    }


    render() {
        return (
            <div>
                <Table columns={columns} dataSource={this.state.loginfo} />
            </div>
        );
    }
}

export default SysLog;

const columns = [
    {
        title: '编号',
        dataIndex: 'id',
        key: 'id',
        render: text => <a>{text}</a>,
    },
    {
        title: '信息',
        dataIndex: 'msg',
        key: 'msg',
    },
    {
        title: '时间',
        dataIndex: 'createTime',
        key: 'createTime',
    },{
        title: 'Action',
        key: 'action',
        render: (text, record) => (
            <Space size="middle">
                <a>Invite {record.name}</a>
                <a>Delete</a>
            </Space>
        ),
    },
]