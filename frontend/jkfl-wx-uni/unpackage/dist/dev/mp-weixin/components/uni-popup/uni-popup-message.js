"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  name: "UniPopupMessage",
  props: {
    type: {
      type: String,
      default: "success"
    },
    message: {
      type: String,
      default: ""
    },
    duration: {
      type: Number,
      default: 3e3
    }
  },
  inject: ["popup"],
  data() {
    return {};
  },
  created() {
    this.popup.childrenMsg = this;
  },
  methods: {
    open() {
      if (this.duration === 0)
        return;
      clearTimeout(this.popuptimer);
      this.popuptimer = setTimeout(() => {
        this.popup.close();
      }, this.duration);
    },
    close() {
      clearTimeout(this.popuptimer);
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: common_vendor.t($props.message),
    b: common_vendor.n("uni-popup__" + [$props.type] + "-text"),
    c: common_vendor.n("uni-popup__" + [$props.type])
  };
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__scopeId", "data-v-2b5e1e44"], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/uni-popup/uni-popup-message.vue"]]);
wx.createComponent(Component);
