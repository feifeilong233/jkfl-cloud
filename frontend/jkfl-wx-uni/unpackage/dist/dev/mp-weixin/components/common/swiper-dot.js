"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  props: {
    info: Array,
    current: {
      type: Number,
      default: 0
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: common_vendor.t($props.info[$props.current].title),
    b: common_vendor.f($props.info, (items, index, i0) => {
      return {
        a: index,
        b: common_vendor.s(index === $props.current ? "background-color: rgba(255,255,255,1)" : "background-color: rgba(255,255,255,0.5)")
      };
    })
  };
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/common/swiper-dot.vue"]]);
wx.createComponent(Component);
