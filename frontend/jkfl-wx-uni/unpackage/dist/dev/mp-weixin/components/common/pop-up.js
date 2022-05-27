"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  data() {
    return {
      showStatus: false
    };
  },
  methods: {
    showPop() {
      this.showStatus = true;
    },
    hidenPop() {
      this.showStatus = false;
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: $data.showStatus
  }, $data.showStatus ? {
    b: common_vendor.o((...args) => $options.hidenPop && $options.hidenPop(...args))
  } : {});
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/common/pop-up.vue"]]);
wx.createComponent(Component);
