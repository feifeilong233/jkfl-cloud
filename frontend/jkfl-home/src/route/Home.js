import React, {Component} from 'react';
import './home.css';
import {Animator, Button, Col, Divider, Row} from "lole-ui";

class Home extends Component {

    constructor(props) {
        super(props);

       this.state={
           showStu:false,
           showTea:false,
           stuDetail:false,
           teaDetail:false,
       }
    }

    bindMouseEnter=()=>{
        this.setState({showStu:true})
    }
    bindMouseLeave=()=>{
        this.setState({showStu:false})
    }
    bindTeaMouseEnter=()=>{
        this.setState({showTea:true})
    }
    bindTeaMouseLeave=()=>{
        this.setState({showTea:false})
    }

    jumpToStuMore=()=>{
        this.setState({stuDetail:true})
    }
    jumpToTeaMore=()=>{
        this.setState({teaDetail:true})
    }
    jumpToStuHome=()=>{
        this.setState({stuDetail:false})
    }
    jumpToTeaHome=()=>{
        this.setState({teaDetail:false})
    }

    handleClickToAdmin=()=>{
        console.log('Go to Admin')
    }

    render() {
        return (
            <div className='jkfl-wrapper'>


            <div id='home' className='jkfl-home-wrapper'>
                <div className='jkfl-home-header-title'>
                <h3>下一代全平台教考分离解决方案</h3>
            </div>
                {
                    this.state.stuDetail===false && this.state.teaDetail===false && <Row style={{width: '100vw', height: '60vh'}}>
                        <Col>
                            <div style={{width: '48vw'}}>
                                <div className='jkfl-home-card'
                                     onMouseEnter={this.bindMouseEnter}
                                     onMouseLeave={this.bindMouseLeave}
                                >
                                    <span><img src='https://s1.ax1x.com/2022/03/19/qEyWtA.png'/></span>
                                    <span >
                                        <span><h2 className='jkfl-card-title'>Student Platform</h2></span>
                                        <span>
                                            <p className='jkfl-card-content'>由Vue+Electron制作而成的轻量化考试平台</p>
                                            <p className='jkfl-card-content'>实现在线考试，模拟练习等各项功能</p>
                                        </span>
                                    </span>
                                    <div style={{height:'1vh'}}/>

                                    <Animator in={this.state.showStu}
                                              timeout={300}
                                              animation='zoom-in-top'
                                    >
                                        <span>
                                            <Button btnType='primary' shape='round' style={{marginRight: '10px'}}><a href='http://18.163.188.158:9527' target='_blank'>Sign in</a></Button>
                                            <Button shape='round' ghost onClick={this.jumpToStuMore}>More</Button>
                                        </span>
                                    </Animator>

                                </div>
                            </div>
                        </Col>
                        <Divider type='vertical' className='jkfl-home-content-divider'/>
                        <Col>
                            <div style={{width: '48vw'}}>
                                <div className='jkfl-home-card'
                                     onMouseEnter={this.bindTeaMouseEnter}
                                     onMouseLeave={this.bindTeaMouseLeave}
                                >
                                    <span><img src='https://s1.ax1x.com/2022/03/19/qEIowt.png'/></span>
                                    <span>
                                        <span><h2 className='jkfl-card-title'>Teacher Platform</h2></span>
                                        <span>
                                            <p className='jkfl-card-content'>由React+Redux制作而成的教师管理平台</p>
                                            <p className='jkfl-card-content'>实现手自动组件，监考等功能</p>
                                        </span>
                                    </span>
                                    <div style={{height:'1vh'}}/>
                                    <Animator in={this.state.showTea}
                                              timeout={300}
                                              animation='zoom-in-top'
                                    >
                                        <span className='jkfl-stu-btn-group'>
                                            <Button shape='round' btnType='primary' style={{marginRight: '10px'}}><a href='http://localhost:3001/login' target='_blank' >Sign in</a></Button>
                                            <Button shape='round' ghost onClick={this.jumpToTeaMore}>More</Button>
                                        </span>
                                    </Animator>

                                </div>
                            </div>
                        </Col>
                    </Row>
                }

                <Animator
                        in={this.state.stuDetail}
                        timeout={400}
                        animation='zoom-in-bottom'
                    >
                        <div className='jkfl-stu-detail-wrapper' style={{display:this.state.stuDetail?'':'none'}}>
                            <div className='jkfl-stu-detail-card'>
                                <span><img src='https://s1.ax1x.com/2022/03/19/qEyWtA.png'/></span>
                                <span>
                                    <span><h2 className='jkfl-card-title' style={{color:'#fff'}}>Student Platform</h2></span>
                                    <span >
                                        <p className='jkfl-card-content'>教考分离平台学生系统由Vue和Electron编写而成，需要用户下载可执行程序包在自己的计算机上运行</p>
                                        <p className='jkfl-card-content'>平台为用户提供了在线考试以及模拟考试功能，在进行部分考试时请检查所使用计算机是否符合考试要求和规范</p>
                                        <p className='jkfl-card-content'>点击下方按钮即可进行下载</p>
                                    </span>
                                   <div style={{marginBottom:'1vh'}}/>
                                   <Button shape='round' btnType='primary' style={{marginRight:'5px'}}><a href='http://18.163.188.158:9527' target='_blank'>Sign in</a></Button>
                                   <Button shape='round' btnType='danger' onClick={this.jumpToStuHome}>返回</Button>
                               </span>
                            </div>
                        </div>
              </Animator>

                <Animator
                    in={this.state.teaDetail}
                    timeout={400}
                    animation='zoom-in-bottom'
                >
                    <div className='jkfl-stu-detail-wrapper' style={{display:this.state.teaDetail?'':'none'}}>
                        <div className='jkfl-stu-detail-card'>
                            <span><img src='https://s1.ax1x.com/2022/03/19/qEIowt.png'/></span>
                            <span>
                                    <span><h2 className='jkfl-card-title' style={{color:'#fff'}}>Teacher Platform</h2></span>
                                    <span >
                                        <p className='jkfl-card-content'>教考分离平台教师端系统由React和Redux编写而成，部署在Web环境中，用户可以直接在浏览器中进行管理和监考</p>
                                        <p className='jkfl-card-content'>平台为教师用户提供了手动、自动组件，题库浏览，创建考试，监考阅卷等功能，平台竭力为教师朋友们献上良好的体验</p>
                                        <p className='jkfl-card-content'>部分监考模式需要依赖硬件设备本平台不提供，请各位教师发布开始前及时通知学生</p>
                                        <p className='jkfl-card-content'>点击下方按钮即可登陆</p>
                                    </span>
                                   <div style={{marginBottom:'1vh'}}/>
                                <Button shape='round' btnType='primary' style={{marginRight:'5px'}}><a href='http://localhost:3001/login' target='_blank' >Sign in</a></Button>
                                   <Button shape='round' btnType='danger' onClick={this.jumpToTeaHome}>返回</Button>
                               </span>
                        </div>
                    </div>
                </Animator>

                <div className='jkfl-admin-wrapper'>
                    <Row>
                        <Col span={10}/>
                        <Col span={8}>
                            <div>
                                <span><h1 className='jkfl-card-admin-title'>Admin Platform</h1></span>
                                <span style={{display:'flex'}}>
                                    <p className='jkfl-card-admin-context'>系统后端入口</p>
                                    <Button shape='round'
                                            btnType='link'
                                            onClick={this.handleClickToAdmin}
                                            style={{background:'transparent',
                                                fontSize:'x-large',
                                                marginTop:'5px'
                                            }}
                                            href='http://localhost:3000/login'
                                            target='_blank'
                                    >Sign in</Button>
                                </span>
                                <span><img width={150} src='https://s1.ax1x.com/2022/03/19/qEOlVJ.png'/></span>

                            </div>
                        </Col>
                    </Row>
                </div>


        </div>

            <div className='jkfl-product-wrapper'>
                <div className='jkfl-product-header-wrapper'>
                    <h1 id='product' className='jkfl-product-title'>尝试使用教考分离平台</h1>
                    <h4 className='jkfl-product-title-h4'>去挖掘平台的每一处惊艳</h4>
                </div>
                <div style={{width:'100%',marginTop:'10vh'}}>
                    <Row>
                        <Col span={12}>
                            <div style={{display:'flex'}}>
                                <div style={{marginLeft:'1vw'}}><img src='https://s1.ax1x.com/2022/03/19/qELwhq.png'/></div>
                                <div style={{marginLeft:'1vw',marginBottom:'4vh'}}>
                                    <p className='jkfl-product-ad'>基于SpringCloud构建微服务</p>
                                    <p className='jkfl-product-ad-describe'>教考分离平台完全基于SpringCloud后端开发，在集群部署环境下可以极大程度减少因为请求堵塞带来的不良体验。基于Cloud架构，系统可拓展性强也方面未来拓展为用户带来更好的使用体验。系统采用Jwt+SpringSecurity安全认证，可以确保用户的个人信息不会被滥用。</p>
                                </div>
                            </div>

                            <div style={{display:'flex'}}>
                                <div style={{marginLeft:'1vw'}}><img src='https://s1.ax1x.com/2022/03/19/qELLEd.png'/></div>
                                <div style={{marginLeft:'1vw',marginBottom:'4vh'}}>
                                    <p className='jkfl-product-ad'>独立的考试系统</p>
                                    <p className='jkfl-product-ad-describe'>学生端采用Vue编写，但是通过Electron进行打包，可以作为独立可执行程序运行，用户在用户机器上进行考试，并通过互联网像后端发送数据，极大程度减少了因为网络数据请求造成的阻塞。</p>
                                </div>
                            </div>

                            <div style={{display:'flex'}}>
                                <div style={{marginLeft:'1vw'}}><img src='https://s1.ax1x.com/2022/03/19/qEOSv8.png'/> </div>
                                <div style={{marginLeft:'1vw',marginBottom:'4vh'}}>
                                    <p className='jkfl-product-ad'>yolo分析检测</p>
                                    <p className='jkfl-product-ad-describe'>项目开辟了单独的flask服务器用于考试端的yolo检测，考试中设备会抓拍学生考试状态并进行分析，当检测到违规物品的时候将会上报给教师端。但由于学生端设备限制，正常情况下不建议开启摄像头监考模式。</p>
                                </div>
                            </div>

                            <div style={{display:'flex'}}>
                                <div style={{marginLeft:'1vw'}}><img src='https://s1.ax1x.com/2022/03/19/qEOPbQ.png' /></div>
                                <div style={{marginLeft:'1vw',marginBottom:'4vh'}}>
                                    <p className='jkfl-product-ad'>完善的全平台用户服务</p>
                                    <p className='jkfl-product-ad-describe'>教师端和管理端完成基于React构建并发布在互联网上，可以系统的设备上进行访问，从而达到全平台兼容。</p>
                                </div>
                            </div>
                        </Col>
                        <Col span={12}>
                            <div style={{marginLeft:'5vw'}}>
                                <img width={800} src='https://s1.ax1x.com/2022/03/19/qExvX6.png'/>
                            </div>
                        </Col>
                    </Row>

                </div>

            </div>

            <img className='jkfl-code-bg' src='https://www.opensuse.org/build/images/bg-contribution.svg'/>

            <div id='code' className='jkfl-code-wrapper'>
                <div style={{marginBottom:'10vh'}}/>
                <div className='jkfl-code-title-wrapper'>
                    <h2 className='jkfl-code-title'>贡献教考分离平台</h2>
                    <h4 className='jkfl-code-title-h4'>成为我们的一份子，或尝试改进我们的项目</h4>
                </div>

                <div>
                    <Row>
                        <Col span={12}>
                            <div className='jkfl-code-card-wrapper'>
                                <img width={120} src='https://s1.ax1x.com/2022/03/19/qVE2Qg.png'/>
                            </div>
                            <div className='jkfl-code-btn-wrapper'>
                                <Button btnType='link' style={{background:'transparent'}}>
                                    <div className='jkfl-code-font'>源代码</div>
                                </Button>
                            </div>

                        </Col>
                        <Divider type='vertical' className='jkfl-home-content-divider'/>
                        <Col span={12}>
                            <div className='jkfl-code-card-wrapper'>
                                <img width={120} src='https://s1.ax1x.com/2022/03/19/qVZKER.png'/>
                            </div>
                            <div className='jkfl-code-btn-wrapper'>
                                <Button btnType='link' style={{background:'transparent'}}>
                                    <div className='jkfl-code-font'>Blog</div>
                                </Button>
                            </div>
                        </Col>
                    </Row>
                </div>

                <div style={{textAlign:'center',marginTop:'10vh'}}>
                    <span><p style={{color:'#fff'}}>我们为每一位开发者提供了完善的文档指导</p></span>
                    <span><p style={{color:'#fff'}}>尝试Fork并了解我们的项目，为我们提出建议或帮助我们变得更好</p></span>
                </div>

            </div>
            </div>
        );
    }
}

export default Home;
