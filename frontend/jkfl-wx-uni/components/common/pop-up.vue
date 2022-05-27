<template>
	<view>
		<view v-if="showStatus" class="animated faster fadeIn position-fixed left-0 top-0 right-0 bottom-0" style="background-color: rgba(0,0,0,0.3);z-index: 9999;" @click="hidenPop">
			<slot></slot>
		</view>
	</view>
</template>

<script>
	export default{
		data() {
			return {
				showStatus: false
			}
		},
		methods:{
			showPop() {
				this.showStatus = true;
			},
			hidenPop() {
				this.showStatus = false;
			}	
		}
	}
</script>

<style>
</style>
