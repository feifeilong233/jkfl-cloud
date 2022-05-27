<template>
	<view class="flex px-3 align-center" hover-class="bg-light" style="height: 115rpx;" @click="$emit('click')">
			<text class="iconfont" v-if="icon" :class="icon"></text>
			<view class="font-md text-muted mr-auto ml-1">{{title}}</view>
			<view class="font-md text-light-muted">{{rightText}}</view>
			<text v-if="showRightIcon" class="iconfont iconjinru text-light-muted"></text>
	</view>
</template>

<script>
	export default{
		props:{
			icon:{
				type:String,
				default:""
			},
			title:{
				type:String,
				default:""
			},
			rightText:{
				type:String,
				default:"",
			},
			showRightIcon:{
				type:Boolean,
				default:true
			}	
		}
	}
</script>

<style>
</style>
