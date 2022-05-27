<template>
	<view>
		<view class="flex align-center  position-relative" 
		@touchstart="touchstart" 
		@touchmove="touchmove" 
		@touchend="touchend" 
		@touchcancle="touchcancel"
		style="height:44px;">
			<view class="flex-1 rounded" style="height: 3px;background-color:rgba(255,255,255,0.5);">
				<view class="bg-main" style="height:3px;"  :style="activeStyle"></view>
			</view>
			<view class="position-absolute bg-main-hover rounded-circle" style="height: 15px;width:15px;"  :style="activeDotStyle"></view>
		</view>
	</view>
</template>

<script>
	export default{
		inject:['v'],
		props:{
			currentTime:{
				type : Number,
				defalut : 0
			},
			duration:{
				type : Number,
				default : 0
			}
		},
		data(){
		    return {
				activeWidth:0,
				width:0,
				moveStatus:false
			}
		},
		computed:{
			activeStyle() {
				return `width:${this.activeWidth}px;`
			},
			activeDotStyle(){
				return `left:${this.activeWidth}px;`
			},
			current() {
				return this.width == 0 ? 0 : (this.activeWidth/this.width) * this.duration
			}
		},
		created() {
			// 进度条的长度
			// console.log(this.v.windowHeight)
			// console.log(this.v.fullScreenStatus)
			if(!this.v.fullScreenStatus){
				this.width = this.v.windowWidth - 44 - 44 - 80 - 15
				this.left = 44
			} else {
				this.width = this.v.windowHeight - 30 - 15
				this.left = 15
			}
			this.active()
		},
		watch:{
			currentTime(newValue,oldValue){
				if(!this.moveStatus) {
					this.active()
				}
			}
		},
		methods:{
			active() {
				this.activeWidth =  this.duration == 0 ? 0 : (this.currentTime/this.duration) * this.width
				// console.log(this.width);
			},
			touchstart(e) {
				// console.log(e)
				// console.log(e.changedTouches[0].screenX)
				if(this.duration === 0) return 
				
				this.moveStatus = true
				this.activeWidth = e.changedTouches[0].screenX - 44
			},
			touchmove(e) {
				  if(this.duration === 0) return 
				  // 移动点的判断
				  let d = e.changedTouches[0].screenX - 44
				  if( d <= 0) {
					  this.activeWidth = 0
				  } else if (d >= this.width) {
					  this.activeWidth = this.width
				  } else {
					  this.activeWidth = d
				  } 
					this.$emit('update',this.current)
			},
			touchend(e) {
				if(this.duration === 0) return
				this.moveStatus = false
				this.$emit('change',this.current)
			},
			touchcancel(e) {
				this.touchend(e);
			}
		},
	}
</script>

<style>
</style>
