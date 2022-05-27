<template>
	<view class="flex" style="min-height:100rpx;">
		<view class="flex font-md justify-center align-center" style="width: 120rpx;height:100rpx">{{label}}</view>
		<view class="flex flex-1 align-center pl-3  font-md">
			<slot></slot>
		</view>
		<view v-if="iconRight" class="flex align-center justify-center" style="height: 100rpx;width: 80rpx;">
			<text class="iconfont iconjinru text-light-muted"></text>
		</view>
	</view>	
</template>

<script>
	export default {
		props:{
			label: {
				type: String,
				default: "标题"
			},
			iconRight: {
				type: Boolean,
				default: false
			}
				
		}
	}
</script>

<style>
</style>
