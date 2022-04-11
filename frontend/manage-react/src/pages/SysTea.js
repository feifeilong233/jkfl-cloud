import React, {Component} from 'react';
import {MyTeaTable} from "../components/MyTeaTable";
import store from "../store";
import {getJwtToken} from "../lib/utils";
import axios from "axios";

/**
 * 老师页面，
 * 老师和学生应该共用一个页面，但是写起来太烦了，直接复制粘贴！
 */
class SysTea extends Component {

    constructor(props) {
        super(props);
        this.state={
            tea_data:[],
        }
        store.subscribe(()=>{
            let select_teacher_data = store.getState().user_tree_select.select_teacher;
            this.setState({tea_data:select_teacher_data});
        })
    }


    UNSAFE_componentWillMount() {

        const jwt = getJwtToken();
        axios.post('http://localhost:3000/api/back/findTea',{},{
            headers:{
                "Authorization":jwt
            }
        })
            .then(response=>{
                const {list} = response.data.data;
                //console.log(list);
                this.setState({
                    tea_data:list
                });
            })
    }


    render() {
        const {tea_data} = this.state;
        console.log(tea_data);

        return (
            <div>

                <MyTeaTable
                    columns = {columns}
                    data = {tea_data}
                    td={tea_data}
                />

            </div>
        );
    }


}

export default SysTea;

const columns = [
    {
        title: '姓名',
        width: 100,
        dataIndex: 'teaName',
        key: 'name',
        fixed: 'left',
    },
    {
        title: '性别',
        width: 100,
        dataIndex: 'teaSex',
        key: 'sex',
        fixed: 'left',
    },
    { title: '电话',dataIndex: 'teaTel', key: '1' },
    { title: '邮箱',dataIndex: 'teaEmail', key: '2' },
    { title: '密码',dataIndex: 'teaPwd', key: '3' },
    { title: '职务',dataIndex: 'teaJob', key: '4' },
    { title: '地址',dataIndex: 'teaAddress', key: '5' },
    { title: '备注',dataIndex: 'teaDescription', key: '6' },
    {
        title: '操作',
        key: 'operation',
        fixed: 'right',
        width: 100,
        render: () => <a>删除</a>,
    },
];

const data = [
    {
        key: '1',
        name: '老师-1',
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
        name: '老师-2',
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
        name: '老师-3',
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
        name: '老师-4',
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
        name: '老师-5',
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
        name: '老师-6',
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
        name: '老师-7',
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
        name: '老师-8',
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
        name: '老师-9',
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
        name: '老师-10',
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

