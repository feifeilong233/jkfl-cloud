import {Col, Content, Footer, Header, Layout, Menu, Row, Sider} from "lole-ui";
import MenuItem from "lole-ui/dist/components/Menu/menuItem";
import {Route, Router, Switch} from "react-router-dom";
import Home from "./route/Home";
import './App.css';


function App() {

  const scrollToAnchor= (anchorName) => {
    if (anchorName) {
      // 找到锚点
      let anchorElement = document.getElementById(anchorName);
      // 如果对应id的锚点存在，就跳转到锚点
      if(anchorElement) { anchorElement.scrollIntoView({block: 'start', behavior: 'smooth'}); }
    }
  }

  return (
    <div className="App">
      <Layout>

        <Header style={{background:'#173f4f', position: 'fixed', zIndex: 1, width: '100%'}} >
          <Row>
            <Col span={8}>
              <img src='https://s1.ax1x.com/2022/03/19/qEH1pT.png'/>
            </Col>
            <Col span={13}/>
            <Col span={3}>
              <Menu style={{color:'#35b9ab'}}>
                <MenuItem><a onClick={()=>scrollToAnchor('home')}>首页</a></MenuItem>
                <MenuItem><a onClick={()=>scrollToAnchor('product')}>产品</a></MenuItem>
                <MenuItem><a onClick={()=>scrollToAnchor('code')}>贡献</a></MenuItem>
              </Menu>
            </Col>
          </Row>
        </Header>

        <Content>

          <Switch>
            <Route path='/' component={Home}/>
          </Switch>

        </Content>

        <Footer style={{background:'#173f4f'}}>
          <div className='jkfl-footer'>
            Designed By <code>汪汪队睡大觉</code>
          </div>
        </Footer>

      </Layout>

    </div>
  );
}

export default App;
