import React, {Component} from 'react';
import {Space, Switch, Table} from "antd";
import axios from "axios";
import {getJwtToken} from "../lib/utils";

class SysOpt extends Component {

    constructor(props) {
        super(props);
        this.state={

        }
    }

    UNSAFE_componentWillMount() {
        const jwt = getJwtToken();
        axios.post('http://localhost:3000/api/back/getOptList',{},{
            headers:{
                "Authorization": jwt
            }
        }).then(response=>{
            //console.log(response.data.data)
            const {list} = response.data.data;
            this.setState({
                data: list
            });
        }).catch(error=>console.log(error));
    }


    render() {
        return (
            <div>

                <Table
                    columns={column}
                    //rowSelection={{ ...rowSelection, checkStrictly }}
                    dataSource={this.state.data}
                />
            </div>
        );
    }
}

const treeData = [
    {
        title: '火星大学',
        key: '0',
        id:"1",
        pid:"0",
        children: [
            {
                title: '人工智能与计算机学院',
                key: '0-0',
                id:"3",
                pid:'1',
            },
            {
                title: '物联网工程学院',
                key: '0-1',
                id:"4",
                pid:'1',
            },
            {
                title: '设计学院',
                key: '0-2',
                id:"7",
                pid:'1',
            }
        ],
    },
    {
        title:'不知道起啥名学院',
        key: '1',
        id:"2",
        pid:'0',
        children: [
            {
                title: '数字媒体学院',
                key: '1-0',
                id:"5",
                pid:'2',
            },
            {
                title: '机械工程学院',
                key: '1-1',
                id:"6",
                pid:'2',
            },
        ],
    }
];

const column=[
    {
        title: 'ID',
        dataIndex: 'id',
        key: 'id',
    },
    {
        title: 'Title',
        dataIndex: 'title',
        key: 'title',
    },
    {
        title: 'Create Time',
        dataIndex: 'createTime',
        key: 'createTime',
    },
    {
        title: 'Update Time',
        dataIndex: 'updateTime',
        key: 'updateTime',
    }
];

export default SysOpt;
