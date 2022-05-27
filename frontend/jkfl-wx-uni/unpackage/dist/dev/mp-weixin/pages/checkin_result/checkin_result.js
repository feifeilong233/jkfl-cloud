"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  data() {
    return {
      name: "",
      photo: "",
      deptName: "",
      address: "",
      status: "",
      risk: "",
      checkinTime: "",
      date: "",
      attendanceTime: "",
      closingTime: "",
      checkinDays: 0,
      weekCheckin: []
    };
  },
  onShow: function() {
    let that = this;
    that.ajax(that.url.searchTodayCheckin, "GET", null, function(resp) {
      let result = resp.data.result;
      that.name = result.name;
      that.photo = result.photo;
      that.deptName = result.deptName;
      that.date = result.date;
      that.attendanceTime = result.attendanceTime;
      that.closingTime = result.closingTime;
      that.checkinTime = result.checkinTime;
      that.status = result.status;
      that.risk = result.risk;
      that.address = result.address;
      that.checkinDays = result.checkinDays;
      that.weekCheckin = result.weekCheckin;
    });
  },
  methods: {}
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: $data.photo,
    b: common_vendor.t($data.name),
    c: common_vendor.t($data.deptName == null ? "" : $data.deptName),
    d: common_vendor.t($data.date),
    e: common_vendor.t($data.attendanceTime),
    f: common_vendor.t($data.checkinTime),
    g: $data.status == "\u6B63\u5E38"
  }, $data.status == "\u6B63\u5E38" ? {
    h: common_vendor.t($data.status)
  } : {}, {
    i: $data.status == "\u8FDF\u5230"
  }, $data.status == "\u8FDF\u5230" ? {
    j: common_vendor.t($data.status)
  } : {}, {
    k: common_vendor.t($data.address),
    l: $data.risk == "\u4F4E\u98CE\u9669"
  }, $data.risk == "\u4F4E\u98CE\u9669" ? {
    m: common_vendor.t($data.risk)
  } : {}, {
    n: $data.risk == "\u4E2D\u98CE\u9669"
  }, $data.risk == "\u4E2D\u98CE\u9669" ? {
    o: common_vendor.t($data.risk)
  } : {}, {
    p: $data.risk == "\u9AD8\u98CE\u9669"
  }, $data.risk == "\u9AD8\u98CE\u9669" ? {
    q: common_vendor.t($data.risk)
  } : {}, {
    r: common_vendor.t($data.closingTime),
    s: common_vendor.t($data.checkinDays),
    t: common_vendor.f($data.weekCheckin, (one, k0, i0) => {
      return common_vendor.e({
        a: one.type == "\u5DE5\u4F5C\u65E5"
      }, one.type == "\u5DE5\u4F5C\u65E5" ? {} : {}, {
        b: one.type == "\u8282\u5047\u65E5"
      }, one.type == "\u8282\u5047\u65E5" ? {} : {}, {
        c: common_vendor.t(one.day),
        d: one.status == "\u6B63\u5E38"
      }, one.status == "\u6B63\u5E38" ? {
        e: common_vendor.t(one.status)
      } : {}, {
        f: one.status == "\u8FDF\u5230"
      }, one.status == "\u8FDF\u5230" ? {
        g: common_vendor.t(one.status)
      } : {}, {
        h: one.status == "\u7F3A\u52E4"
      }, one.status == "\u7F3A\u52E4" ? {
        i: common_vendor.t(one.status)
      } : {}, {
        j: one
      });
    })
  });
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/checkin_result/checkin_result.vue"]]);
wx.createPage(MiniProgramPage);
