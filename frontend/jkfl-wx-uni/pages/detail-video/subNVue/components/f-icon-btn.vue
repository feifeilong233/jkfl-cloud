<template>
	<view>
		<view class="video-btn" @click="$emit('click')">
		     <text class="iconfont text-white" 
			 :style="'font-size:'+size+'px;'">{{icon}}</text>
		</view>
	</view>
</template>

<script>
	export default{
			props:{
				icon:{
					type: String,
					default:'',
				},
				size:{
					type:[String,Number],
					size:20
				}
			}
	}
	
</script>

<style>
	.video-btn {
		height: 44px;
		width:44px;
		flex-direction:row;
		align-items: center;
		justify-content: center;
		
	}
</style>
