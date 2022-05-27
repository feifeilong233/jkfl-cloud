"use strict";
var __defProp = Object.defineProperty;
var __defProps = Object.defineProperties;
var __getOwnPropDescs = Object.getOwnPropertyDescriptors;
var __getOwnPropSymbols = Object.getOwnPropertySymbols;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __propIsEnum = Object.prototype.propertyIsEnumerable;
var __defNormalProp = (obj, key, value) => key in obj ? __defProp(obj, key, { enumerable: true, configurable: true, writable: true, value }) : obj[key] = value;
var __spreadValues = (a, b) => {
  for (var prop in b || (b = {}))
    if (__hasOwnProp.call(b, prop))
      __defNormalProp(a, prop, b[prop]);
  if (__getOwnPropSymbols)
    for (var prop of __getOwnPropSymbols(b)) {
      if (__propIsEnum.call(b, prop))
        __defNormalProp(a, prop, b[prop]);
    }
  return a;
};
var __spreadProps = (a, b) => __defProps(a, __getOwnPropDescs(b));
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  name: "uniTransition",
  props: {
    show: {
      type: Boolean,
      default: false
    },
    modeClass: {
      type: Array,
      default() {
        return [];
      }
    },
    duration: {
      type: Number,
      default: 300
    },
    styles: {
      type: Object,
      default() {
        return {};
      }
    }
  },
  data() {
    return {
      isShow: false,
      transform: "",
      ani: {
        in: "",
        active: ""
      }
    };
  },
  watch: {
    show: {
      handler(newVal) {
        if (newVal) {
          this.open();
        } else {
          this.close();
        }
      },
      immediate: true
    }
  },
  computed: {
    stylesObject() {
      let styles = __spreadProps(__spreadValues({}, this.styles), {
        "transition-duration": this.duration / 1e3 + "s"
      });
      let transfrom = "";
      for (let i in styles) {
        let line = this.toLine(i);
        transfrom += line + ":" + styles[i] + ";";
      }
      return transfrom;
    }
  },
  created() {
  },
  methods: {
    change() {
      this.$emit("click", {
        detail: this.isShow
      });
    },
    open() {
      clearTimeout(this.timer);
      this.isShow = true;
      this.transform = "";
      this.ani.in = "";
      for (let i in this.getTranfrom(false)) {
        if (i === "opacity") {
          this.ani.in = "fade-in";
        } else {
          this.transform += `${this.getTranfrom(false)[i]} `;
        }
      }
      this.$nextTick(() => {
        setTimeout(() => {
          this._animation(true);
        }, 50);
      });
    },
    close(type) {
      clearTimeout(this.timer);
      this._animation(false);
    },
    _animation(type) {
      let styles = this.getTranfrom(type);
      this.transform = "";
      for (let i in styles) {
        if (i === "opacity") {
          this.ani.in = `fade-${type ? "out" : "in"}`;
        } else {
          this.transform += `${styles[i]} `;
        }
      }
      this.timer = setTimeout(() => {
        if (!type) {
          this.isShow = false;
        }
        this.$emit("change", {
          detail: this.isShow
        });
      }, this.duration);
    },
    getTranfrom(type) {
      let styles = {
        transform: ""
      };
      this.modeClass.forEach((mode) => {
        switch (mode) {
          case "fade":
            styles.opacity = type ? 1 : 0;
            break;
          case "slide-top":
            styles.transform += `translateY(${type ? "0" : "-100%"}) `;
            break;
          case "slide-right":
            styles.transform += `translateX(${type ? "0" : "100%"}) `;
            break;
          case "slide-bottom":
            styles.transform += `translateY(${type ? "0" : "100%"}) `;
            break;
          case "slide-left":
            styles.transform += `translateX(${type ? "0" : "-100%"}) `;
            break;
          case "zoom-in":
            styles.transform += `scale(${type ? 1 : 0.8}) `;
            break;
          case "zoom-out":
            styles.transform += `scale(${type ? 1 : 1.2}) `;
            break;
        }
      });
      return styles;
    },
    _modeClassArr(type) {
      let mode = this.modeClass;
      if (typeof mode !== "string") {
        let modestr = "";
        mode.forEach((item) => {
          modestr += item + "-" + type + ",";
        });
        return modestr.substr(0, modestr.length - 1);
      } else {
        return mode + "-" + type;
      }
    },
    toLine(name) {
      return name.replace(/([A-Z])/g, "-$1").toLowerCase();
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: $data.isShow
  }, $data.isShow ? {
    b: common_vendor.n($data.ani.in),
    c: common_vendor.s("transform:" + $data.transform + ";" + $options.stylesObject),
    d: common_vendor.o((...args) => $options.change && $options.change(...args))
  } : {});
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/uni-transition/uni-transition.vue"]]);
wx.createComponent(Component);
