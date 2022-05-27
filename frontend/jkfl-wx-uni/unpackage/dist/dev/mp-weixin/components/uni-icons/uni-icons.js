"use strict";
var components_uniIcons_icons = require("./icons.js");
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  name: "UniIcons",
  props: {
    type: {
      type: String,
      default: ""
    },
    color: {
      type: String,
      default: "#333333"
    },
    size: {
      type: [Number, String],
      default: 16
    },
    customIcons: {
      type: String,
      default: ""
    }
  },
  data() {
    return {
      icons: components_uniIcons_icons.icons
    };
  },
  methods: {
    _onClick() {
      this.$emit("click");
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: common_vendor.t($data.icons[$props.type]),
    b: $props.color,
    c: $props.size + "px",
    d: common_vendor.n($props.customIcons),
    e: common_vendor.n($props.customIcons ? $props.type : ""),
    f: common_vendor.o((...args) => $options._onClick && $options._onClick(...args))
  };
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__scopeId", "data-v-0bf90c00"], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/uni-icons/uni-icons.vue"]]);
wx.createComponent(Component);
