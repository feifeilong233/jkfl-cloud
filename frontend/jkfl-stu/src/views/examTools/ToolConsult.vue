<template>
  <div>
    <transition name="consultAnim">
      <div id="toolConsult" v-show="visible">
        <!-- 关闭按钮 -->
        <div id="closeIcon" @click="closeTool">
          <svg
            t="1649241140565"
            class="icon"
            viewBox="0 0 1045 1024"
            version="1.1"
            xmlns="http://www.w3.org/2000/svg"
            p-id="3799"
            width="100%"
            height="100%"
          >
            <path
              d="M282.517333 213.376l-45.354666 45.162667L489.472 512 237.162667 765.461333l45.354666 45.162667L534.613333 557.354667l252.096 253.269333 45.354667-45.162667-252.288-253.44 252.288-253.482666-45.354667-45.162667L534.613333 466.624l-252.096-253.226667z"
              p-id="3800"
            ></path>
          </svg>
        </div>
        <div class="container">
          <div class="chatBox" ref="chatBox">
            <ul>
              <li v-for="(message, index) in messages" :key="index">
                <span class="msgFrom">{{ message.from }}</span>
                <span class="msgTime">{{ message.time }}</span>
                <p>{{ message.content }}</p>
              </li>
            </ul>
          </div>
          <a-textarea class="chatInput" v-model="sendContent"> </a-textarea>
          <a-button type="primary" class="chatSend" @click="sendMessage">发送</a-button>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
import dayjs from 'dayjs'

export default {
  name: 'ToolConsult',
  props: ['visible'],
  data() {
    return {
      sendContent: '',
      messages: [
        {
          type: 'send',
          from: '我', // TODO: 改为准考证号
          time: '2022-04-11 20:44:12',
          content: '你好',
        },
        {
          type: 'receive',
          from: '监考老师',
          time: '2022-04-11 20:46:16',
          content: '好的',
        },
      ],
    }
  },
  watch: {
    messages: {
      handler() {
        this.updateScroll()
      },
    },
  },
  methods: {
    closeTool() {
      this.$emit('changeVisible', false)
    },
    updateScroll() {
      const { chatBox } = this.$refs
      // TODO: 滚动条有点小问题
      chatBox.scrollTop = chatBox.scrollHeight - chatBox.style.height
    },
    sendMessage() {
      if (this.sendContent.trim() === '') return

      // TODO: ajax 请求

      this.messages.push({
        type: 'send',
        from: '我',
        time: dayjs().format('YYYY-MM-DD HH:mm:ss'),
        content: this.sendContent,
      })

      this.sendContent = ''

      setTimeout(() => {
        this.messages.push({
          type: 'receive',
          from: '监考老师',
          time: dayjs().format('YYYY-MM-DD HH:mm:ss'),
          content: '好的',
        })
      }, 2000)
    },
  },
}
</script>

<style lang="less" scoped>
#toolConsult {
  position: absolute;
  width: 300px;
  height: 300px;
  top: 50%;
  right: 50px;
  transform: translate(0, -50%);
  background: gray;
  box-shadow: 0 0 5px #999;
  cursor: default;
  border-radius: 5px;

  .container {
    width: 94%;
    height: 88%;
    margin: 0 auto;
    margin-top: 9%;
    background-color: #ffffff;
    border-radius: inherit;

    .chatBox {
      height: 60%;
      overflow: auto;

      ul {
        list-style: none;
        padding: 0 10px 0 10px;

        .msgFrom {
          font-weight: 800;
        }

        .msgTime {
          margin-left: 10px;
          color: #aaa;
        }
      }
    }

    .chatInput {
      height: 30%;
      resize: none;
    }

    .chatSend {
      height: 10%;
      float: right;
    }
  }
}

#closeIcon {
  width: 20px;
  height: 20px;
  position: absolute;
  right: 5px;
  top: 5px;
  cursor: pointer;
}

.consultAnim-enter,
.consultAnim-leave-to {
  opacity: 0;
}

.consultAnim-enter-active,
.consultAnim-leave-active {
  transition: 0.2s;
}

.consultAnim-enter-to,
.consultAnim-leave {
  opacity: 1;
}
</style>