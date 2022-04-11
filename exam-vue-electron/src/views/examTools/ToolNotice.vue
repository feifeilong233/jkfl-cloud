<template>
  <div>
    <transition name="noticeAnim">
      <div id="toolNotice" v-show="visible">
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
        <ul class="container">
          <li v-for="(notice, index) in notices" :key="index">
            <span class="noticeFrom">{{ notice.from }}</span>
            <span class="noticeTime">{{ notice.time }}</span>
            <p>{{ notice.msg }}</p>
            <hr v-if="index + 1 !== notices.length" />
          </li>
        </ul>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  name: 'ToolNotice',
  props: ['visible'],
  data() {
    return {
      notices: [
        {
          time: '2022-04-09 12:16:22',
          from: '监考老师',
          msg: '实时抓拍监考系统已启动，请将与考试无关物品上交，一旦查到按违规处理。考试过程中遇到任何技术问题请联系管理员或监考老师。',
        },
        {
          time: '2022-04-10 05:09:33',
          from: '监考助理',
          msg: '请确保摄像头权限开启',
        },
        {
          time: '2022-04-11 20:06:11',
          from: '系统',
          msg: '请确认身份',
        },
        {
          time: '2022-04-11 20:07:44',
          from: '系统',
          msg: '请确认身份',
        },
        {
          time: '2022-04-11 20:08:55',
          from: '系统',
          msg: '请确认身份',
        },
      ],
    }
  },
  methods: {
    closeTool() {
      this.$emit('changeVisible', false)
    },
  },
}
</script>

<style lang="less" scoped>
#toolNotice {
  position: absolute;
  width: 350px;
  height: 200px;
  top: 50%;
  right: 50px;
  transform: translate(0, -50%);
  background: cadetblue;
  box-shadow: 0 0 5px #999;
  cursor: default;
  border-radius: 5px;

  .container {
    width: 95%;
    height: 82%;
    margin: 0 auto;
    margin-top: 8%;
    background-color: #ffffff;
    overflow: auto;
    list-style: none;
    padding: 0 10px 0 10px;
    border-radius: inherit;

    .noticeFrom {
      font-weight: 800;
    }

    .noticeTime {
      margin-left: 10px;
      color: #aaa;
    }

    p {
      // 如果能选中就被高亮了...
      // user-select: text;
      // cursor: text;
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

.noticeAnim-enter,
.noticeAnim-leave-to {
  opacity: 0;
}

.noticeAnim-enter-active,
.noticeAnim-leave-active {
  transition: 0.2s;
}

.noticeAnim-enter-to,
.noticeAnim-leave {
  opacity: 1;
}
</style>