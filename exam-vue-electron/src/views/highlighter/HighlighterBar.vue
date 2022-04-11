<template>
  <div>
    <transition name="drawerAnim">
      <div id="my-drawer" v-show="visible">
        <div id="closeIcon" @click="closeHighlighterBar">
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

        <div class="container" style="user-select: none">
          选中高亮：
          <a-switch :checked="enable" @change="toggleEnable" />
          <a-divider orientation="left">调色板</a-divider>
          <div id="palette">
            <div
              class="border"
              ref="border"
              v-for="(item, index) in highlighterStylesClassName"
              :key="index"
              @click="handleClick(index)"
            >
              <div :class="item"></div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  name: 'HighlighterBar',
  props: {
    visible: {
      type: Boolean,
      default: false,
      required: true,
    },
    enable: {
      type: Boolean,
      default: false,
      required: true,
    },
  },
  data() {
    return {
      highlighterStylesClassName: [
        'highlighterStyles-red',
        'highlighterStyles-skyblue',
        'highlighterStyles-yellow',
        'highlighterStyles-greed',
        'highlighterStyles-gray',
        'highlighterStyles-pink',
        'highlighterStyles-blue',
        'highlighterStyles-purple'
      ],
    }
  },
  methods: {
    closeHighlighterBar() {
      this.$emit('changeVisible', false)
    },
    toggleEnable() {
      this.$emit('changeEnable')
    },
    handleClick(index) {
      this.$refs['border'].forEach((item) => item.classList.remove('active'))
      this.$refs['border'][index].classList.add('active')
      this.$emit('changeHighlighterStyle', this.highlighterStylesClassName[index])
    },
  },
  mounted() {
    this.handleClick(0)
  },
}
</script>

<style lang="less" scoped>
/* 调色板的样式，需要在 ExamDetail.vue 中也引入 */
@import './highlighterStyles';
@drawer-width: 200px;
@drawer-height: 250px;

#my-drawer {
  width: @drawer-width;
  height: @drawer-height;
  // border: 1px solid #aaa;
  position: absolute;
  right: 33px;
  top: 50%;
  border-radius: 20px;
  box-shadow: #bbb 0px 0px 10px;
  transform: translate(0, -50%);
  background-color: white;
  z-index: 99;
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.drawerAnim-enter,
.drawerAnim-leave-to {
  // transform: translate(120%, -50%) !important;
  opacity: 0;
}

.drawerAnim-enter-active,
.drawerAnim-leave-active {
  transition: 0.4s;
}

.drawerAnim-enter-to,
.drawerAnim-leave {
  // transform: translate(0, -50%) !important;
  opacity: 1;
}

#closeIcon {
  width: 25px;
  height: 25px;
  position: absolute;
  right: 10px;
  top: 10px;
  cursor: pointer;
}

.container {
  width: 80%;
  height: 80%;
}

#palette {
  display: flex;
  width: 100%;
  height: 60%;
  justify-content: space-between;
  // background: #bbb;
  flex-wrap: wrap;
  .border {
    width: @drawer-width * 0.8 * 0.201;
    height: @drawer-width * 0.8 * 0.201;
    border: 1px solid #ccc;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;

    div {
      width: 85%;
      height: 85%;
      border-radius: 50%;
    }

    &.active {
      border: 2px solid rgba(70, 181, 225, 0.8);
      box-shadow: 0px 0px 6px rgba(70, 181, 225, 0.8);
    }
  }
}
</style>