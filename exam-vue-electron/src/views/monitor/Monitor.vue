<template>
  <div>
    <transition name="msgAnim">
      <div id="msg" v-show="!isMonitoring">
        <a-alert message="请确保摄像头正常工作！" type="error" />
      </div>
    </transition>
    <video ref="monitor"></video>
    <canvas ref="photo"></canvas>
  </div>
</template>

<script>
/* eslint-disable */
import axios from 'axios'
import {message} from 'ant-design-vue';

export default {
  name: 'Monitor',
  data() {
    return {
      checkInterval: null,
      checkTimer: 1000,  // 检查摄像头是否开启的定时器 ms
      authenticationInterval: null,
      authenticationTimer: 30000,  // 身份验证的定时器 ms
      isMonitoring: true,
      canvasDataUrl: '',
    }
  },
  methods: {
    authSuccess() {
      message.success('身份验证成功');
    },
    authFail() {
      message.error('身份验证失败')
    },
    authFailExecute() {
      message.warning('请开启摄像头以确保身份验证正常运行')
    },
    authNetFail() {
      message.warning('网络原因导致身份验证失败')
    }
  },
  computed: {
    base64Url() {
      return this.canvasDataUrl.split('data:image/png;base64,')[1]
    },
  },
  watch: {
    canvasDataUrl(newVal, oldVal) {

      const val = newVal.split('data:image/png;base64,')[1]

      axios({
        method: 'POST',
        url: 'http://localhost:5000/ai',
        data: {
          img: val
        }
      })
        .then((res) => {
          const { text } = res.data
          if (text !== 'Success') {
            this.authSuccess();
          } else {
            this.authFail();
          }
        })
        .catch((err) => {
          this.authNetFail();
        })
    },
  },
  mounted() {
    let monitor = this.$refs['monitor']
    let canvas = this.$refs['photo']

    let pr = navigator.mediaDevices.getUserMedia({ audio: false, video: true })

    pr.then((mediaStream) => {
      monitor.srcObject = mediaStream
      monitor.play()
      this.isMonitoring = true
    }).catch((err) => {
      if (err.message == 'Requested device not found') {
        this.isMonitoring = false
      }
    })

    // 每隔 2s 获取用户计算机摄像头权限
    this.checkInterval = setInterval(() => {
      let pr = navigator.mediaDevices.getUserMedia({ video: true })
      pr.then((mediaStream) => {
        // 若获取权限成功
        // 若一开始（进入考试页面）就没有获取权限 || 中途摄像头不能正常工作
        if (!monitor.srcObject || !monitor.srcObject.active) {
          this.isMonitoring = true
          monitor.srcObject = mediaStream
          monitor.play()
        }
      }).catch((err) => {
        // 若获取权限失败
        if (err.message === 'Requested device not found') {
          this.isMonitoring = false
        }
      })
    }, this.checkTimer)

    this.authenticationInterval = setInterval(() => {
      // 若未获得摄像头权限
      if (!this.isMonitoring) return this.authFailExecute();

      canvas.getContext('2d').drawImage(monitor, 0, 0, 250, 160)
      this.canvasDataUrl = canvas.toDataURL('image/png')
    }, this.authenticationTimer)
  },
}
</script>

<style lang="less" scoped>
div {
  width: 100%;
  height: 100%;
  position: relative;

  video {
    width: 100%;
    height: 100%;
    display: block;
  }

  canvas {
    width: 100%;
    height: 100%;
    display: none;
  }

  #msg {
    position: absolute;
    width: 190px;
    height: 40px;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
  }
}

// 进入起始&离开终点
.msgAnim-enter,
.msgAnim-leave-to {
  transform: translate(-50%, -100%) !important;
  opacity: 0;
}

.msgAnim-enter-active,
.msgAnim-leave-active {
  transition: 0.4s;
}

// 进入终点&离开起始
.msgAnim-enter-to,
.msgAnim-leave {
  transform: translate(-50%, -50%) !important;
  opacity: 1;
}
</style>