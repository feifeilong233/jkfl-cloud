"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  props: {
    title: String,
    showRefresh: {
      type: Boolean,
      default: true
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: common_vendor.t($props.title),
    b: $props.showRefresh
  }, $props.showRefresh ? {
    c: common_vendor.o(($event) => _ctx.$emit("refresh"))
  } : {});
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/common/card.vue"]]);
wx.createComponent(Component);
