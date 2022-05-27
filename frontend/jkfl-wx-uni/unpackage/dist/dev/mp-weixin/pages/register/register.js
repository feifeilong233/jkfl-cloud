"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  data() {
    return {
      registerCode: ""
    };
  },
  methods: {
    register: function() {
      let that = this;
      if (that.registerCode == null | that.registerCode.length == 0) {
        common_vendor.index.showToast({
          icon: "none",
          title: "\u9080\u8BF7\u7801\u4E0D\u80FD\u4E3A\u7A7A"
        });
        return;
      } else if (/^[0-9]{6}$/.test(that.registerCode) == false) {
        common_vendor.index.showToast({
          icon: "none",
          title: "\u9080\u8BF7\u7801\u5FC5\u987B\u4E3A6\u4F4D"
        });
        return;
      }
      common_vendor.index.login({
        provider: "weixin",
        success: function(resp) {
          console.log(resp);
          let code = resp.code;
          common_vendor.index.getUserInfo({
            provider: "weixin",
            success: function(resp2) {
              let { nickName, avatarUrl } = resp2.userInfo;
              let data = {
                code,
                nickname: nickName,
                photo: avatarUrl,
                registerCode: that.registerCode
              };
              that.ajax(that.url.register, "POST", data, function(resp3) {
                let permission = resp3.data.permission;
                common_vendor.index.setStorageSync("permissions", permission);
                console.log(permission);
              });
            }
          });
        },
        fail: function() {
        }
      });
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: $data.registerCode,
    b: common_vendor.o(($event) => $data.registerCode = $event.detail.value),
    c: common_vendor.o(($event) => $options.register())
  };
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/register/register.vue"]]);
wx.createPage(MiniProgramPage);
