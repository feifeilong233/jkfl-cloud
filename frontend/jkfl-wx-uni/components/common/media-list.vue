<template>
	<view style="width: 100%;" class="flex align-center py-2 border-bottom">
		<image :src="item.photo" style="width: 260rpx;height: 160rpx;" class="rounded-lg mx-2 flex-shrink"></image>
		<view class="flex-1 flex flex-column">
			<text class="font" style="line-height: 1.2;">{{item.title}}</text>
			<text class="font-sm text-light-muted mt-auto">{{item.create_time}}</text>
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
</template>

<script>
	export default {
		props: {
			item: Object,
			index:[String,Number]
		},
	}
</script>

<style>
</style>
