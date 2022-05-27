"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  data() {
    return {
      id: null,
      readFlag: null,
      refId: null,
      sendTime: "",
      msg: ""
    };
  },
  onShow: function() {
    let that = this;
    common_vendor.index.setNavigationBarTitle({
      title: "\u7CFB\u7EDF\u901A\u77E5"
    });
    that.ajax(that.url.searchMessageById, "POST", { "id": that.id }, function(resp) {
      let result = resp.data.result;
      that.sendTime = result.sendTime;
      that.msg = result.msg;
    });
  },
  onLoad: function(options) {
    let that = this;
    that.id = options.id;
    that.readFlag = options.readFlag == "true" ? true : false;
    that.refId = options.refId;
    if (!that.readFlag) {
      that.ajax(that.url.updateUnreadMessage, "POST", { "id": that.refId }, function(resp) {
        console.log("\u6D88\u606F\u66F4\u65B0\u6210\u5DF2\u8BFB\u72B6\u6001");
      });
    }
  },
  methods: {
    deleteMsg: function() {
      let that = this;
      common_vendor.index.showModal({
        title: "\u63D0\u793A\u4FE1\u606F",
        content: "\u662F\u5426\u8981\u5220\u9664\u8FD9\u6761\u6D88\u606F\uFF1F",
        success: function(resp) {
          if (resp.confirm) {
            that.ajax(that.url.deleteMessageRefById, "POST", { "id": that.refId }, function(resp2) {
              common_vendor.index.showToast({
                icon: "success",
                title: "\u5220\u9664\u6210\u529F",
                complete: function() {
                  setTimeout(function() {
                    common_vendor.index.navigateBack({
                      delta: 1
                    });
                  }, 1e3);
                }
              });
            });
          }
        }
      });
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: common_vendor.t($data.sendTime),
    b: common_vendor.o(($event) => $options.deleteMsg()),
    c: common_vendor.t($data.msg)
  };
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/message/message.vue"]]);
wx.createPage(MiniProgramPage);
