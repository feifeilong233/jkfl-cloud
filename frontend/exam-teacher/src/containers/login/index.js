import React from 'react'
import { Form, Icon, Input, Button, Checkbox } from 'antd';
const FormItem = Form.Item;
import { Link } from 'react-router-dom'

import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'

//actions
import * as userinfoActions from '../../actions/userinfo'

import { axiosLogin } from './axios'
import axios from "axios";
import {setJwtToken} from "../../lib/utils";
import {userport} from "../../constants/webport";

class Login extends React.Component {

	constructor(){
		super()
		this.state = {
			loginTip : ''
		}
	}

	handleSubmit(e){
		e.preventDefault();
		this.props.form.validateFields((err, values) => {
			if (!err) {

				axios.post(userport+'/usr/login?tel='+values.userName+'&pwd='+values.password+'&type=2')
					.then(response=>{
						const {message} = response.data;
						//console.log(message);
						if (message === '密码错误')
							this.setState({loginTip : "登录名或密码错误"})
						else{
							setJwtToken(message);

							//发送Action 向Store 写入用户名和密码
							this.props.userinfoActions.login({
								userName: values.userName
							})

							//本地存储用户名
							localStorage.setItem("userName",values.userName);
							localStorage.setItem("roleSet",'stu')

							//跳转主页
							this.props.history.push('/main/homepage');//react-router 4.0 写法
						}

					})
					.catch(err=>console.log(err));
			}
		});
	}

	render(){
		const { getFieldDecorator } = this.props.form;
		return(
			<div className="login">
				<div className="login-content-wrap">
					<div className="login-content">
						{/* <img className="logo" src="/sxt_exam/lqw/images/logo.jpg"/> */}
						<img className="logo" src={require("@assets/images/logo.png")}/>
						<span className="title">JKFL Online Exam</span>
						<div className="login-from">
							<div className="login-tip">{this.state.loginTip}</div>
							<Form onSubmit={this.handleSubmit.bind(this)} className="login-form">
								<FormItem>
									{getFieldDecorator('userName', {
										rules: [{ required: true, message: '请输入用户名！' }],
									})(
										<Input prefix={<Icon type="user" style={{ color: 'rgba(0,0,0,.25)' }} />} placeholder="用户名" />
									)}
								</FormItem>
								<FormItem>
									{getFieldDecorator('password', {
										rules: [{ required: true, message: '请输入密码！' }],
									})(
										<Input prefix={<Icon type="lock" style={{ color: 'rgba(0,0,0,.25)' }} />} type="password" placeholder="密码" />
									)}
								</FormItem>
								<FormItem>
									<Button type="primary" htmlType="submit" className="login-form-button">
										登录
									</Button>
								</FormItem>
							</Form>
						</div>
					</div>
				</div>
			</div>
		)
	}
}

//传递state给子组件
function mapStateToProps(state) {
	return {
		userinfo: state.userinfo
	}
}

//组合userinfoActions和dispatch的对象传递给子组件
//在子组件中，调用userinfoActions.action1,相当于实现了store.dispatch(action1)
//于是我们就实现了在没有store和dispatch组件中，如何调用dispatch(action)
function mapDispatchToProps(dispatch) {
	return {
		userinfoActions: bindActionCreators(userinfoActions, dispatch)
	}
}

export default connect(
	mapStateToProps,
	mapDispatchToProps
)(Form.create()(Login))
