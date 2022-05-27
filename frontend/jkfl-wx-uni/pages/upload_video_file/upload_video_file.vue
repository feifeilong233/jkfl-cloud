<template>
	
<view class="main">
	
    <view class="playerInfo">
		
        <view class="video" v-if="clickFlag">
            <image class="videoContent" v-if="poster" :src="poster" 
			mode="aspectFill" @tap="chooseVideo"/>
            <view class="videoContent" v-else @tap="chooseVideo()" >
                <image class="playImg" src="../../static/jia-9.png" mode="aspectFill"/>
            </view>
        </view>
		
        <view class="video" v-else>
            <image class="videoContent" v-if="poster" :src="poster" mode="aspectFill"/>
            <view class="videoContent" v-else>
                <image class="playImg" src="../../static/jia-9.png" mode="aspectFill"/>
            </view>
        </view>
		
    </view>
	
	<input v-model="title" placeholder='Title...' style="margin-top:40rpx;margin-bottom: 40rpx; margin-left: 30rpx;"/>
	
	
    <view class="footerbtn">
        <button type="default" style="width:40%;" @tap="chooseVideo" v-if="clickFlag">上传视频</button>
        <button type="default" style="width:40%;color:#cccccc;" v-else>上传视频</button>
        <button type="primary" style="width:40%;" @tap = "saveVideo">保存</button>
    </view>
	
	
    <view class="videoUrlResult" v-if="videoUrl" >
        <view class="title">上传的视频：</view>
        <!--autoplay="true" 视频自动播放-->
        <video class="videoContent" style="width: 90%;margin-left: 5%;margin-top: 20rpx;" 
               show-center-play-btn="true" :src="videoUrl" object-fit="fill" 
               bindfullscreenchange="fullscreenchange">
        </video>
    </view>
	
	
</view>
	
</template>

<script>
export default{
	data(){
		return{
			videoUrl:"",
			poster:"",
			title:'',//必须手动录入，wx上传的时候文件的名称就已经乱了，无法修复
			clickFlag:true //防重复点击 
		}
	},
	methods:{
		chooseVideo: function () {
			console.log("chooseVideo")
			let that = this;
			that.clickFlag = false;
		 
			
			//1.拍摄视频或从手机相册中选择视频
			wx.chooseVideo({
			  sourceType: ['album', 'camera'], // album 从相册选视频，camera 使用相机拍摄
			  // maxDuration: 60, // 拍摄视频最长拍摄时间，单位秒。最长支持60秒
			  camera: 'back',//默认拉起的是前置或者后置摄像头，默认back
			  compressed: true,//是否压缩所选择的视频文件
			  success: function(res){
				console.log(res)
				let tempFilePath = res.tempFilePath//选择定视频的临时文件路径（本地路径）
				
				let duration = res.duration //选定视频的时间长度
				let size = parseFloat(res.size/1024/1024).toFixed(1) //选定视频的数据量大小
				// let height = res.height //返回选定视频的高度
				// let width = res.width //返回选中视频的宽度
				that.duration = duration
				if(parseFloat(size) > 100){
				  
					that.clickFlag =  true;
					that.duration = '';
			
				  let beyondSize = parseFloat(size) - 100
				  wx.showToast({
					title: '上传的视频大小超限，超出'+beyondSize+'MB,请重新上传',
					//image: '',//自定义图标的本地路径，image的优先级高于icon
					icon:'none'
				  })
				}else{
				  //2.本地视频资源上传到服务器
				  that.uploadFile(tempFilePath)
				}
			  },
			  fail: function() {
				// fail
			  },
			  complete: function() {
				// complete
			  }
			})
		  },
		  /**
		   * 将本地资源上传到服务器
		   * 
		   */
		  uploadFile:function(tempFilePath){
			let that = this
			let third_session = wx.getStorageSync('third_session')
			wx.showLoading({
			  title: '上传进度：0%',
			  mask: true //是否显示透明蒙层，防止触摸穿透
			})
			const uploadTask = wx.uploadFile({
			  url: 'http://localhost:8055/upload/uploadVideo?title='+that.title,//开发者服务器地址
			  filePath:tempFilePath,//要上传文件资源的路径（本地路径）
			  name:'file',//文件对应key,开发者在服务端可以通过这个 key 获取文件的二进制内容
			  // header: {}, // 设置请求的 header
			  formData: {
				third_session: third_session
			  }, // HTTP 请求中其他额外的 form data
			  success: function(res){
				console.log("uploadFile",res)
				// success
				let data = JSON.parse(res.data)
				wx.hideLoading()
				if(res.statusCode == 200){
				  
					that.videoUrl = that.videoUrl;
					that.poster = that.imgUrl;
					that.duration = that.duration;
					that.clickFlag = true;
			
				  wx.showToast({
					title: '上传成功',
					icon: 'success'
				  })
				}else{
				  
					that.videoUrl= '';
					that.poster= '';
					that.duration= '';
					that.clickFlag=true;
				  
				  wx.showToast({
					title: '上传失败',
					icon: 'none'
				  })
				}
			   
			  },
			  fail: function() {
				// fail
				wx.hideLoading()
				
				  that.videoUrl= '';
				  that.poster= '';
				  that.duration='';
				  that.clickFlag=true;
			
				wx.showToast({
				  title: '上传失败',
				  icon: 'none'
				})
			  }
			})
			//监听上传进度变化事件
			uploadTask.onProgressUpdate((res) =>{
			  wx.showLoading({
				title: '上传进度：'+res.progress+'%',
				mask: true //是否显示透明蒙层，防止触摸穿透
			  })
			  console.log("上传进度",res.progress)
			  console.log("已经上传的数据长度，单位 Bytes:",res.totalBytesSent)
			  console.log("预期需要上传的数据总长度，单位 Bytes:",res.totalBytesExpectedToSend)
			})
		  },
		  //保存数据库
		  saveVideo(){
			//调用服务器保存视频信息接口
			
		  }
		
		
	}
}
</script>

<style>
	.main{
	    width:100%;
	}
	.playerInfo{
	    margin: 20rpx 20rpx 0 20rpx;
	}
	.video{
	    border :2rpx solid #cccccc;
	}
	.videoContent{
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    width:100%;
	    height: 324rpx;
	    position: relative;
	}
	/*播放小图标*/
	.playImg{
	    position: absolute;
	    top: 36%;
	    left:46%;
	    width:64rpx;
	    height: 64rpx;
	}
	.footerbtn{
	    display: flex;
	    margin-top: 20rpx;
	}
	.button{
	    width:40%;
	}
	.videoUrlResult{
	    width: 100%;
	    margin-top: 20rpx;
	}
	.videoUrlResult .title{ 
	    font-size: 28rpx;
	    font-weight: bold;
	    color: red;
	    margin-left: 20rpx;
	}
</style>