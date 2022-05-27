<template>
	<view>
		<image src='../../static/logo-1.png' class="logo" mode="widthFix"></image>
		<view class="logo-title">JKFL在线学习教育系统</view>
		<view class="logo-subtitle">Ver 2022.5.11-alpha0.001</view>
		<button class="logo-btn" open-type="getUserInfo" @tap="toLogin()">登陆系统</button>
		<view class="register-container">
			没有账号？
			<text class="register" @tap="toRegister()">立即注册</text>
		</view>
	</view>
	
</template>

<script>
	export default{
		data(){
			return{
				
			}
		},
		methods:{
			toRegister:function(){
				uni.navigateTo({
					url:'../register/register'
				})
			},
			toLogin:function(){
				let that = this;
				uni.login({
					provider:'weixin',
					success: function(resp){
						let {code} = resp;
						that.ajax(that.url.login, "POST", {'code':code},function(resp){
							let permission = resp.data.permissions;
							console.log('permission', permission)
							uni.setStorageSync('permission',permission)
						})
						//TODO 跳转到登陆页面
						uni.switchTab({
							url:"../index/index"
						})
					},
					fail:function(e){
						console.log(e)
						uni.showToast({
							icon:'none',
							title:'执行异常'
						})
					}
				})
			}
		}
	}
	
</script>

<style lang="less">
	@import url('login.less');
	
	
</style>