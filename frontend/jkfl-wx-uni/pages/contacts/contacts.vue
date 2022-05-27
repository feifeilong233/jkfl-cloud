<template>
	<view>
		<!-- #ifdef MP -->
		<!-- 小程序导航栏 -->
		<view class="flex align-center fixed-top" style="background-color: #F6F7F8;height: 44px;">
			<view class="flex flex-1 px-1 ml-2 rounded-circle " style="background-color: #fff;color: #959FA0;">
				<text class="iconfont iconsousuokuang"></text>
				<text class="align-center mt-1 pl-1">请输入搜索内容</text>
			</view>
			<view class="flex align-center px-2" style="color: #959FA0;">分类</view>
		</view>
		<view style="height: 44px;"></view>
		<!-- #endif -->
		
		
		<!-- 轮播图 -->
		<view class="px-2 py-1">
			<swiper-dot :info="swipers" :current="current">
				<swiper circular :autoplay="true" :interval="3000" :duration="300" style="height: 250rpx;"  @change="changeSwiper">
					<swiper-item v-for="(items,index) in swipers" :key="index">
						<image  class="rounded-lg" style="height: 250rpx;width: 100%;" :src="items.src" mode="aspectFill"></image>
					</swiper-item>
				</swiper>
			</swiper-dot>
		</view>
		
		<view style="margin-top: 10rpx;margin-bottom: 10rpx;">
			<button @tap="gotoUpload()">上传</button>
			
			
		</view>
		
		
		<!-- 为你推荐 1 -->
		<card title="为你推荐 - 1" @refresh="data1Refresh()">
			<view class="f-list">
				<view v-for="i in data1" :key="i.id" 
				class="mt-2" style="margin-left: 15rpx;margin-right: 15rpx;width:328rpx;"  
				@click="navTo(i.id)">
					<view style="position: relative;height: 220rpx">
						<image :src="i.photo" mode="" 
						class="rounded-lg" style="width:100%;height:220rpx;" ></image>
						
						<view class="flex text-white" 
						style="height: 65rpx;position:absolute;left:0;right:0;bottom:0;background-image: linear-gradient(to bottom,rgba(0,0,0,0),rgba(0,0,0,0.8));">
							<text class="iconfont iconbofangshu font-md mx-1"></text>
							<text class="">250W</text>
							<text class="iconfont icondanmushu font-md mx-1"></text>
							<text class="">3779</text>
						</view>
					</view>
					<view class="px-1 pb-1 border" >
						<view class="font fx-font">{{i.title}}</view>
						<view class="flex text-light-muted align-center justify-between">
							<view class="font">标签</view>
							<view class="iconfont icongengduo">{{i.label}}</view>
						</view>
					</view>
				</view>
			</view>
		</card>	
			
			
		<!-- 为你推荐 2 -->
		<card title="为你推荐 - 2" @refresh="data2Refresh()">
			<view class="f-list">
			    <view  v-for="i in data2" :key="i.id" 
				class="mt-2" style="margin-left: 15rpx;margin-right: 15rpx;width:210rpx;">
					<view style="position:relative;height: 280rpx;">
						<image :src="i.photo" mode="scaleToFill" class="rounded-lg" 
						style="width:100%;height: 280rpx;" ></image>
						
						<view class="flex text-white align-center" 
						style="height:50rpx;position: absolute;left:0;right:0;bottom:0;background-image: linear-gradient(to bottom,rgba(0,0,0,0),rgba(0,0,0,0.8));">
							<text class="iconfont iconbofangshu font-md mx-1"></text>
							<text class="font">250w</text>
						</view>
					</view>
					<view class="px-1 pb-1 border" >
						<view class="font fx-font">{{i.title}}</view>
					</view>
				</view>	
			</view>
		</card>		
		
		<!-- 为你推荐3 -->
		<card title="为你推荐 - 3" @refresh="data3Refresh()">
			<view class="f-list"  >
			    <view v-for="(item,index) in data3" :key="index"  style="width: 100%;">
			    	<media-list :item="item" :index="index"></media-list>
				</view>	
			</view>
		</card>		
	</view>	
</template>

<script>
	import swiperDot from '@/components/common/swiper-dot.vue';
	import card from '@/components/common/card.vue';
	import mediaList from '@/components/common/media-list.vue';
	
	export default {
		components:{
			swiperDot,
			card,
			mediaList
		},
		data() {
			return {
				data1:[],
				data2: [],
				data3: [],
				current: 0,
				swipers:[{
					 src:"https://jkfl-1306384632.cos.ap-nanjing.myqcloud.com/swipper-6.png",
					 title:"Swipper - 1"
					},{
					 src:"https://jkfl-1306384632.cos.ap-nanjing.myqcloud.com/swipper-7.png",
					 title:"Swipper - 2"
					},{
					 src:"https://jkfl-1306384632.cos.ap-nanjing.myqcloud.com/swipper-8.png",
					 title:"Swipper - 3"
					}]
			}
		},
		onShow:function(){
			console.log('Video Info show')
			let that = this;
			that.ajax(that.url.getInfoList1, "POST", null, function(resp){
				const {data1} = resp.data.data;
				//console.log('data1',data1);
				that.data1 = data1;
			})
			
			that.ajax(that.url.getInfoList2, "POST", null, function(resp){
				const {data2} = resp.data.data;
				//console.log('data1',data1);
				that.data2 = data2;
			})
			
			that.ajax(that.url.getInfoList3, "POST", null, function(resp){
				const {data3} = resp.data.data;
				//console.log('data1',data1);
				that.data3 = data3;
			})
		},
		methods: {
			gotoUpload:function(){
				uni.navigateTo({
					url:'../upload_video_file/upload_video_file'
				})
			},
			changeSwiper(e) {
				// console.log(e);
				this.current = e.detail.current;
			},
			navTo(id){
				uni.navigateTo({
					url:"../detail-video/detail-video?sid="+id
				})
			},
			data1Refresh:function(){
				let that = this;
				that.ajax(that.url.getInfoList1, "POST", null, function(resp){
					const {data1} = resp.data.data;
					//console.log('data1',data1);
					that.data1 = data1;
				})
			},
			data2Refresh:function(){
				let that = this;
				that.ajax(that.url.getInfoList2, "POST", null, function(resp){
					const {data2} = resp.data.data;
					that.data2 = data2;
				})
			},
			data3Refresh:function(){
				let that = this;
				that.ajax(that.url.getInfoList3, "POST", null, function(resp){
					const {data3} = resp.data.data;
					that.data3 = data3;
				})
			}
		}
	}
</script>

<style lang="less">
@import url('contacts.less');
.fx-font{
	overflow: hidden;
	text-overflow:ellipsis;
	white-space: nowrap;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 3;
}
</style>
