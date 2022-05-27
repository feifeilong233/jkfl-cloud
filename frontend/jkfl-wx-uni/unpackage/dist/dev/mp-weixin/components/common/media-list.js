"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  props: {
    item: Object,
    index: [String, Number]
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: $props.item.photo,
    b: common_vendor.t($props.item.title),
    c: common_vendor.t($props.item.create_time),
    d: common_vendor.t($props.item.watch),
    e: common_vendor.t($props.item.good)
  };
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/common/media-list.vue"]]);
wx.createComponent(Component);
