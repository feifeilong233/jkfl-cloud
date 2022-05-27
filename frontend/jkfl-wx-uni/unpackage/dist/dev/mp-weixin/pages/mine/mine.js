"use strict";
var common_vendor = require("../../common/vendor.js");
const uniList = () => "../../components/uni-list/uni-list.js";
const uniListItem = () => "../../components/uni-list-item/uni-list-item.js";
const _sfc_main = {
  components: {
    uniList,
    uniListItem
  },
  data() {
    return {
      name: "",
      deptName: "",
      photo: ""
    };
  },
  onShow: function() {
    let that = this;
    that.ajax(that.url.searchUserSummary, "GET", null, function(resp) {
      let result = resp.data.result;
      console.log(result);
      that.name = result.name;
      that.deptName = result.deptName;
      that.photo = result.photo;
    });
  },
  methods: {}
};
if (!Array) {
  const _easycom_uni_list_item2 = common_vendor.resolveComponent("uni-list-item");
  const _easycom_uni_list2 = common_vendor.resolveComponent("uni-list");
  (_easycom_uni_list_item2 + _easycom_uni_list2)();
}
const _easycom_uni_list_item = () => "../../components/uni-list-item/uni-list-item.js";
const _easycom_uni_list = () => "../../components/uni-list/uni-list.js";
if (!Math) {
  (_easycom_uni_list_item + _easycom_uni_list)();
}
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: $data.photo,
    b: common_vendor.t($data.name),
    c: common_vendor.p({
      title: "\u4E2A\u4EBA\u8D44\u6599",
      link: true,
      to: ""
    }),
    d: common_vendor.p({
      title: "\u6211\u7684\u8003\u52E4",
      link: true,
      to: "/pages/my_checkin/my_checkin"
    }),
    e: common_vendor.p({
      title: "\u7F3A\u8BFE\u8BB0\u5F55",
      link: true,
      to: ""
    })
  };
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/mine/mine.vue"]]);
wx.createPage(MiniProgramPage);
