import App from './App'

// #ifndef VUE3
import Vue from 'vue'

Vue.config.productionTip = false

App.mpType = 'app'

const app = new Vue({
    ...App
})
app.$mount()

// #endif

Date.prototype.format = function(fmt) {
	var o = {
		"M+": this.getMonth() + 1, //月份 
		"d+": this.getDate(), //日 
		"h+": this.getHours(), //小时 
		"m+": this.getMinutes(), //分 
		"s+": this.getSeconds(), //秒 
		"q+": Math.floor((this.getMonth() + 3) / 3), //季度 
		"S": this.getMilliseconds() //毫秒 
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	}
	for (var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;
}


// #ifdef VUE3
import { createSSRApp } from 'vue'
export function createApp() {
	const app = createSSRApp(App)
	
	let baseUrl = 'http://localhost:8099/wx-server';
	let videoUrl = 'http://localhost:8055';
	
	app.config.globalProperties.url = {
		// teach wx
		register: baseUrl + '/user/register',
		login: baseUrl + '/user/login',
		searchMeetingListByPage: baseUrl + '/meeting/searchMeetingListByPage',
		searchUserGroupByDept: baseUrl + '/user/searchUserGroupByDept',
		searchMembers: baseUrl + '/user/searchMembers',
		checkin: baseUrl + '/checkin/checkin',
		createFaceModel: baseUrl + '/checkin/createFaceModel',
		validCanCheckin: baseUrl + '/checkin/validCanCkeckIn',
		searchTodayCheckin: baseUrl + '/checkin/searchTodayCheckin',
		searchUserSummary: baseUrl + "/user/searchUserSummary",
		searchMonthCheckin: baseUrl + '/checkin/searchMonthCheckin',
		refreshMessage: baseUrl + '/message/refreshMessage',
		searchMessageByPage: baseUrl + '/message/searchMessageByPage',
		searchMessageById: baseUrl + '/message/searchMessageById',
		updateUnreadMessage: baseUrl + '/message/updateUnreadMessage',
		deleteMessageRefById: baseUrl + '/message/deleteMessageRefById',
		
		
		//video
		getInfoList1: videoUrl + '/info/getInfoList1',
		getInfoList2: videoUrl + '/info/getInfoList2',
		getInfoList3: videoUrl + '/info/getInfoList3',
		findVideoById: videoUrl + '/video/findVideoById',
		recommoandList: videoUrl + '/video/recommoandList',
		findCollection: videoUrl + '/video/findCollection'
	}
	
	app.config.globalProperties.ajax = function(url, method, data, fun){
		uni.request({
			'url': url,
			'method': method,
			'header': {
				token:uni.getStorageSync("token")
			},
			'data': data,
			success:function(resp){
				if(resp.statusCode === 401){
					uni.redirectTo({
						url:'/pages/login/login.vue'
					})
				}
				else if(resp.statusCode === 200 && resp.data.code === 200){
					let data = resp.data;
					if(data.hasOwnProperty('token')){
						let token = data.token;
						console.log(token);
						uni.setStorageSync('token', token);
					}
					fun(resp);
				}
				else if(resp.data.code === 2000){
					fun(resp);
				}
				else{
					uni.showToast({
						icon:'none',
						title: "请求错误"
					})
				}
			}
		})
	}
	
	//鉴权
	app.config.globalProperties.checkPermission = function(perms) {
		let permission = uni.getStorageSync("permission")
		let result = false
		if(permission.indexOf('ROOT') != -1){
			result = true;
			console.log('Root权限 直接结束了')
		}
		else{
			console.log('不是Root，开始鉴权')
			for (let one of perms) {
				if (permission.indexOf(one) != -1) {
					result = true;
					break;
				}
			}
		}
		console.log('纪律性测试')
		return result;
	}
	
	return {
		app
	}
}
// #endif