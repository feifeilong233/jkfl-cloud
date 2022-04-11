import {Avatar, Button, Descriptions, Drawer} from "antd";
import React, {Component} from 'react';
import store from "../store/index";
import {changeDrawer} from "../store/actionCreators";
import {PoweroffOutlined, UserOutlined} from "@ant-design/icons";
import axios from "axios";
import {getJwtToken} from "../lib/utils";

class MyDrawer extends Component {

    constructor(props) {
        super(props);
        this.state={
            visible: false,
            user:{
                adminId:'1',
                adminName:"xiye",
                adminTel:1313131,
                adminEmail:"13@qq.com",
                adminDescription:'11'
            }
        }
        store.subscribe(()=> {
            this.setState(store.getState().drawer)
        });

    }

    onClose = () => {
        const action = changeDrawer({visible: false,user:{}});
        console.log(action)
        store.dispatch(action);
    };


    render() {
        const {  visible,user } = this.state;
        return (
            <div>
                <Drawer
                    title="用户信息"
                    placement='right'
                    closable={false}
                    onClose={this.onClose}
                    visible={visible}
                >
                    <Avatar size={64} icon={<UserOutlined />} />
                    <Descriptions  column={1}>
                        <div style={{margin:'20px'}}/>
                        <Descriptions.Item label="编号">{user.adminId}</Descriptions.Item>
                        <Descriptions.Item label="姓名">{user.adminName}</Descriptions.Item>
                        <Descriptions.Item label="电话">{user.adminTel}</Descriptions.Item>
                        <Descriptions.Item label="邮箱">{user.adminEmail}</Descriptions.Item>
                        <Descriptions.Item label="地址">
                            火星大学
                        </Descriptions.Item>
                        <Descriptions.Item label="权限">管理员</Descriptions.Item>
                        <Descriptions.Item label="部门">运维</Descriptions.Item>
                        <Descriptions.Item label="备注">{user.adminDescription}</Descriptions.Item>
                    </Descriptions>
                    <div style={{margin:'50px'}}/>
                    <Button
                        type="primary"
                        icon={<PoweroffOutlined />}
                        block={true}
                        danger
                    >
                        退出
                    </Button>
                </Drawer>
            </div>
        );
    }
}

export default MyDrawer;
