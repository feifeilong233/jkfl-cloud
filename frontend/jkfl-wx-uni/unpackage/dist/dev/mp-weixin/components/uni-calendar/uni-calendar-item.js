"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  data() {
    return {
      circleStyle: ""
    };
  },
  props: {
    weeks: {
      type: Object,
      default() {
        return {};
      }
    },
    calendar: {
      type: Object,
      default: () => {
        return {};
      }
    },
    selected: {
      type: Array,
      default: () => {
        return [];
      }
    },
    lunar: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    choiceDate(weeks) {
      this.$emit("change", weeks);
    }
  },
  mounted: function() {
    if (this.$props.weeks.extraInfo) {
      this.circleStyle = "uni-calendar-item__weeks-box-circle " + this.$props.weeks.extraInfo.color;
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: $props.selected && $props.weeks.extraInfo
  }, $props.selected && $props.weeks.extraInfo ? {
    b: $props.weeks.extraInfo.color == "green" ? 1 : "",
    c: $props.weeks.extraInfo.color == "red" ? 1 : "",
    d: $props.weeks.extraInfo.color == "orange" ? 1 : ""
  } : {}, {
    e: common_vendor.t($props.weeks.date),
    f: $props.weeks.isDay ? 1 : "",
    g: $props.calendar.fullDate === $props.weeks.fullDate && $props.weeks.isDay ? 1 : "",
    h: $props.calendar.fullDate === $props.weeks.fullDate && !$props.weeks.isDay ? 1 : "",
    i: $props.weeks.beforeMultiple ? 1 : "",
    j: $props.weeks.multiple ? 1 : "",
    k: $props.weeks.afterMultiple ? 1 : "",
    l: $props.weeks.disable ? 1 : "",
    m: !$props.lunar && !$props.weeks.extraInfo && $props.weeks.isDay
  }, !$props.lunar && !$props.weeks.extraInfo && $props.weeks.isDay ? {
    n: $props.weeks.isDay ? 1 : "",
    o: $props.calendar.fullDate === $props.weeks.fullDate && $props.weeks.isDay ? 1 : "",
    p: $props.calendar.fullDate === $props.weeks.fullDate && !$props.weeks.isDay ? 1 : "",
    q: $props.weeks.beforeMultiple ? 1 : "",
    r: $props.weeks.multiple ? 1 : "",
    s: $props.weeks.afterMultiple ? 1 : ""
  } : {}, {
    t: $props.lunar && !$props.weeks.extraInfo
  }, $props.lunar && !$props.weeks.extraInfo ? {
    v: common_vendor.t($props.weeks.isDay ? "\u4ECA\u5929" : $props.weeks.lunar.IDayCn === "\u521D\u4E00" ? $props.weeks.lunar.IMonthCn : $props.weeks.lunar.IDayCn),
    w: $props.weeks.isDay ? 1 : "",
    x: $props.calendar.fullDate === $props.weeks.fullDate && $props.weeks.isDay ? 1 : "",
    y: $props.calendar.fullDate === $props.weeks.fullDate && !$props.weeks.isDay ? 1 : "",
    z: $props.weeks.beforeMultiple ? 1 : "",
    A: $props.weeks.multiple ? 1 : "",
    B: $props.weeks.afterMultiple ? 1 : "",
    C: $props.weeks.disable ? 1 : ""
  } : {}, {
    D: $props.weeks.extraInfo && $props.weeks.extraInfo.info
  }, $props.weeks.extraInfo && $props.weeks.extraInfo.info ? {
    E: common_vendor.t($props.weeks.extraInfo.info),
    F: $props.weeks.extraInfo.info ? 1 : "",
    G: $props.weeks.isDay ? 1 : "",
    H: $props.calendar.fullDate === $props.weeks.fullDate && $props.weeks.isDay ? 1 : "",
    I: $props.calendar.fullDate === $props.weeks.fullDate && !$props.weeks.isDay ? 1 : "",
    J: $props.weeks.beforeMultiple ? 1 : "",
    K: $props.weeks.multiple ? 1 : "",
    L: $props.weeks.afterMultiple ? 1 : "",
    M: $props.weeks.disable ? 1 : "",
    N: $props.weeks.extraInfo.color == "green" ? 1 : "",
    O: $props.weeks.extraInfo.color == "red" ? 1 : "",
    P: $props.weeks.extraInfo.color == "orange" ? 1 : ""
  } : {}, {
    Q: $props.weeks.disable ? 1 : "",
    R: $props.calendar.fullDate === $props.weeks.fullDate && $props.weeks.isDay ? 1 : "",
    S: $props.calendar.fullDate === $props.weeks.fullDate && !$props.weeks.isDay ? 1 : "",
    T: $props.weeks.beforeMultiple ? 1 : "",
    U: $props.weeks.multiple ? 1 : "",
    V: $props.weeks.afterMultiple ? 1 : "",
    W: common_vendor.o(($event) => $options.choiceDate($props.weeks))
  });
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__scopeId", "data-v-09f1e40c"], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/uni-calendar/uni-calendar-item.vue"]]);
wx.createComponent(Component);
