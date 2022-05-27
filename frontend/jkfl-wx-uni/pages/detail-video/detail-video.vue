<template>
	<view>
		<!-- #ifndef APP-PLUS -->
		<video :src="data.vdoPath" style="height: 225px; width: 750rpx;" controls></video>
		<!-- #endif -->
		<scroll-view scroll-y="true" :style="'height:'+scrollH+'px;'" >
			<view  class="border-bottom border-light-secondary flex align-stretch bg-white" 
			style="height: 80rpx;position: fixed;left: 0;right: 0;z-index: 100;">
				<view class="flex-1 flex align-center  justify-center" 
				v-for="(item,index) in tabBars" :key="index" @click="changeTab(index)">
					<text  
					:class="tabIndex == index ? 'text-main border-main' : ''"  
					:style="tabIndex == index ? 'border-bottom: 5rpx solid;':''"
					>{{item.name}}</text>
				</view>
			</view>
			<view style="height: 80rpx;"></view>
			<view class="px-3">
				<view v-if="tabIndex === 0">
					<view class="flex justify-center align-center">
						<image src="/static/user.png" mode="aspectFill" class="rounded-circle" style="height: 80rpx; width: 80rpx;"></image>
						<view class="flex flex-column pl-3">
							<text class="text-main font-md">昵称</text>
							<text class="font-sm text-muted" style="line-height: 1;">369 粉丝</text>
						</view>
						<view class="flex align-center justify-center rounded bg-main text-white py-1 px-2 ml-auto" hover-class="bg-main-hover">
							<text class="font-sm">关注</text>
						</view>
					</view>
					<view class="font-md text-left  mt-1">{{data.vdoName}}</view>
					<view class="flex text-light-muted">
						<text class="iconfont iconbofangshu font-md mr-1"></text>
						<text class="mr-1">250w</text>
						<text class="iconfont icondanmushu font-md mr-1"></text>
						<text class="mr-1">5960</text>
						<text >{{data.createTime}}</text>
					</view>
					<!-- 选集滚动 -->
					<view class="border-top border-bottom border-light-secondary py-1">
						<view class="flex text-center">
							<view class="font-md">选集</view>
							<view class="flex align-center text-muted ml-auto" @click="openPopup">
								共9集<text class="iconfont iconjinru ml-1"></text>
							</view>
						</view>
						<scroll-view scroll-x="true" class="scroll-row mt-2">
							<view v-for="i in collections" :key="i.id" class="scroll-row-item rounded border  ml-2 p-2 border  border-main" style="width: 340rpx;" 
							:style="i.title === data.vdoName?'color: #FB7299; border-color:#FB7299':' color: #A9A5A0;'">
								<text class="font">第 {{i.id}} 集</text>
								<view class="font-md text-ellipsis">{{i.title}}</view>
							</view>
						</scroll-view>
					</view>
					
					<view class="f-list">
						<view v-for="(item,index) in like" :key="index" style="width: 100%;" class="flex align-center py-2 border-bottom">
							<image :src="item.vdoPhoto" style="width: 260rpx;height: 160rpx;" class="rounded-lg mx-2 flex-shrink"></image>
							<view class="flex-1 flex flex-column">
								<text class="font" style="line-height: 1.2;">{{item.vdoName}}</text>
								<text class="font-sm text-light-muted mt-auto">{{item.createTime}}</text>
								<view class="flex align-center justify-between text-muted line-h">
									<view class="line-h">
										<text class="iconfont iconbofangshu font-md mx-1"></text>
										<text class="font-sm">{{item.watch}}</text>
									</view>
									<view class="line-h">
										<text class="iconfont icondanmushu font-md mx-1"></text>
										<text class="font-sm">{{item.good}}</text>
									</view>
									<text class="iconfont icongengduo"></text>
								</view>
							</view>
						</view>
					</view>
					
					<pop-up ref="popup">
						<view class="position-absolute bottom-0 left-0 right-0 bg-white animated faster fadeIn" @click.stop="stop">
							<view style="height: 600rpx;">
								<view class="flex align-center">
									<text class="font-md ml-3">选集</text>
									<view class="flex align-center justify-center ml-auto" style="width: 80rpx;height: 80rpx;" hover-class="bg-light" @click="hidePopup">
										<text class="iconfont iconguanbi text-muted"></text>
									</view>
								</view>
								<scroll-view scroll-y="true" style="height: 520rpx;">
									<view class="flex flex-wrap">
										<view style="width: 50%;box-sizing: border-box;" v-for="i in collections" :key="i.id" class="p-2">
											<view class="rounded border p-2 " :class="i.title === data.vdoName ? 'text-main border-main' : 'text-muted border-light-secondary'">
												<text class="font">第 {{i.id}} 集</text>
												<view class="font-md text-ellipsis">{{i.title}}</view>
											</view>
										</view>
									</view>
								</scroll-view>
							</view>
						</view>
					</pop-up>
				</view>
				<view v-else>
					<view class="uni-comment-list">
							<view class="uni-comment-face">
								<image src="/static/user.png" style="width: 80rpx;height: 80rpx;" class="rounded-circle"></image>
							</view>
							<view class="uni-comment-body">
								<view class="uni-comment-top">
									<text class="font text-main">用户1</text>
								</view>
								<view class="uni-comment-date">
									<text class="font-sm text-muted">10:10</text>
								</view>
								<view class="uni-comment-content">
									评论内容
								</view>
								
								<view class="flex flex-wrap p-2 bg-light rounded">
									<text class="font text-main">昵称2：</text>
									回复功能
								</view>
								<view class="position-fixed flex align-center justify-center bg-main rounded-circle animated fast" hover-class="bg-main-hover pulse" style="width: 120rpx;height: 120rpx;right: 50rpx;bottom: 50rpx;" @click="openComment">
									<text class="text-white iconfont iconjia">+</text>
								</view>
							</view>
							<pop-up ref="comment">
								<view class="position-absolute bottom-0 left-0 right-0 bg-white animated faster fadeIn" @click.stop="stop">
									<view style="height: 100rpx;" class="flex align-center px-3">
										<input type="text" value="" class="bg-light rounded mr-3 px-2 flex-1" style="height: 60rpx;" placeholder="说一句话吧"/>
										<view class="flex align-center justify-center rounded bg-main text-white py-1 px-2 ml-auto" hover-class="bg-main-hover">
											<text class="font">发布</text>
										</view>
									</view>
								</view>
							</pop-up>
					</view>	
					<!---->
				</view>	
			</view>	
		</scroll-view>
	</view>
