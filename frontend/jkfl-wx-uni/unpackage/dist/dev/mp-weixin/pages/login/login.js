"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  data() {
    return {};
  },
  methods: {
    toRegister: function() {
      common_vendor.index.navigateTo({
        url: "../register/register"
      });
    },
    toLogin: function() {
      let that = this;
      common_vendor.index.login({
        provider: "weixin",
        success: function(resp) {
          let { code } = resp;
          that.ajax(that.url.login, "POST", { "code": code }, function(resp2) {
            let permission = resp2.data.permissions;
            console.log("permission", permission);
            common_vendor.index.setStorageSync("permission", permission);
          });
          common_vendor.index.switchTab({
            url: "../index/index"
          });
        },
        fail: function(e) {
          console.log(e);
          common_vendor.index.showToast({
            icon: "none",
            title: "\u6267\u884C\u5F02\u5E38"
          });
        }
      });
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: common_vendor.o(($event) => $options.toLogin()),
    b: common_vendor.o(($event) => $options.toRegister())
  };
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/login/login.vue"]]);
wx.createPage(MiniProgramPage);
