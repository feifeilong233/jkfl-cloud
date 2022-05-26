<template>
  <div style="width: auto">
    <div id="book-header" style="height: 16vh">
      <div id="book-bread">
        <div id="book-header-bg"></div>
        <span style="color: rgba(0, 0, 0, 0.45)">在线考试系统&nbsp;</span>
        <span style="color: rgba(0, 0, 0, 0.45)"> / </span>
        <span style="color: rgba(0, 0, 0, 0.45)">&nbsp;在线阅读&nbsp;</span>
        <span style="color: rgba(0, 0, 0, 0.45)"> / </span>
        <span>&nbsp;我的收藏</span>
        <div id="book-title">我的收藏列表</div>
      </div>
    </div>

    <div style="padding-top: 20px">
      <transition name="fade" mode="out-in" key="$route.path">
        <keep-alive>
          <router-view />
        </keep-alive>
      </transition>
    </div>
  </div>
</template>

<script>
export default {
  name: 'BookLayout',
}
</script>

<style lang="less" scoped>
#book-header {
  background-color: #ffffff;
  border: 1px solid rgb(232, 232, 232);
  height: 120%;

  #book-bread {
    font-size: 14px;
    transform: translate(8px, 16px);

    #book-title {
      color: rgba(0, 0, 0, 0.85);
      font-size: 16px;
      margin-top: 16px;
    }
  }
}
</style>