"use strict";
var common_vendor = require("../../common/vendor.js");
const uniList = () => "../../components/uni-list/uni-list.js";
const uniListChat = () => "../../components/uni-list-chat/uni-list-chat.js";
const _sfc_main = {
  components: {
    uniList,
    uniListChat
  },
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
    common_vendor.index.pageScrollTo({
      scrollTop: "0"
    });
    that.loadMessageList(that);
  },
  onReachBottom: function() {
    let that = this;
    if (that.isLastPage) {
      return;
    }
    that.page = that.page + 1;
    that.loadMessageList(that);
  },
  methods: {
    loadMessageList: function(ref) {
      let data = {
        page: ref.page,
        length: ref.length
      };
      ref.ajax(ref.url.searchMessageByPage, "POST", data, function(resp) {
        let result = resp.data.result;
        if (result == null || result.length == 0) {
          ref.isLastPage = true;
          ref.page = ref.page - 1;
          common_vendor.index.showToast({
            icon: "none",
            title: "\u5DF2\u7ECF\u5230\u5E95\u4E86"
          });
        } else {
          if (ref.page == 1) {
            ref.list = [];
          }
          ref.list = ref.list.concat(result);
          if (ref.page > 1) {
            common_vendor.index.showToast({
              icon: "none",
              title: "\u53C8\u52A0\u8F7D\u4E86" + result.length + "\u6761\u6D88\u606F"
            });
          }
        }
      });
    }
  }
};
if (!Array) {
  const _easycom_uni_list_chat2 = common_vendor.resolveComponent("uni-list-chat");
  const _easycom_uni_list2 = common_vendor.resolveComponent("uni-list");
  (_easycom_uni_list_chat2 + _easycom_uni_list2)();
}
const _easycom_uni_list_chat = () => "../../components/uni-list-chat/uni-list-chat.js";
const _easycom_uni_list = () => "../../components/uni-list/uni-list.js";
if (!Math) {
  (_easycom_uni_list_chat + _easycom_uni_list)();
}
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return {
    a: common_vendor.f($data.list, (one, k0, i0) => {
      return {
        a: common_vendor.t(one.sendTime),
        b: one.id,
        c: "0a199402-1-" + i0 + ",0a199402-0",
        d: common_vendor.p({
          title: one.senderName,
          note: one.msg,
          avatar: one.senderPhoto,
          badgePositon: "left",
          badgeText: one.readFlag ? "" : "dot",
          link: "navigateTo",
          to: "../message/message?id=" + one.id + "&readFlag=" + one.readFlag + "&refId=" + one.refId
        })
      };
    })
  };
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/message_list/message_list.vue"]]);
wx.createPage(MiniProgramPage);
