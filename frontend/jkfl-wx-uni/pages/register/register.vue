<template>
	<view>
		<image src="../../static/logo-2.png" mode="widthFix" class="logo"></image>
		<view class="register-container">
			<input 
			type="text" 
			placeholder="请输入你的邀请码"
			class="register-code"
			maxlength="6"
			v-model="registerCode"
			/>
			<view class="register-desc">学院教师创建学生账号之后，你可以在你的个人邮箱中获得注册邀请码</view>
			<button class="register-btn" open-type="getUserInfo" @tap="register()">执行注册</button>
		</view>
	</view>
</template>

<script>
	export default{
		data(){
			return{
				registerCode: '',
				
			}
		},
		methods: {
			register:function(){
				/* 非空验证 */
				let that = this;
				if(that.registerCode == null | that.registerCode.length == 0){
					uni.showToast({
						icon:'none',
						title:'邀请码不能为空'
					})
					return;
				}
				else if(/^[0-9]{6}$/.test(that.registerCode) == false){
					uni.showToast({
						icon:'none',
						title:'邀请码必须为6位'
					})
					return;
				}
				
				uni.login({
					provider:'weixin',
					success:function(resp){
						console.log(resp)
						let code = resp.code;
						uni.getUserInfo({
							provider:'weixin',
							success:function(resp){
								let {nickName, avatarUrl} = resp.userInfo;
								let data = {
									code: code,
									nickname: nickName,
									photo: avatarUrl,
									registerCode: that.registerCode
								};
								that.ajax(that.url.register, "POST", data, function(resp){
									let permission = resp.data.permission;
									uni.setStorageSync('permissions', permission);
									console.log(permission)
									//TODO 跳转到index页面
									
								})
							}
						})
					},
					fail:function(){
						
					}
				})
			}
		}
	}
</script>

<style lang="less">
	@import url('register.less');
</style>