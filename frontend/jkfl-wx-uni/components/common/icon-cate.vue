<template>
	<view class="align-center icon-cate" style="">
		<image :src="item.cover" mode="" class="mt-1" style="width: 70rpx; height: 70rpx;"></image>
		<text class="text-muted font-md mt-1">{{item.name}}</text>
	</view>
</template>

<script>
	export default{
		props:{
			item: Object,
			index:[Number,String]
		}
	}
</script>

<style>
	.icon-cate {
		width: 187.5rpx;
		height: 187.5rpx;
		line-height: 1;
		display: inline-flex!important;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}
</style>
