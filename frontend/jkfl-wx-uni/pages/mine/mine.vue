<template>
	<view class="page">
		<view class="user-info">
			<view class="border-outer">
				<view class="border-inner">
					<image :src="photo" mode="widthFix" class="photo"></image>
				</view>
			</view>
			<view class="summary">
				<view>
					<text class="title">姓名</text>
					<text class="value">{{name}}</text>
				</view>
				<view>
					<text class="title">身份</text>
					<text class="value">学生</text>
				</view>
				<view>
					<text class="title">状态</text>
					<text class="value">正常</text>
				</view>
			</view>
		</view>
		<view class="list-title">用户信息栏目</view>
		<uni-list>
			<uni-list-item title="个人资料" link to=""></uni-list-item>
			<uni-list-item title="我的考勤" link to="/pages/my_checkin/my_checkin"></uni-list-item>
			<uni-list-item title="缺课记录" link to=""></uni-list-item>
		</uni-list>
		
	</view>
</template>

<script>
import uniList from '@/components/uni-list/uni-list.vue';
import uniListItem from '@/components/uni-list-item/uni-list-item.vue';
export default{
	components:{
		uniList,
		uniListItem
	},
	data(){
		return {
			name:"",
			deptName:"",
			photo:""
		}
	},
	onShow:function(){
		let that=this
		that.ajax(that.url.searchUserSummary,"GET",null,function(resp){
			let result=resp.data.result
			console.log(result)
			that.name=result.name
			that.deptName=result.deptName
			that.photo=result.photo
		})
	},
	methods:{
		
	}
}
</script>

<style lang="less">
	@import url('mine.less');
</style>