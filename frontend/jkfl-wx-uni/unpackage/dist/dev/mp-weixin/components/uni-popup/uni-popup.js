"use strict";
var components_uniPopup_popup = require("./popup.js");
var common_vendor = require("../../common/vendor.js");
require("./message.js");
const uniTransition = () => "../uni-transition/uni-transition.js";
const _sfc_main = {
  name: "UniPopup",
  components: {
    uniTransition
  },
  props: {
    animation: {
      type: Boolean,
      default: true
    },
    type: {
      type: String,
      default: "center"
    },
    maskClick: {
      type: Boolean,
      default: true
    }
  },
  provide() {
    return {
      popup: this
    };
  },
  mixins: [components_uniPopup_popup.popup],
  watch: {
    type: {
      handler: function(newVal) {
        this[this.config[newVal]]();
      },
      immediate: true
    },
    maskClick(val) {
      this.mkclick = val;
    }
  },
  data() {
    return {
      duration: 300,
      ani: [],
      showPopup: false,
      showTrans: false,
      maskClass: {
        "position": "fixed",
        "bottom": 0,
        "top": 0,
        "left": 0,
        "right": 0,
        "backgroundColor": "rgba(0, 0, 0, 0.4)"
      },
      transClass: {
        "position": "fixed",
        "left": 0,
        "right": 0
      },
      maskShow: true,
      mkclick: true,
      popupstyle: "top"
    };
  },
  created() {
    this.mkclick = this.maskClick;
    if (this.animation) {
      this.duration = 300;
    } else {
      this.duration = 0;
    }
  },
  methods: {
    clear(e) {
      e.stopPropagation();
    },
    open() {
      this.showPopup = true;
      this.$nextTick(() => {
        new Promise((resolve) => {
          clearTimeout(this.timer);
          this.timer = setTimeout(() => {
            this.showTrans = true;
            this.$nextTick(() => {
              resolve();
            });
          }, 50);
        }).then((res) => {
          clearTimeout(this.msgtimer);
          this.msgtimer = setTimeout(() => {
            this.customOpen && this.customOpen();
          }, 100);
          this.$emit("change", {
            show: true,
            type: this.type
          });
        });
      });
    },
    close(type) {
      this.showTrans = false;
      this.$nextTick(() => {
        this.$emit("change", {
          show: false,
          type: this.type
        });
        clearTimeout(this.timer);
        this.customOpen && this.customClose();
        this.timer = setTimeout(() => {
          this.showPopup = false;
        }, 300);
      });
    },
    onTap() {
      if (!this.mkclick)
        return;
      this.close();
    },
    top() {
      this.popupstyle = "top";
      this.ani = ["slide-top"];
      this.transClass = {
        "position": "fixed",
        "left": 0,
        "right": 0
      };
    },
    bottom() {
      this.popupstyle = "bottom";
      this.ani = ["slide-bottom"];
      this.transClass = {
        "position": "fixed",
        "left": 0,
        "right": 0,
        "bottom": 0
      };
    },
    center() {
      this.popupstyle = "center";
      this.ani = ["zoom-out", "fade"];
      this.transClass = {
        "position": "fixed",
        "display": "flex",
        "flexDirection": "column",
        "bottom": 0,
        "left": 0,
        "right": 0,
        "top": 0,
        "justifyContent": "center",
        "alignItems": "center"
      };
    }
  }
};
if (!Array) {
  const _easycom_uni_transition2 = common_vendor.resolveComponent("uni-transition");
  _easycom_uni_transition2();
}
const _easycom_uni_transition = () => "../uni-transition/uni-transition.js";
if (!Math) {
  _easycom_uni_transition();
}
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: $data.showPopup
  }, $data.showPopup ? common_vendor.e({
    b: $data.maskShow
  }, $data.maskShow ? {
    c: common_vendor.o($options.onTap),
    d: common_vendor.p({
      ["mode-class"]: ["fade"],
      styles: $data.maskClass,
      duration: $data.duration,
      show: $data.showTrans
    })
  } : {}, {
    e: common_vendor.o((...args) => $options.clear && $options.clear(...args)),
    f: common_vendor.o($options.onTap),
    g: common_vendor.p({
      ["mode-class"]: $data.ani,
      styles: $data.transClass,
      duration: $data.duration,
      show: $data.showTrans
    }),
    h: common_vendor.n($data.popupstyle),
    i: common_vendor.o((...args) => $options.clear && $options.clear(...args))
  }) : {});
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__scopeId", "data-v-7da806a4"], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/uni-popup/uni-popup.vue"]]);
wx.createComponent(Component);
