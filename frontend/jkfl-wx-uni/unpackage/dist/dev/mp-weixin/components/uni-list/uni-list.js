"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  name: "UniList",
  "mp-weixin": {
    options: {
      multipleSlots: false
    }
  },
  props: {
    enableBackToTop: {
      type: [Boolean, String],
      default: false
    },
    scrollY: {
      type: [Boolean, String],
      default: false
    },
    border: {
      type: Boolean,
      default: true
    }
  },
  provide() {
    return {
      list: this
    };
  },
  created() {
    this.firstChildAppend = false;
  },
  methods: {
    loadMore(e) {
      this.$emit("scrolltolower");
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: $props.border
  }, $props.border ? {} : {}, {
    b: $props.border
  }, $props.border ? {} : {});
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/uni-list/uni-list.vue"]]);
wx.createComponent(Component);
