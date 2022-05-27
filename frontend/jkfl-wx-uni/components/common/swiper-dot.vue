<template>
	<view class="position-relative">
		<slot></slot>
		<view style="position:absolute;bottom: 0;left: 0;right: 0;height:60rpx;background-image: linear-gradient(to bottom,rgba(0,0,0,0),rgba(0,0,0,0.8));" class="flex align-center text-white rounded-bottom-lg">
			<view class="ml-1" style="width: 80%;">
				{{info[current].title}}
			</view>
			<view style="width: 20%;" class="flex">
				<view v-for="(items,index) in info" :key="index" 
				:style="index === current ? 'background-color: rgba(255,255,255,1)' : 'background-color: rgba(255,255,255,0.5)'" 
				class="rounded ml-1" 
				style="height: 16rpx;width: 16rpx;">
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		props: {
			info:Array,
			current:{
				type:Number,
				default:0
			}
		},
	}
</script>

<style>
</style>
