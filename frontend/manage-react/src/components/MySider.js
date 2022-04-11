import React from 'react';
import {Menu,Avatar} from "antd";
import {AppstoreOutlined, BookOutlined, MailOutlined, SettingOutlined, UserOutlined} from '@ant-design/icons';
import {useHistory} from "react-router-dom/cjs/react-router-dom";
import './components.css';
import {changeDrawer} from "../store/actionCreators";
import store from "../store/index";
import axios from "axios";
import {getJwtToken} from "../lib/utils";



const { SubMenu } = Menu;

//redux
const rootSubmenuKeys = ['sub1', 'sub2', 'sub3','sub4'];

const menuList = [
    {   key:'sub1',
        title:"系统管理",
        icon: <MailOutlined />,
        children:[
            {key:1,title:"老师管理",path:"/back/systea"},
            {key:2,title:"学生管理",path:"/back/sysstu"},
            {key:3,title:"组织管理",path:"/back/sysorg"},
            {key:4,title:'菜单管理',path:'/back/sysmenu'},
            {key:5,title:"试卷管理",path:"/back/sysexam"}
        ]
    },
    {   key:'sub2',
        title:"日志管理",
        icon: <AppstoreOutlined />,
        children:[
            {key:6,title:"日志查看",path:"/back/syslog"},
        ]
    },
    {   key:'sub3',
        title:"后台管理",
        icon: <SettingOutlined />,
        children:[
            {key:8,title:"服务器状态",path:"/back/sysstatus"},
            {key:9,title:"系统监控",path:"/back/syslook"}
        ]
    },
    {   key:'sub4',
        title:"文档管理",
        icon: <BookOutlined />,
        children:[
            {key:10,title:"Swagger文档",path:"/back/sysswagger"},
            {key:11,title:"数据库文档",path:"/back/sysdatabase"},
            {key:12,title:"数据接口文档",path:"/back/sysinterface"},
        ]
    },
]

/**
 * 侧边栏Sider
 * @returns {JSX.Element}
 * @constructor
 */
export const MySider = (props) => {
    const [openKeys, setOpenKeys] = React.useState(['sub1']);

    const onOpenChange = keys => {
        const latestOpenKey = keys.find(key => openKeys.indexOf(key) === -1);
        if (rootSubmenuKeys.indexOf(latestOpenKey) === -1) {
            setOpenKeys(keys);
        } else {
            setOpenKeys(latestOpenKey ? [latestOpenKey] : []);
        }
    };

    let history = useHistory();
    return (
        <Menu mode="inline" openKeys={openKeys} onOpenChange={onOpenChange} >
            <Menu.Item
                icon={<UserOutlined />}
                onClick={()=>{

                    const jwt = getJwtToken();

                    axios.post('http://localhost:3000/api/back/currentRoot',{}, {
                        headers: {
                            "Authorization":jwt
                        }
                    })
                        .then(response=>{
                            const {user} = response.data.data;
                            const action = changeDrawer({
                                visible:true,
                                user: user
                            });
                            store.dispatch(action);
                        })
                }}

            >
                用户中心
            </Menu.Item>
            {
                menuList.map((item,index)=>{
                    return(
                        <SubMenu key={item.key} icon={item.icon} title={item.title}>
                            {
                                item.children.map((_item,_index)=>{
                                    return(
                                        <Menu.Item key={_item.key} onClick={()=>{

                                            history.push(_item.path);
                                        }}>
                                            {_item.title}
                                        </Menu.Item>
                                    )
                                })
                            }
                        </SubMenu>
                    )
                })
            }
        </Menu>
    );
};