</template>

<script>
	import mediaList from '@/components/common/media-list.vue';
	import popUp from '@/components/common/pop-up.vue';
	export default{
		components:{
			mediaList,
			popUp
		},
		data(){
			return {
				scrollH:500,
				id:'',
				tabIndex:0,
				data:{},
				collections:[],
				like: [],
				tabBars:[{
					name:"简介"
				},{
					name:"评论"
				}]
			
			}
		},
		created() {
			let res = uni.getSystemInfoSync();
			this.scrollH = res.windowHeight - 226;
		},
		onLoad:function(options){
			this.id = options.sid;
		},
		onShow:function(){
			let that = this;
			let id = that.id;
			console.log('id', id);
			
			/* 查询基本信息 */
			that.ajax(that.url.findVideoById+"?id="+id, "POST", null,function(resp){
				const {data} = resp.data.data;
				console.log('video data', data);
				that.data = data;
			})
			
			/* 5条推荐信息 */
			that.ajax(that.url.recommoandList+"?label=技术", "POST", null, function(resp){
				const {data} = resp.data.data;
				console.log('video 5 likes data', data);
				that.like = data;
			})
			
			/* 合集列表 */
			let collectionsss = "前后端分离-实战wiki知识库系统"
			that.ajax(that.url.findCollection+"?collection="+collectionsss, "POST",null,function(resp){
				const {data} = resp.data.data;
				console.log('video collection data', data);
				that.collections = data;
			})
			xian1
			
		},
		methods:{
			stop(){ },
			changeTab(index){
				this.tabIndex = index;
				console.log(index);
			},
			// 弹出选集
			openPopup(){
				this.$refs.popup.showPop()
			},
			hidePopup(){
				this.$refs.popup.hidenPop()
			},
			openComment(){
				this.$refs.comment.showPop()
			}
		}
	}
</script>

<style>
</style>
