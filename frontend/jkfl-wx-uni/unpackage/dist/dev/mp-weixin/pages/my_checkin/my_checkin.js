"use strict";
var common_vendor = require("../../common/vendor.js");
const uniCalendar = () => "../../components/uni-calendar/uni-calendar.js";
const _sfc_main = {
  components: {
    uniCalendar
  },
  data() {
    return {
      list: [],
      sum_1: 0,
      sum_2: 0,
      sum_3: 0
    };
  },
  onShow: function() {
    let that = this;
    let date = new Date();
    let year = date.getFullYear();
    let month = date.getMonth() + 1;
    that.searchCheckin(that, year, month);
  },
  methods: {
    searchCheckin: function(ref, year, month) {
      let that = ref;
      that.sum_1 = 0;
      that.sum_2 = 0;
      that.sum_3 = 0;
      that.list.length = 0;
      that.ajax(that.url.searchMonthCheckin, "POST", { year, month }, function(resp) {
        for (let one of resp.data.list) {
          if (one.status != null && one.status != "") {
            let color = "";
            if (one.status == "\u6B63\u5E38") {
              color = "green";
            } else if (one.status == "\u8FDF\u5230") {
              color = "orange";
            } else if (one.status == "\u7F3A\u52E4") {
              color = "red";
            }
            that.list.push({
              date: one.date,
              info: one.status,
              color
            });
          }
        }
        that.sum_1 = resp.data.sum_1;
        that.sum_2 = resp.data.sum_2;
        that.sum_3 = resp.data.sum_3;
      });
    },
    changeMonth: function(e) {
      let that = this;
      let year = e.year;
      let month = e.month;
      that.searchCheckin(that, year, month);
    }
  }
};
if (!Array) {
  const _easycom_uni_calendar2 = common_vendor.resolveComponent("uni-calendar");
  _easycom_uni_calendar2();
}
const _easycom_uni_calendar = () => "../../components/uni-calendar/uni-calendar.js";
if (!Math) {
  _easycom_uni_calendar();
}
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: common_vendor.t($data.sum_1),
    b: common_vendor.t($data.sum_1),
    c: common_vendor.t($data.sum_2),
    d: common_vendor.t($data.sum_3),
    e: common_vendor.o($options.changeMonth),
    f: common_vendor.o($options.changeMonth),
    g: common_vendor.p({
      insert: true,
      lunar: false,
      selected: $data.list
    })
  };
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/my_checkin/my_checkin.vue"]]);
wx.createPage(MiniProgramPage);
