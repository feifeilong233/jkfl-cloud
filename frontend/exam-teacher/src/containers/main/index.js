import React from 'react'
import { Layout, Menu, Icon, Button } from 'antd';
const SubMenu = Menu.SubMenu;
const MenuItemGroup = Menu.ItemGroup;

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'

//actions
import * as subjectinfoActions from '../../actions/subjectinfo'
import * as classinfoActions from '../../actions/classinfo'

//路由组件
import { Route,Link,Switch  } from 'react-router-dom';

//头部条
import HeaderBar from './header_bar'

//课程首页
import Homepage from './homepage/index.js'

//题库管理
import QCheckin from './q_checkin/q_manage.js';
import QueryQuestion from "./q_checkin/query_question";

//试卷管理
import ChooseQuestions from './p_manage/add_paper.js';
import QueryPaper from "./p_manage/query_paper";

//成绩查询
import ScoreSearch from './score_search/index.js';

//学生管理组件
import AddStudent from './student_manage/add_student'
import QueryStudent from './student_manage/query_student'

//考试管理组件
import CreateExam from './paper_manage/create_exam.js';
import ScoringPaper from './paper_manage/scoring_paper.js';
import AllPapers from './paper_manage/all_papers.js';
import ReadingPaper from './paper_manage/reading_paper.js';

//个人中心
import ChangePassword from './personal_center/change_password';

import httpServer from '@components/httpServer.js'
import * as URL from '@components/interfaceURL.js'
import axios from "axios";
import {getJwtToken} from "../../lib/utils";
import ManualPaper from "./p_manage/manual_paper";
import ExamLook from "./paper_manage/exam_look";

class Main extends React.Component {
	constructor(){
		super();
		this.state = {
			defaultOpenKeys : [],//菜单默认打开项
			defaultSelectedKeys : [],//菜单默认选择项
			openKeys: [],//菜单打开项
			subjectArr:[],//科目数组
			roleSet : '',
		}
		this.rootSubmenuKeys = ['q_manage','p_manage','student_manage','paper_manage','personal_center'];
	}

	//根据路由判断 用户选择了菜单中的哪一项
	whoIsChecked(){
		if(this.props.location.pathname.indexOf('/main/q_checkin') != -1) {//题库管理
			this.setState({defaultOpenKeys : ['q_checkin']})
			this.setState({openKeys : ['q_checkin']})
			let arr = this.props.location.pathname.split('/');
			let str = arr[arr.length-2] + '_' + arr[arr.length-1];
			this.setState({defaultSelectedKeys : [str]})
		}
		else if(this.props.location.pathname.indexOf('/main/p_manage') != -1) {//试卷管理
			this.setState({defaultOpenKeys : ['p_manage']})
			this.setState({openKeys : ['p_manage']})
			let arr = this.props.location.pathname.split('/');
			let str = arr[arr.length-1];
			this.setState({defaultSelectedKeys : [str]})
		}
		else if(this.props.location.pathname.indexOf('/main/score_search') != -1) {//成绩查询
			this.setState({defaultSelectedKeys : ['score_search']})
		}
		else if(this.props.location.pathname.indexOf('/main/student_manage') != -1) {//学生管理
			this.setState({defaultOpenKeys : ['student_manage']})
			this.setState({openKeys : ['student_manage']})
			let arr = this.props.location.pathname.split('/');
			let str = arr[arr.length-1];
			this.setState({defaultSelectedKeys : [str]})
		}
		else if(this.props.location.pathname.indexOf('/main/paper_manage') != -1) {//考试管理
			this.setState({defaultOpenKeys : ['paper_manage']})
			this.setState({openKeys : ['paper_manage']})
			let arr = this.props.location.pathname.split('/');
			let str = arr[arr.length-1];
			this.setState({defaultSelectedKeys : [str]})
			if(this.props.location.pathname.indexOf('scoring') != -1) {
				this.setState({defaultSelectedKeys : ['scoring']})
			}
		}
		else if(this.props.location.pathname.indexOf('/main/personal_center') != -1) {//个人中心
			this.setState({defaultOpenKeys : ['personal_center']})
			this.setState({openKeys : ['personal_center']})
			let arr = this.props.location.pathname.split('/');
			let str = arr[arr.length-1];
			this.setState({defaultSelectedKeys : [str]})
		}
	}

