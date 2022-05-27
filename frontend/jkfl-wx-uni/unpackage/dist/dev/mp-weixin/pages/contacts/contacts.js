"use strict";
var common_vendor = require("../../common/vendor.js");
const swiperDot = () => "../../components/common/swiper-dot.js";
const card = () => "../../components/common/card.js";
const mediaList = () => "../../components/common/media-list.js";
const _sfc_main = {
  components: {
    swiperDot,
    card,
    mediaList
  },
  data() {
    return {
      data1: [],
      data2: [],
      data3: [],
      current: 0,
      swipers: [{
        src: "https://jkfl-1306384632.cos.ap-nanjing.myqcloud.com/swipper-6.png",
        title: "Swipper - 1"
      }, {
        src: "https://jkfl-1306384632.cos.ap-nanjing.myqcloud.com/swipper-7.png",
        title: "Swipper - 2"
      }, {
        src: "https://jkfl-1306384632.cos.ap-nanjing.myqcloud.com/swipper-8.png",
        title: "Swipper - 3"
      }]
    };
  },
  onShow: function() {
    console.log("Video Info show");
    let that = this;
    that.ajax(that.url.getInfoList1, "POST", null, function(resp) {
      const { data1 } = resp.data.data;
      that.data1 = data1;
    });
    that.ajax(that.url.getInfoList2, "POST", null, function(resp) {
      const { data2 } = resp.data.data;
      that.data2 = data2;
    });
    that.ajax(that.url.getInfoList3, "POST", null, function(resp) {
      const { data3 } = resp.data.data;
      that.data3 = data3;
    });
  },
  methods: {
    gotoUpload: function() {
      common_vendor.index.navigateTo({
        url: "../upload_video_file/upload_video_file"
      });
    },
    changeSwiper(e) {
      this.current = e.detail.current;
    },
    navTo(id) {
      common_vendor.index.navigateTo({
        url: "../detail-video/detail-video?sid=" + id
      });
    },
    data1Refresh: function() {
      let that = this;
      that.ajax(that.url.getInfoList1, "POST", null, function(resp) {
        const { data1 } = resp.data.data;
        that.data1 = data1;
      });
    },
    data2Refresh: function() {
      let that = this;
      that.ajax(that.url.getInfoList2, "POST", null, function(resp) {
        const { data2 } = resp.data.data;
        that.data2 = data2;
      });
    },
    data3Refresh: function() {
      let that = this;
      that.ajax(that.url.getInfoList3, "POST", null, function(resp) {
        const { data3 } = resp.data.data;
        that.data3 = data3;
      });
    }
  }
};
if (!Array) {
  const _component_swiper_dot = common_vendor.resolveComponent("swiper-dot");
  const _component_card = common_vendor.resolveComponent("card");
  const _component_media_list = common_vendor.resolveComponent("media-list");
  (_component_swiper_dot + _component_card + _component_media_list)();
}
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: common_vendor.f($data.swipers, (items, index, i0) => {
      return {
        a: items.src,
        b: index
      };
    }),
    b: common_vendor.o((...args) => $options.changeSwiper && $options.changeSwiper(...args)),
    c: common_vendor.p({
      info: $data.swipers,
      current: $data.current
    }),
    d: common_vendor.o(($event) => $options.gotoUpload()),
    e: common_vendor.f($data.data1, (i, k0, i0) => {
      return {
        a: i.photo,
        b: common_vendor.t(i.title),
        c: common_vendor.t(i.label),
        d: i.id,
        e: common_vendor.o(($event) => $options.navTo(i.id), i.id)
      };
    }),
    f: common_vendor.o(($event) => $options.data1Refresh()),
    g: common_vendor.p({
      title: "\u4E3A\u4F60\u63A8\u8350 - 1"
    }),
    h: common_vendor.f($data.data2, (i, k0, i0) => {
      return {
        a: i.photo,
        b: common_vendor.t(i.title),
        c: i.id
      };
    }),
    i: common_vendor.o(($event) => $options.data2Refresh()),
    j: common_vendor.p({
      title: "\u4E3A\u4F60\u63A8\u8350 - 2"
    }),
    k: common_vendor.f($data.data3, (item, index, i0) => {
      return {
        a: "1563cf1f-4-" + i0 + ",1563cf1f-3",
        b: common_vendor.p({
          item,
          index
        }),
        c: index
      };
    }),
    l: common_vendor.o(($event) => $options.data3Refresh()),
    m: common_vendor.p({
      title: "\u4E3A\u4F60\u63A8\u8350 - 3"
    })
  };
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/contacts/contacts.vue"]]);
wx.createPage(MiniProgramPage);
