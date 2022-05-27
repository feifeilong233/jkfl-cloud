<template>
	<view class="py-2">
		<view class="px-3 py-2 align-center">
			<text class="font-md font-weight-bold">{{title}}</text>
		</view>
		<slot></slot>
		<view  v-if="showRefresh" @click="$emit('refresh')" 
		class="flex text-main align-center justify-center px-3 mt-1">
			<text class="iconfont iconshuaxin" hover-class="text-main-hovr"></text>
			<text class="ml-1">换一换</text>
		</view>
	</view>	
</template>
	
<script>
	export default {
			props: {
				title:String,
				showRefresh: {
					type: Boolean,
					default: true
				},
			},
		}
</script>

<style>
</style>
