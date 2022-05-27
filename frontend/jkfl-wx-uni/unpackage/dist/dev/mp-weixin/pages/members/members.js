"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  data() {
    return {
      list: [],
      members: []
    };
  },
  onShow: function() {
    this.loadData(this);
  },
  onLoad: function(options) {
    if (options.hasOwnProperty("members")) {
      let members = options.members;
      this.members = members.split(",");
    }
  },
  methods: {
    loadData: function(ref) {
      ref.ajax(ref.url.searchUserGroupByDept, "POST", { keyword: ref.keyword }, function(resp) {
        let result = resp.data.result;
        ref.list = result;
        for (let dept of ref.list) {
          for (let member of dept.members) {
            if (ref.members.indexOf(member.userId + "") != -1) {
              member.checked = true;
            } else {
              member.checked = false;
            }
          }
        }
      });
    },
    selected: function(e) {
      let that = this;
      that.members = e.detail.value;
      let pages = getCurrentPages();
      let prePage = pages[pages.length - 2];
      prePage.members = that.members;
      prePage.finishMembers = true;
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: common_vendor.f($data.list, (dept, k0, i0) => {
      return {
        a: common_vendor.t(dept.deptName),
        b: common_vendor.t(dept.count),
        c: common_vendor.f(dept.members, (member, k1, i1) => {
          return {
            a: common_vendor.t(member.name),
            b: member.userId,
            c: member.checked,
            d: member.userId
          };
        }),
        d: dept.id
      };
    }),
    b: common_vendor.o((...args) => $options.selected && $options.selected(...args))
  };
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/members/members.vue"]]);
wx.createPage(MiniProgramPage);
