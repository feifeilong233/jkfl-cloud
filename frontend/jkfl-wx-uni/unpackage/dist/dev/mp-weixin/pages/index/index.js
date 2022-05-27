"use strict";
var common_vendor = require("../../common/vendor.js");
const uniPopup = () => "../../components/uni-popup/uni-popup.js";
const uniPopupMessage = () => "../../components/uni-popup/uni-popup-message.js";
const uniPopupDialog = () => "../../components/uni-popup/uni-popup-dialog.js";
const uniCalendar = () => "../../components/uni-calendar/uni-calendar.js";
const _sfc_main = {
  components: {
    uniPopup,
    uniPopupMessage,
    uniPopupDialog,
    uniCalendar
  },
  data() {
    return {
      unreadRows: 0,
      lastRows: 0,
      timer: null,
      calendar: [],
      meetingPage: 1,
      meetingLength: 20,
      meetingList: [],
      isMeetingLastPage: false
    };
  },
  onLoad: function() {
    let that = this;
    common_vendor.index.$on("showMessage", function() {
      that.$refs.popupMsg.open();
    });
    that.ajax(that.url.refreshMessage, "GET", null, function(resp) {
      that.unreadRows = resp.data.unreadRows;
      that.lastRows = resp.data.lastRows;
      if (that.lastRows > 0) {
        common_vendor.index.$emit("showMessage");
      }
    });
  },
  onUnload: function() {
    common_vendor.index.$off("showMessage");
  },
  onShow: function() {
    let that = this;
    that.timer = setInterval(function() {
      that.ajax(that.url.refreshMessage, "GET", null, function(resp) {
        that.unreadRows = resp.data.unreadRows;
        that.lastRows = resp.data.lastRows;
        if (that.lastRows > 0) {
          common_vendor.index.$emit("showMessage");
        }
      });
    }, 5e3);
    that.meetingPage = 1;
    that.isMeetingLastPage = false;
    that.meetingList = [];
    that.loadMeetingList(that);
    let date = new Date();
    that.loadMeetingInMonth(that, date.getFullYear(), date.getMonth() + 1);
  },
  onHide: function() {
    let that = this;
    clearInterval(that.timer);
  },
  onReachBottom: function() {
    if (this.isMeetingLastPage) {
      return;
    }
    this.meetingPage = this.meetingPage + 1;
    this.loadMeetingList(this);
  },
  methods: {
    toPage: function(name, url) {
      console.log("Name", name);
      let flag = false;
      if (name == "\u5728\u7EBF\u5BA1\u6279") {
        flag = this.checkPermission(["WORKFLOW:APPROVAL"]);
      } else {
        flag = true;
      }
      if (!flag) {
        common_vendor.index.showToast({
          icon: "none",
          title: "\u60A8\u4E0D\u5177\u5907\u76F8\u5173\u6743\u9650"
        });
      } else {
        common_vendor.index.navigateTo({
          url
        });
      }
    },
    loadMeetingList: function(ref) {
      let data = {
        page: ref.meetingPage,
        length: ref.meetingLength
      };
      ref.ajax(ref.url.searchMyMeetingListByPage, "POST", data, function(resp) {
        let result = resp.data.result;
        if (result == null || result.length == 0) {
          ref.isMeetingLastPage = true;
          ref.meetingPage = ref.meetingPage - 1;
          if (ref.meetingPage > 1) {
            common_vendor.index.showToast({
              icon: "none",
              title: "\u5DF2\u7ECF\u5230\u5E95\u4E86"
            });
          }
        } else {
          let list = [];
          for (let one of result) {
            for (let meeting of one.list) {
              if (meeting.type == 1) {
                meeting.type = "\u7EBF\u4E0A\u4F1A\u8BAE";
              } else if (meeting.type == 2) {
                meeting.type = "\u7EBF\u4E0B\u4F1A\u8BAE";
              }
              if (meeting.status == 3) {
                meeting.status = "\u672A\u5F00\u59CB";
              } else if (meeting.status == 4) {
                meeting.status = "\u8FDB\u884C\u4E2D";
              }
              list.push(meeting);
            }
          }
          ref.meetingList = list;
        }
      });
    },
    loadMeetingInMonth: function(ref, year, month) {
      let data = {
        year,
        month
      };
      ref.ajax(ref.url.searchUserMeetingInMonth, "POST", data, function(resp) {
        ref.calendar = [];
        for (let one of resp.data.result) {
          ref.calendar.push({ date: one, info: "\u4F1A\u8BAE" });
        }
      });
    },
    changeMonth: function(e) {
      let that = this;
      let year = e.year;
      let month = e.month;
      that.loadMeetingInMonth(that, year, month);
    }
  }
};
if (!Array) {
  const _easycom_uni_calendar2 = common_vendor.resolveComponent("uni-calendar");
  const _component_uni_popup_message = common_vendor.resolveComponent("uni-popup-message");
  const _easycom_uni_popup2 = common_vendor.resolveComponent("uni-popup");
  (_easycom_uni_calendar2 + _component_uni_popup_message + _easycom_uni_popup2)();
}
const _easycom_uni_calendar = () => "../../components/uni-calendar/uni-calendar.js";
const _easycom_uni_popup = () => "../../components/uni-popup/uni-popup.js";
if (!Math) {
  (_easycom_uni_calendar + _easycom_uni_popup)();
}
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: common_vendor.t($data.unreadRows),
    b: common_vendor.o(($event) => $options.toPage("\u6D88\u606F\u63D0\u9192", "/pages/message_list/message_list")),
    c: common_vendor.o(($event) => $options.toPage("\u5728\u7EBF\u7B7E\u5230", "../checkin/checkin")),
    d: common_vendor.o(($event) => $options.toPage("\u5728\u7EBF\u5BA1\u6279", "../approval_list/approval_list")),
    e: common_vendor.o($options.changeMonth),
    f: common_vendor.p({
      insert: true,
      lunar: true,
      selected: $data.calendar
    }),
    g: common_vendor.f($data.meetingList, (one, k0, i0) => {
      return {
        a: common_vendor.t(one.title),
        b: common_vendor.t(one.hour == 0 ? 1 : one.hour),
        c: common_vendor.t(one.date),
        d: common_vendor.t(one.start),
        e: common_vendor.t(one.type == "\u7EBF\u4E0A\u4F1A\u8BAE" ? one.type : one.place),
        f: one.photo,
        g: one.id
      };
    }),
    h: common_vendor.p({
      type: "success",
      message: "\u63A5\u6536\u5230" + $data.lastRows + "\u6761\u6D88\u606F",
      duration: 2e3
    }),
    i: common_vendor.sr("popupMsg", "588318e5-1"),
    j: common_vendor.p({
      type: "top"
    })
  };
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/index/index.vue"]]);
wx.createPage(MiniProgramPage);