	componentWillMount(){
		//判断用户是否已经登录
		if(!localStorage.getItem("userName")) {
			this.props.history.push('/login');//跳转至登录页
		}

		this.setState({roleSet : localStorage.getItem("roleSet")})

		//获取科目信息
		axios.post('http://localhost:8013/exam/subject_info',{},{
			headers:{
				"Authorization":getJwtToken()
			}
		})
			.then(response=>{
				//console.log(response.data.data);
				const {data} = response.data.data;
				this.setState({subjectArr : data});
				//状态存储
				this.props.subjectinfoActions.setSubjectInfo({
					subjectArr: this.state.subjectArr
				})
			})

		//菜单选择情况
		this.whoIsChecked();
	}

	//点击菜单，收起其他展开的所有菜单，保持菜单聚焦简洁。
	onOpenChange(openKeys) {
		const latestOpenKey = openKeys.find(key => this.state.openKeys.indexOf(key) === -1);
		if (this.rootSubmenuKeys.indexOf(latestOpenKey) === -1) {
			this.setState({ openKeys });
		} else {
			this.setState({
				openKeys: latestOpenKey ? [latestOpenKey] : [],
			});
		}
	}

	render(){
		// 动态渲染科目信息
		// let subjectArr = [];
		// this.state.subjectArr.forEach((item)=>{
		// 	subjectArr.push(
		// 		<MenuItemGroup key={"subject"+item.subjectid} title={item.subjectname}>
		// 			<Menu.Item key={item.subjectid+"_1"}><Link to={"/main/q_checkin/"+item.subjectid+"/1"}>初级</Link></Menu.Item>
		// 			<Menu.Item key={item.subjectid+"_2"}><Link to={"/main/q_checkin/"+item.subjectid+"/2"}>中级</Link></Menu.Item>
		// 			<Menu.Item key={item.subjectid+"_3"}><Link to={"/main/q_checkin/"+item.subjectid+"/3"}>高级</Link></Menu.Item>
		// 		</MenuItemGroup>
		// 	)
		// })

		return(
			<div>
				<div id="leftMenu">
					{/* <img className="logo" src="/sxt_exam/lqw/images/logo.jpg"/> */}
					<img className="logo" src={require("@assets/images/logo.png")}/>
					<span className="title">JKFL Online Exam</span>
					<div>
						<Layout>
								<Menu
									theme="light"
									mode="inline"
									defaultOpenKeys={this.state.defaultOpenKeys}
									defaultSelectedKeys={this.state.defaultSelectedKeys}
									openKeys={this.state.openKeys}
									onOpenChange={this.onOpenChange.bind(this)}
								>
									<Menu.Item key="homepage">
										<Link to="/main/homepage">
											<Icon type="home" />
											<span>课程主页</span>
										</Link>
									</Menu.Item>
									<SubMenu key="q_manage" title={<span><Icon type="form" /><span>题库管理</span></span>}>
										<SubMenu key="q_checkin" title={<span>试题录入</span>}>
											{/*{subjectArr}*/}
											<Menu.Item key={"q_checkin1"}><Link to={"/main/q_checkin/q_manage/1"}>初级</Link></Menu.Item>
											<Menu.Item key={"q_checkin2"}><Link to={"/main/q_checkin/q_manage/2"}>中级</Link></Menu.Item>
											<Menu.Item key={"q_checkin3"}><Link to={"/main/q_checkin/q_manage/3"}>高级</Link></Menu.Item>
										</SubMenu>
										<Menu.Item key="questions_manage"><Link to="/main/q_checkin/query_question">试题管理</Link></Menu.Item>
									</SubMenu>
									<SubMenu key="p_manage" title={<span><Icon type="profile" /><span>试卷管理</span></span>}>
										<Menu.Item key="p_manage"><Link to="/main/p_manage/add_paper">出卷</Link></Menu.Item>
										<Menu.Item key='manual_paper'><Link to='/main/p_manage/manual_paper'>手动出卷</Link></Menu.Item>
										<Menu.Item key="manage_paper"><Link to="/main/p_manage/query_paper">我的试卷</Link></Menu.Item>
									</SubMenu>
									<Menu.Item key="score_search">
										<Link to="/main/score_search">
											<Icon type="search" />
											<span>成绩查询</span>
										</Link>
									</Menu.Item>
									<SubMenu key="student_manage" title={<span><Icon type="usergroup-add" /><span>学生管理</span></span>}>
										<Menu.Item key="add_student"><Link to="/main/student_manage/add_student">添加学生</Link></Menu.Item>
										<Menu.Item key="query_student"><Link to="/main/student_manage/query_student">查询学生</Link></Menu.Item>
									</SubMenu>
									<SubMenu key="paper_manage" title={<span><Icon type="desktop" /><span>考试管理</span></span>}>
										<Menu.Item key="manage_exam"><Link to="/main/paper_manage/create_exam">创建考试</Link></Menu.Item>
										<Menu.Item key="scoring"><Link to="/main/paper_manage/scoring">我的考试</Link></Menu.Item>
										<Menu.Item key="exam_look"><Link to="/main/paper_manage/exam_look">监考</Link></Menu.Item>
									</SubMenu>
									<SubMenu key="personal_center" title={<span><Icon type="user" /><span>个人中心</span></span>}>
										<Menu.Item key="change_password"><Link to="/main/personal_center/change_password">用户信息</Link></Menu.Item>
									</SubMenu>
								</Menu>
						</Layout>
					</div>
				</div>
				<div id="rightWrap">
					<HeaderBar></HeaderBar>
					<div className="right-box">
						<Switch>
							{/* 主页 */}
							<Route path="/main/homepage" component={Homepage}/>

							{/* 题库管理 */}
							<Route path="/main/q_checkin/q_manage/:level" component={QCheckin}/>
							<Route path="/main/q_checkin/query_question" component={QueryQuestion}/>

							<Route path="/main/p_manage/add_paper" component={ChooseQuestions}/>
							<Route path='/main/p_manage/manual_paper' component={ManualPaper}/>
							<Route path="/main/p_manage/query_paper" component={QueryPaper}/>

							<Route path="/main/score_search" component={ScoreSearch}/>

							{/* 学生管理 */}
							<Route path="/main/student_manage/add_student" component={AddStudent}/>
							<Route path="/main/student_manage/query_student" component={QueryStudent}/>

							{/* 考试管理 */}
							<Route path="/main/paper_manage/create_exam" component={CreateExam}/>
							<Route path="/main/paper_manage/scoring/all_papers/reading_paper/:paperId/:classId/:pid/:examId" component={ReadingPaper}/>
							<Route path="/main/paper_manage/scoring/all_papers/:paperId/:classId/:examId" component={AllPapers}/>
							<Route path="/main/paper_manage/scoring" component={ScoringPaper}/>
							<Route path="/main/paper_manage/exam_look" component={ExamLook}/>

							{/* 个人中心 */}
							<Route path="/main/personal_center/change_password" component={ChangePassword}/>
						</Switch>
					</div>
				</div>
			</div>
		)
	}
}

function mapStateToProps(state) {
	return {
		subjectinfo: state.subjectinfo
	}
}

function mapDispatchToProps(dispatch) {
	return {
		subjectinfoActions: bindActionCreators(subjectinfoActions, dispatch),
		classinfoActions: bindActionCreators(classinfoActions, dispatch),
	}
}

export default connect(
	mapStateToProps,
	mapDispatchToProps
)(Main)
