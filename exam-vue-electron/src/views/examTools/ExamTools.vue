<template>
  <div id="examTools">
    <div class="tool">
      <div class="toolBtn" style="background: cadetblue" @click="toggleNoticeVisible">
        <svg
          t="1649673007403"
          class="icon"
          viewBox="0 0 1024 1024"
          version="1.1"
          xmlns="http://www.w3.org/2000/svg"
          p-id="2632"
          width="24"
          height="24"
        >
          <path
            d="M694.368 117.28a67.957333 67.957333 0 0 1 10.336 36.021333v717.408a67.957333 67.957333 0 0 1-103.978667 57.632L326.026667 756.650667H180.48A95.146667 95.146667 0 0 1 85.333333 661.504V362.506667a95.146667 95.146667 0 0 1 95.146667-95.146667h145.546667L600.725333 95.68a67.957333 67.957333 0 0 1 93.653334 21.610667z m120.330667 133.525333a32 32 0 0 1 44.533333 8.042667 443.114667 443.114667 0 0 1 0.117333 506.133333 32 32 0 0 1-52.586666-36.458666 379.114667 379.114667 0 0 0-0.106667-433.184 32 32 0 0 1 8.042667-44.533334z"
            p-id="2633"
            fill="#ffffff"
          ></path>
        </svg>
        <span>公告</span>
      </div>
      <ToolNotice :visible="toolVisible.notice" @changeVisible="changeNoticeVisible" />
    </div>
    <div class="tool">
      <div class="toolBtn" style="background: gray" @click="toggleConsultVisible">
        <svg
          t="1649673048884"
          class="icon"
          viewBox="0 0 1024 1024"
          version="1.1"
          xmlns="http://www.w3.org/2000/svg"
          p-id="3590"
          width="24"
          height="24"
        >
          <path
            d="M843.5 97h-664C115.813 97 64 148.813 64 212.5v440C64 716.187 115.813 768 179.5 768H256v128a31.498 31.498 0 0 0 31.493 31.501 31.501 31.501 0 0 0 22.211-9.157L460.99 768H843.5c63.687 0 115.5-51.813 115.5-115.5v-440C959 148.813 907.187 97 843.5 97zM896 652.5c0 28.948-23.552 52.5-52.5 52.5H448a31.502 31.502 0 0 0-22.204 9.156L319 820.287V736.5c0-17.396-14.103-31.5-31.5-31.5h-108c-28.949 0-52.5-23.552-52.5-52.5v-440c0-28.949 23.551-52.5 52.5-52.5h664c28.948 0 52.5 23.551 52.5 52.5v440z"
            p-id="3591"
            fill="#ffffff"
          ></path>
          <path
            d="M736 257H288c-17.397 0-31.5 14.103-31.5 31.5S270.603 320 288 320h448c17.396 0 31.5-14.103 31.5-31.5S753.396 257 736 257zM736 385H288c-17.397 0-31.5 14.103-31.5 31.5S270.603 448 288 448h448c17.396 0 31.5-14.103 31.5-31.5S753.396 385 736 385zM544 513H288c-17.397 0-31.5 14.103-31.5 31.5S270.603 576 288 576h256c17.397 0 31.5-14.103 31.5-31.5S561.397 513 544 513z"
            p-id="3592"
            fill="#ffffff"
          ></path>
        </svg>
        <span>咨询</span>
      </div>
      <ToolConsult :visible="toolVisible.consult" @changeVisible="changeConsultVisible" />
    </div>
  </div>
</template>

<script>
import ToolNotice from './ToolNotice'
import ToolConsult from './ToolConsult'

export default {
  name: 'ExamTools',
  components: {
    ToolNotice,
    ToolConsult,
  },
  data() {
    return {
      toolVisible: {
        notice: false,
        consult: false,
      },
    }
  },
  methods: {
    changeNoticeVisible(isVisible) {
      this.toolVisible.notice = isVisible
    },
    changeConsultVisible(isVisible) {
      this.toolVisible.consult = isVisible
    },
    toggleNoticeVisible() {
      if (!this.toolVisible.notice) this.closeAll()
      this.toolVisible.notice = !this.toolVisible.notice
    },
    toggleConsultVisible() {
      if (!this.toolVisible.consult) this.closeAll()
      this.toolVisible.consult = !this.toolVisible.consult
    },
    closeAll() {
      for (const key in this.toolVisible) {
        this.toolVisible[key] = false
      }
    },
  },
}
</script>

<style lang="less" scoped>
@btnGroupHeight: 180px;
@btnGroupWidth: 40px;
@btnRatio: 48%;

#examTools {
  position: absolute;
  right: 15.6px;
  top: 50%;
  transform: translate(0, -50%);
  width: @btnGroupWidth;
  height: @btnGroupHeight;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  user-select: none;

  .tool {
    width: 100%;
    height: @btnRatio;
    position: relative;

    &:first-child .toolBtn {
      border-radius: 20px 0 0 0;
    }

    &:last-child .toolBtn {
      border-radius: 0 0 0 20px;
    }
  }

  .toolBtn {
    width: 100%;
    height: 100%;
    color: #ffffff;
    cursor: pointer;
    box-shadow: 0 0 5px #999;
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-evenly;
    padding-top: 0.05 * @btnGroupHeight;
    padding-bottom: 0.05 * @btnGroupHeight;

    transition: box-shadow .5s;
    &:hover {
      box-shadow: 0 0 10px #666;
    }

    span {
      display: inline-block;
      width: 0.4 * @btnGroupWidth;
      font-size: 0.4 * @btnGroupWidth;
      font-weight: 600;
    }
  }
}
</style>