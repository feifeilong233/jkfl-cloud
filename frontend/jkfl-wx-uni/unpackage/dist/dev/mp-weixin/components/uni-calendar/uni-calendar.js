"use strict";
var components_uniCalendar_util = require("./util.js");
var common_vendor = require("../../common/vendor.js");
require("./calendar.js");
const calendarItem = () => "./uni-calendar-item.js";
const _sfc_main = {
  components: {
    calendarItem
  },
  props: {
    date: {
      type: String,
      default: ""
    },
    selected: {
      type: Array,
      default() {
        return [];
      }
    },
    lunar: {
      type: Boolean,
      default: false
    },
    startDate: {
      type: String,
      default: ""
    },
    endDate: {
      type: String,
      default: ""
    },
    range: {
      type: Boolean,
      default: false
    },
    insert: {
      type: Boolean,
      default: true
    },
    showMonth: {
      type: Boolean,
      default: true
    },
    clearDate: {
      type: Boolean,
      default: true
    }
  },
  data() {
    return {
      show: false,
      weeks: [],
      calendar: {},
      nowDate: "",
      aniMaskShow: false
    };
  },
  watch: {
    date(newVal) {
      this.cale.setDate(newVal);
      this.init(this.cale.selectDate.fullDate);
    },
    startDate(val) {
      this.cale.resetSatrtDate(val);
    },
    endDate(val) {
      this.cale.resetEndDate(val);
    },
    selected(newVal) {
      this.cale.setSelectInfo(this.nowDate.fullDate, newVal);
      this.weeks = this.cale.weeks;
    }
  },
  created() {
    this.cale = new components_uniCalendar_util.Calendar({
      selected: this.selected,
      startDate: this.startDate,
      endDate: this.endDate,
      range: this.range
    });
    this.cale.setDate(this.date);
    this.init(this.cale.selectDate.fullDate);
  },
  methods: {
    clean() {
    },
    bindDateChange(e) {
      const value = e.detail.value + "-1";
      this.cale.setDate(value);
      this.init(value);
      let year = this.cale.getDate(value).year;
      let month = this.cale.getDate(value).month;
      this.$emit("confirm", {
        "year": year,
        "month": Number(month)
      });
    },
    init(date) {
      this.weeks = this.cale.weeks;
      this.nowDate = this.calendar = this.cale.getInfo(date);
    },
    open() {
      if (this.clearDate && !this.insert) {
        this.cale.cleanMultipleStatus();
        this.cale.setDate(this.date);
        this.init(this.cale.selectDate.fullDate);
      }
      this.show = true;
      this.$nextTick(() => {
        setTimeout(() => {
          this.aniMaskShow = true;
        }, 50);
      });
    },
    close() {
      this.aniMaskShow = false;
      this.$nextTick(() => {
        setTimeout(() => {
          this.show = false;
          this.$emit("close");
        }, 300);
      });
    },
    confirm() {
      this.setEmit("confirm");
      this.close();
    },
    change() {
      if (!this.insert)
        return;
      this.setEmit("change");
    },
    monthSwitch() {
      let {
        year,
        month
      } = this.nowDate;
      this.$emit("monthSwitch", {
        year,
        month: Number(month)
      });
    },
    setEmit(name) {
      let {
        year,
        month,
        date,
        fullDate,
        lunar,
        extraInfo
      } = this.calendar;
      this.$emit(name, {
        range: this.cale.multipleStatus,
        year,
        month,
        date,
        fulldate: fullDate,
        lunar,
        extraInfo: extraInfo || {}
      });
    },
    choiceDate(weeks) {
      if (weeks.disable)
        return;
      this.calendar = weeks;
      this.cale.setMultiple(this.calendar.fullDate);
      this.weeks = this.cale.weeks;
      this.change();
    },
    backtoday() {
      console.log(this.cale.getDate(new Date()).fullDate);
      let date = this.cale.getDate(new Date()).fullDate;
      this.cale.setDate(date);
      this.init(date);
      this.change();
    },
    pre() {
      const preDate = this.cale.getDate(this.nowDate.fullDate, -1, "month").fullDate;
      this.setDate(preDate);
      this.monthSwitch();
    },
    next() {
      const nextDate = this.cale.getDate(this.nowDate.fullDate, 1, "month").fullDate;
      this.setDate(nextDate);
      this.monthSwitch();
    },
    setDate(date) {
      this.cale.setDate(date);
      this.weeks = this.cale.weeks;
      this.nowDate = this.cale.getInfo(date);
    }
  }
};
if (!Array) {
  const _component_calendar_item = common_vendor.resolveComponent("calendar-item");
  _component_calendar_item();
}
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: !$props.insert && $data.show
  }, !$props.insert && $data.show ? {
    b: $data.aniMaskShow ? 1 : "",
    c: common_vendor.o((...args) => $options.clean && $options.clean(...args))
  } : {}, {
    d: $props.insert || $data.show
  }, $props.insert || $data.show ? common_vendor.e({
    e: !$props.insert
  }, !$props.insert ? {
    f: common_vendor.o((...args) => $options.close && $options.close(...args)),
    g: common_vendor.o((...args) => $options.confirm && $options.confirm(...args))
  } : {}, {
    h: common_vendor.o((...args) => $options.pre && $options.pre(...args)),
    i: common_vendor.t(($data.nowDate.year || "") + "\u5E74" + ($data.nowDate.month || "") + "\u6708"),
    j: $props.date,
    k: common_vendor.o((...args) => $options.bindDateChange && $options.bindDateChange(...args)),
    l: common_vendor.o((...args) => $options.next && $options.next(...args)),
    m: common_vendor.o((...args) => $options.backtoday && $options.backtoday(...args)),
    n: $props.showMonth
  }, $props.showMonth ? {
    o: common_vendor.t($data.nowDate.month)
  } : {}, {
    p: common_vendor.f($data.weeks, (item, weekIndex, i0) => {
      return {
        a: common_vendor.f(item, (weeks, weeksIndex, i1) => {
          return {
            a: "21a99d64-0-" + i0 + "-" + i1,
            b: common_vendor.p({
              weeks,
              calendar: $data.calendar,
              selected: $props.selected,
              lunar: $props.lunar
            }),
            c: weeksIndex
          };
        }),
        b: weekIndex
      };
    }),
    q: common_vendor.o($options.choiceDate),
    r: !$props.insert ? 1 : "",
    s: $data.aniMaskShow ? 1 : ""
  }) : {});
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__scopeId", "data-v-21a99d64"], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/uni-calendar/uni-calendar.vue"]]);
wx.createComponent(Component);
