import React, {Component} from 'react';
import {MyTeaTable} from "../components/MyTeaTable";
import {MyStuTable} from "../components/MyStuTable";
import store from "../store";
import {getJwtToken} from "../lib/utils";
import axios from "axios";

class SysStu extends Component {

    constructor(props) {
        super(props);
        this.state = {
            "stu_data":[],
        }
        store.subscribe(() => {
            this.setState({
                "stu_data": store.getState().user_tree_select.select_student,
            })
        })
    }

    UNSAFE_componentWillMount() {
        const jwt = getJwtToken();
        axios.post('http://localhost:3000/api/back/findStu',{},{
            headers:{
                "Authorization":jwt
            }
        })
            .then(response=>{
                const {list} = response.data.data;
                console.log(list);
                this.setState({
                    stu_data:list
                });
            })
    }

    render() {
        const {stu_data} = this.state;
        return (
            <div>

                <MyStuTable
                    columns = {stu_columns}
                    data = {stu_data}
                />

            </div>
        );
    }
}

export default SysStu;

const stu_columns = [
    {
        title: '姓名',
        width: 100,
        dataIndex: 'userUsername',
        key: 'name',
        fixed: 'left',
    },
    {
        title: '性别',
        width: 100,
        dataIndex: 'userSex',
        key: 'sex',
        fixed: 'left',
    },
    { title: '电话',dataIndex: 'userPhone', key: '1' },
    { title: '邮箱',dataIndex: 'userEmail', key: '2' },
    { title: '专业',dataIndex: 'userMajor', key: '3' },
    { title: '地址',dataIndex: 'userAddress', key: '5' },
    { title: '备注',dataIndex: 'userDescription', key: '6' },
    {
        title: '操作',
        key: 'operation',
        fixed: 'right',
        width: 100,
        render: () => <a>删除</a>,
    },
];

const stu_data1 = [
    {
        key: '1',
        name: '学生-1',
        sex: '男',
        tel:'18115773855',
        email:'1356768966@qq.com',
        pwd:'730428',
        idcard:'320621200107288717',
        ctime:'2022-02-08 10:00',
        utime:'2022-02-08 10:01',
        job:'普通老师',
        school:'火星大学',
        academy:'人工智能与计算机学院',
        address: '无锡市滨湖区蠡湖大道1800号火星大学',
        description:'第一个诞生得用户！'
    },
    {
        key: '2',
        name: '学生-2',
        sex: '男',
        tel:'18115773855',
        email:'1356768966@qq.com',
        pwd:'730428',
        idcard:'320621200107288717',
        ctime:'2022-02-08 10:00',
        utime:'2022-02-08 10:01',
        job:'普通老师',
        school:'火星大学',
        academy:'物联网工程学院',
        address: '无锡市滨湖区蠡湖大道1800号火星大学',
        description:'第一个诞生得用户！'
    },
    {
        key: '3',
        name: '学生-3',
        sex: '男',
        tel:'18115773855',
        email:'1356768966@qq.com',
        pwd:'730428',
        idcard:'320621200107288717',
        ctime:'2022-02-08 10:00',
        utime:'2022-02-08 10:01',
        job:'普通老师',
        school:'火星大学',
        academy:'瞎几把创得学院',
        address: '无锡市滨湖区蠡湖大道1800号火星大学',
        description:'第一个诞生得用户！'
    },
    {
        key: '4',
        name: '学生-4',
        sex: '男',
        tel:'18115773855',
        email:'1356768966@qq.com',
        pwd:'730428',
        idcard:'320621200107288717',
        ctime:'2022-02-08 10:00',
        utime:'2022-02-08 10:01',
        job:'普通老师',
        school:'火星大学',
        academy:'人工智能与计算机学院',
        address: '无锡市滨湖区蠡湖大道1800号火星大学',
        description:'第一个诞生得用户！'
    },
    {
        key: '5',
        name: '学生-5',
        sex: '男',
        tel:'18115773855',
        email:'1356768966@qq.com',
        pwd:'730428',
        idcard:'320621200107288717',
        ctime:'2022-02-08 10:00',
        utime:'2022-02-08 10:01',
        job:'普通老师',
        school:'火星大学',
        academy:'人工智能与计算机学院',
        address: '无锡市滨湖区蠡湖大道1800号火星大学',
        description:'第一个诞生得用户！'
    },
    {
        key: '6',
        name: '学生-6',
        sex: '男',
        tel:'18115773855',
        email:'1356768966@qq.com',
        pwd:'730428',
        idcard:'320621200107288717',
        ctime:'2022-02-08 10:00',
        utime:'2022-02-08 10:01',
        job:'普通老师',
        school:'火星大学',
        academy:'人工智能与计算机学院',
        address: '无锡市滨湖区蠡湖大道1800号火星大学',
        description:'第一个诞生得用户！'
    },
    {
        key: '7',
        name: '学生-7',
        sex: '男',
        tel:'18115773855',
        email:'1356768966@qq.com',
        pwd:'730428',
        idcard:'320621200107288717',
        ctime:'2022-02-08 10:00',
        utime:'2022-02-08 10:01',
        job:'普通老师',
        school:'火星大学',
        academy:'人工智能与计算机学院',
        address: '无锡市滨湖区蠡湖大道1800号火星大学',
        description:'第一个诞生得用户！'
    },
    {
        key: '8',
        name: '学生-8',
        sex: '男',
        tel:'18115773855',
        email:'1356768966@qq.com',
        pwd:'730428',
        idcard:'320621200107288717',
        ctime:'2022-02-08 10:00',
        utime:'2022-02-08 10:01',
        job:'普通老师',
        school:'火星大学',
        academy:'人工智能与计算机学院',
        address: '无锡市滨湖区蠡湖大道1800号火星大学',
        description:'第一个诞生得用户！'
    },
    {
        key: '9',
        name: '学生-9',
        sex: '男',
        tel:'18115773855',
        email:'1356768966@qq.com',
        pwd:'730428',
        idcard:'320621200107288717',
        ctime:'2022-02-08 10:00',
        utime:'2022-02-08 10:01',
        job:'普通老师',
        school:'火星大学',
        academy:'人工智能与计算机学院',
        address: '无锡市滨湖区蠡湖大道1800号火星大学',
        description:'第一个诞生得用户！'
    },
    {
        key: '10',
        name: '学生-10',
        sex: '男',
        tel:'18115773855',
        email:'1356768966@qq.com',
        pwd:'730428',
        idcard:'320621200107288717',
        ctime:'2022-02-08 10:00',
        utime:'2022-02-08 10:01',
        job:'普通老师',
        school:'火星大学',
        academy:'人工智能与计算机学院',
        address: '无锡市滨湖区蠡湖大道1800号火星大学',
        description:'第一个诞生得用户！'
    },
];
