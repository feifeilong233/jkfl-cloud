"use strict";
var common_vendor = require("../../common/vendor.js");
const mediaList = () => "../../components/common/media-list.js";
const popUp = () => "../../components/common/pop-up.js";
const _sfc_main = {
  components: {
    mediaList,
    popUp
  },
  data() {
    return {
      scrollH: 500,
      id: "",
      tabIndex: 0,
      data: {},
      collections: [],
      like: [],
      tabBars: [{
        name: "\u7B80\u4ECB"
      }, {
        name: "\u8BC4\u8BBA"
      }]
    };
  },
  created() {
    let res = common_vendor.index.getSystemInfoSync();
    this.scrollH = res.windowHeight - 226;
  },
  onLoad: function(options) {
    this.id = options.sid;
  },
  onShow: function() {
    let that = this;
    let id = that.id;
    console.log("id", id);
    that.ajax(that.url.findVideoById + "?id=" + id, "POST", null, function(resp) {
      const { data } = resp.data.data;
      console.log("video data", data);
      that.data = data;
    });
    that.ajax(that.url.recommoandList + "?label=\u6280\u672F", "POST", null, function(resp) {
      const { data } = resp.data.data;
      console.log("video 5 likes data", data);
      that.like = data;
    });
    let collectionsss = "\u524D\u540E\u7AEF\u5206\u79BB-\u5B9E\u6218wiki\u77E5\u8BC6\u5E93\u7CFB\u7EDF";
    that.ajax(that.url.findCollection + "?collection=" + collectionsss, "POST", null, function(resp) {
      const { data } = resp.data.data;
      console.log("video collection data", data);
      that.collections = data;
    });
    xian1;
  },
  methods: {
    stop() {
    },
    changeTab(index) {
      this.tabIndex = index;
      console.log(index);
    },
    openPopup() {
      this.$refs.popup.showPop();
    },
    hidePopup() {
      this.$refs.popup.hidenPop();
    },
    openComment() {
      this.$refs.comment.showPop();
    }
  }
};
if (!Array) {
  const _component_pop_up = common_vendor.resolveComponent("pop-up");
  _component_pop_up();
}
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: $data.data.vdoPath,
    b: common_vendor.f($data.tabBars, (item, index, i0) => {
      return {
        a: common_vendor.t(item.name),
        b: common_vendor.n($data.tabIndex == index ? "text-main border-main" : ""),
        c: common_vendor.s($data.tabIndex == index ? "border-bottom: 5rpx solid;" : ""),
        d: index,
        e: common_vendor.o(($event) => $options.changeTab(index))
      };
    }),
    c: $data.tabIndex === 0
  }, $data.tabIndex === 0 ? {
    d: common_vendor.t($data.data.vdoName),
    e: common_vendor.t($data.data.createTime),
    f: common_vendor.o((...args) => $options.openPopup && $options.openPopup(...args)),
    g: common_vendor.f($data.collections, (i, k0, i0) => {
      return {
        a: common_vendor.t(i.id),
        b: common_vendor.t(i.title),
        c: i.id,
        d: common_vendor.s(i.title === $data.data.vdoName ? "color: #FB7299; border-color:#FB7299" : " color: #A9A5A0;")
      };
    }),
    h: common_vendor.f($data.like, (item, index, i0) => {
      return {
        a: item.vdoPhoto,
        b: common_vendor.t(item.vdoName),
        c: common_vendor.t(item.createTime),
        d: common_vendor.t(item.watch),
        e: common_vendor.t(item.good),
        f: index
      };
    }),
    i: common_vendor.o((...args) => $options.hidePopup && $options.hidePopup(...args)),
    j: common_vendor.f($data.collections, (i, k0, i0) => {
      return {
        a: common_vendor.t(i.id),
        b: common_vendor.t(i.title),
        c: common_vendor.n(i.title === $data.data.vdoName ? "text-main border-main" : "text-muted border-light-secondary"),
        d: i.id
      };
    }),
    k: common_vendor.o((...args) => $options.stop && $options.stop(...args)),
    l: common_vendor.sr("popup", "b7d31ec2-0")
  } : {
    m: common_vendor.o((...args) => $options.openComment && $options.openComment(...args)),
    n: common_vendor.o((...args) => $options.stop && $options.stop(...args)),
    o: common_vendor.sr("comment", "b7d31ec2-1")
  }, {
    p: common_vendor.s("height:" + $data.scrollH + "px;")
  });
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/detail-video/detail-video.vue"]]);
wx.createPage(MiniProgramPage);
