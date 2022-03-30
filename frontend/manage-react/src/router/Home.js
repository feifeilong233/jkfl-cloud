import React, {Component} from 'react';

import "./router.css";
import {Layout, Menu} from "antd";
import {MySider} from "../components/MySider";
import {Route, Switch} from "react-router-dom";
import SysTea from "../pages/SysTea";
import MyDrawer from "../components/MyDrawer";
import SysStu from "../pages/SysStu";
import SysOpt from "../pages/SysOpt";
import SysLog from "../pages/SysLog";
import SysSwagger from "../pages/SysSwagger";
import SysDataBase from "../pages/SysDataBase";
import SysInterface from "../pages/SysInterface";
const { Header, Content, Footer, Sider } = Layout;


class Home extends Component {

    constructor(props) {
        super(props);

        this.state={
            collapsed: false,
        };
    }

    onCollapse = collapsed => {
        console.log(collapsed);
        this.setState({ collapsed });
    };


    render() {
        const {collapsed} = this.state;
        return (
            <Layout className='xi-on-layout-box'>

                <Sider collapsible
                       collapsed={collapsed}
                       onCollapse={this.onCollapse}
                       width={300}
                       className='xi-on-sider-box'
                       theme='light '
                >
                    <MySider/>
                </Sider>

                <Layout style={{backgroundColor:'#fff'}}>
                    <Content>
                        <Switch>
                            <Route path='/back/systea' component={SysTea}/>
                            <Route path='/back/sysstu' component={SysStu}/>
                            <Route path='/back/sysorg' component={SysOpt}/>
                            <Route path='/back/syslog' component={SysLog}/>
                            <Route path='/back/sysopt' component={SysOpt}/>

                            <Route path='/back/sysswagger' component={SysSwagger}/>
                            <Route path='/back/sysdatabase' component={SysDataBase}/>
                            <Route path='/back/sysinterface' component={SysInterface}/>

                        </Switch>

                        <MyDrawer/>

                    </Content>


                    <Footer>

                    </Footer>

                </Layout>

            </Layout>
        );
    }
}

export default Home;