"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  data() {
    return {
      page: 1,
      length: 20,
      list: [],
      isLastPage: false
    };
  },
  onShow: function() {
    let that = this;
    that.page = 1;
    that.isLastPage = false;
    that = [];
    this.loadMeetingList(this);
  },
  onReachBottom: function() {
    let that = this;
    if (that.isLastPage)
      return;
    that.page = that.page + 1;
    this.loadMeetingList(this);
  },
  methods: {
    loadMeetingList: function(ref) {
      let data = {
        page: ref.page,
        length: ref.length
      };
      ref.ajax(ref.url.searchMeetingListByPage, "POST", data, function(resp) {
        let result = resp.data.result;
        console.log(result);
        if (result === null || result.length === 0) {
          ref.isLastPage = true;
          ref.page = ref.page - 1;
          if (ref.page > 1) {
            common_vendor.index.showToast({
              icon: "none",
              title: "\u5DF2\u7ECF\u5230\u5E95\u4E86"
            });
          }
        } else {
          for (let item of result) {
            for (let meeting of item.list) {
              if (meeting.type === 1)
                meeting.type = "\u7EBF\u4E0A\u4F1A\u8BAE";
              else if (meeting.type === 2)
                meeting.type = "\u7EBF\u4E0B\u4F1A\u8BAE";
              if (meeting.status === 3)
                meeting.status = "\u672A\u5F00\u59CB";
              else if (meeting.start === 4)
                meeting.status = "\u8FDB\u884C\u4E2D";
            }
            if (ref.list.length > 0) {
              let last = ref.list[ref.list.length - 1];
              if (last.date === item.date) {
                last.list = last.list.concat(item.list);
              } else {
                ref.list.push(item);
              }
            } else {
              ref.list.push(item);
            }
          }
        }
      });
    },
    toMeetingPage: function(id, opt) {
      common_vendor.index.navigateTo({
        url: "../meeting/meeting?id=" + id + "&opt=" + opt
      });
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: _ctx.checkPermission(["ROOT", "MEETING:INSERT"])
  }, _ctx.checkPermission(["ROOT", "MEETING:INSERT"]) ? {
    b: common_vendor.o(($event) => $options.toMeetingPage(null, "insert"))
  } : {}, {
    c: common_vendor.f($data.list, (item, k0, i0) => {
      return {
        a: common_vendor.t(item.date),
        b: common_vendor.f(item.list, (meeting, k1, i1) => {
          return common_vendor.e({
            a: meeting.type === "\u7EBF\u4E0A\u4F1A\u8BAE"
          }, meeting.type === "\u7EBF\u4E0A\u4F1A\u8BAE" ? {} : {}, {
            b: meeting.type === "\u7EBF\u4E0B\u4F1A\u8BAE"
          }, meeting.type === "\u7EBF\u4E0B\u4F1A\u8BAE" ? {} : {}, {
            c: common_vendor.t(meeting.type),
            d: common_vendor.t(meeting.status),
            e: common_vendor.n(meeting.status === "\u672A\u5F00\u59CB" ? "blue" : "red"),
            f: common_vendor.t(meeting.title),
            g: common_vendor.t(meeting.start),
            h: common_vendor.t(meeting.end),
            i: common_vendor.t(meeting.name),
            j: meeting.type === "\u7EBF\u4E0B\u4F1A\u8BAE"
          }, meeting.type === "\u7EBF\u4E0B\u4F1A\u8BAE" ? {
            k: common_vendor.t(meeting.place)
          } : {}, {
            l: common_vendor.t(meeting.desc),
            m: meeting.type === "\u7EBF\u4E0A\u4F1A\u8BAE"
          }, meeting.type === "\u7EBF\u4E0A\u4F1A\u8BAE" ? {} : {}, {
            n: meeting.id
          });
        }),
        c: item.date
      };
    })
  });
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/meeting_list/meeting_list.vue"]]);
wx.createPage(MiniProgramPage);
