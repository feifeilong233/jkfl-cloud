<template>
	<view class="page">
		<image src='../../static/logo-3.jpg' mode="widthFix" class="logo"></image>
		<view class="add" v-if="checkPermission(['ROOT','MEETING:INSERT'])" @tap="toMeetingPage(null, 'insert')">
			<image src="../../static/icon-17.png" mode="widthFix" class="icon"></image>
			<text>创建会议</text>
		</view>
		<view v-for="item in list" :key="item.date">
			<view class="list-title">{{item.date}}</view>
			<view class="item" v-for="meeting in item.list" :key="meeting.id">
				<view class="header">
					<view class="left">
						<image 
						v-if="meeting.type==='线上会议'"
						src="../../static/icon-11.png" 
						mode="widthFix" 
						class="icon"
						></image>
						<image
						v-if="meeting.type==='线下会议'"
						src="../../static/icon-11.png" 
						mode="widthFix" 
						class="icon"
						></image>
						<text>{{meeting.type}}</text>
						<text :class="meeting.status==='未开始'?'blue':'red'">（{{meeting.status}})</text>
					</view>
					<view class="right">
						<text>编辑</text>
					</view>
				</view>
				<view class="content">
					<view class="title">{{meeting.title}}</view>
					<view class="attr">
						<view class="timer">
							<image src="../../static/icon-14.png" mode="widthFix" class="icon"></image>
							<text>{{meeting.start}} ~ {{meeting.end}}</text>
						</view>
						<view class="creator">
							<image src="../../static/icon-15.png" mode="widthFix" class="icon"></image>
							<text>{{meeting.name}}</text>
						</view>
						<view class="place" v-if="meeting.type==='线下会议'">
							<image src="../../static/icon-16.png" mode="widthFix" class="icon"></image>
							<text>{{meeting.place}}</text>
						</view>
					</view>
					<view class="desc">{{meeting.desc}}</view>
					<button class="btn" v-if="meeting.type==='线上会议'">进入</button>
				</view>
				
				
			</view>
		</view>	
	</view>
</template>

<script>
export default{
	data(){
		return{
			page: 1,
			length: 20,
			list: [],
			isLastPage: false
		}
	},
	onShow:function(){
		//console.log('onShow');
		let that = this;
		that.page = 1;
		that.isLastPage = false;
		that = [];
		this.loadMeetingList(this);
	},
	onReachBottom:function(){
		//console.log("达到Bottom，请求后端");
		let that = this;
		if(that.isLastPage)
			return;
		that.page = that.page + 1;
		this.loadMeetingList(this);
	},
	methods:{
		loadMeetingList:function(ref){
			let data = {
				page:ref.page,
				length:ref.length
			};
			//console.log(ref)
			ref.ajax(ref.url.searchMeetingListByPage, "POST", data, function(resp){
				//console.log(resp)
				let result = resp.data.result;
				console.log(result)
				if(result===null || result.length===0){
					ref.isLastPage = true;
					ref.page = ref.page - 1;
					if(ref.page > 1){
						uni.showToast({
							icon:'none',
							title:'已经到底了'
						})
					}
				}
				else{
					for(let item of result){
						for(let meeting of item.list){
							if(meeting.type === 1)
								meeting.type = "线上会议";
							else if(meeting.type === 2)
								meeting.type = "线下会议";
							
							if(meeting.status === 3)
								meeting.status = "未开始";
							else if(meeting.start === 4)
								meeting.status = "进行中";
						}
						if(ref.list.length > 0){
							let last = ref.list[ref.list.length - 1];
							if(last.date === item.date){
								last.list = last.list.concat(item.list);
							}
							else{
								ref.list.push(item);
							}
						}
						else{
							ref.list.push(item);
						}
					}
				}
			})
		},
		toMeetingPage:function(id,opt){
			uni.navigateTo({
				url:'../meeting/meeting?id='+id+"&opt="+opt
			})
		}
		
	}
}
</script>

<style lang="less">
	@import url('meeting_list.less');
</style>