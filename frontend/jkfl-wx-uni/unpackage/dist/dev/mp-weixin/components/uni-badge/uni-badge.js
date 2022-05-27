"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  name: "UniBadge",
  props: {
    type: {
      type: String,
      default: "default"
    },
    inverted: {
      type: Boolean,
      default: false
    },
    text: {
      type: [String, Number],
      default: ""
    },
    size: {
      type: String,
      default: "normal"
    }
  },
  data() {
    return {
      badgeStyle: ""
    };
  },
  watch: {
    text() {
      this.setStyle();
    }
  },
  mounted() {
    this.setStyle();
  },
  methods: {
    setStyle() {
      this.badgeStyle = `width: ${String(this.text).length * 8 + 12}px`;
    },
    onClick() {
      this.$emit("click");
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: $props.text
  }, $props.text ? {
    b: common_vendor.t($props.text),
    c: common_vendor.n($props.inverted ? "uni-badge--" + $props.type + " uni-badge--" + $props.size + " uni-badge--" + $props.type + "-inverted" : "uni-badge--" + $props.type + " uni-badge--" + $props.size),
    d: common_vendor.s($data.badgeStyle),
    e: common_vendor.o(($event) => $options.onClick())
  } : {});
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__scopeId", "data-v-26a60cd2"], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/uni-badge/uni-badge.vue"]]);
wx.createComponent(Component);
