"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  name: "uniPopupDialog",
  props: {
    value: {
      type: [String, Number],
      default: ""
    },
    placeholder: {
      type: [String, Number],
      default: "\u8BF7\u8F93\u5165\u5185\u5BB9"
    },
    type: {
      type: String,
      default: "error"
    },
    mode: {
      type: String,
      default: "base"
    },
    title: {
      type: String,
      default: "\u63D0\u793A"
    },
    content: {
      type: String,
      default: ""
    },
    beforeClose: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      dialogType: "error",
      focus: false,
      val: ""
    };
  },
  inject: ["popup"],
  watch: {
    type(val) {
      this.dialogType = val;
    },
    mode(val) {
      if (val === "input") {
        this.dialogType = "info";
      }
    },
    value(val) {
      this.val = val;
    }
  },
  created() {
    this.popup.mkclick = false;
    if (this.mode === "input") {
      this.dialogType = "info";
      this.val = this.value;
    } else {
      this.dialogType = this.type;
    }
  },
  mounted() {
    this.focus = true;
  },
  methods: {
    onOk() {
      this.$emit("confirm", () => {
        this.popup.close();
        if (this.mode === "input")
          this.val = this.value;
      }, this.mode === "input" ? this.val : "");
    },
    close() {
      if (this.beforeClose) {
        this.$emit("close", () => {
          this.popup.close();
        });
        return;
      }
      this.popup.close();
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: common_vendor.t($props.title),
    b: common_vendor.n("uni-popup__" + $data.dialogType),
    c: $props.mode === "base"
  }, $props.mode === "base" ? {
    d: common_vendor.t($props.content)
  } : {
    e: $props.placeholder,
    f: $data.focus,
    g: $data.val,
    h: common_vendor.o(($event) => $data.val = $event.detail.value)
  }, {
    i: common_vendor.o((...args) => $options.close && $options.close(...args)),
    j: common_vendor.o((...args) => $options.onOk && $options.onOk(...args))
  });
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__scopeId", "data-v-2fab037e"], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/uni-popup/uni-popup-dialog.vue"]]);
wx.createComponent(Component);
