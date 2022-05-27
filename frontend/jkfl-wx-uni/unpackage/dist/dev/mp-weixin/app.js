"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports[Symbol.toStringTag] = "Module";
var common_vendor = require("./common/vendor.js");
if (!Math) {
  "./pages/login/login.js";
  "./pages/contacts/contacts.js";
  "./pages/upload_video_file/upload_video_file.js";
  "./pages/detail-video/detail-video.js";
  "./pages/index/index.js";
  "./pages/message_list/message_list.js";
  "./pages/message/message.js";
  "./pages/checkin_result/checkin_result.js";
  "./pages/my_checkin/my_checkin.js";
  "./pages/checkin/checkin.js";
  "./pages/meeting_list/meeting_list.js";
  "./pages/meeting/meeting.js";
  "./pages/members/members.js";
  "./pages/document/document.js";
  "./pages/mine/mine.js";
  "./pages/register/register.js";
}
const _sfc_main = {
  onLaunch: function() {
    console.log("App Launch");
  },
  onShow: function() {
    console.log("App Show");
  },
  onHide: function() {
    console.log("App Hide");
  }
};
var App = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/App.vue"]]);
Date.prototype.format = function(fmt) {
  var o = {
    "M+": this.getMonth() + 1,
    "d+": this.getDate(),
    "h+": this.getHours(),
    "m+": this.getMinutes(),
    "s+": this.getSeconds(),
    "q+": Math.floor((this.getMonth() + 3) / 3),
    "S": this.getMilliseconds()
  };
  if (/(y+)/.test(fmt)) {
    fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  }
  for (var k in o) {
    if (new RegExp("(" + k + ")").test(fmt)) {
      fmt = fmt.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
    }
  }
  return fmt;
};
function createApp() {
  const app = common_vendor.createSSRApp(App);
  let baseUrl = "http://localhost:8099/wx-server";
  let videoUrl = "http://localhost:8055";
  app.config.globalProperties.url = {
    register: baseUrl + "/user/register",
    login: baseUrl + "/user/login",
    searchMeetingListByPage: baseUrl + "/meeting/searchMeetingListByPage",
    searchUserGroupByDept: baseUrl + "/user/searchUserGroupByDept",
    searchMembers: baseUrl + "/user/searchMembers",
    checkin: baseUrl + "/checkin/checkin",
    createFaceModel: baseUrl + "/checkin/createFaceModel",
    validCanCheckin: baseUrl + "/checkin/validCanCkeckIn",
    searchTodayCheckin: baseUrl + "/checkin/searchTodayCheckin",
    searchUserSummary: baseUrl + "/user/searchUserSummary",
    searchMonthCheckin: baseUrl + "/checkin/searchMonthCheckin",
    refreshMessage: baseUrl + "/message/refreshMessage",
    searchMessageByPage: baseUrl + "/message/searchMessageByPage",
    searchMessageById: baseUrl + "/message/searchMessageById",
    updateUnreadMessage: baseUrl + "/message/updateUnreadMessage",
    deleteMessageRefById: baseUrl + "/message/deleteMessageRefById",
    getInfoList1: videoUrl + "/info/getInfoList1",
    getInfoList2: videoUrl + "/info/getInfoList2",
    getInfoList3: videoUrl + "/info/getInfoList3",
    findVideoById: videoUrl + "/video/findVideoById",
    recommoandList: videoUrl + "/video/recommoandList",
    findCollection: videoUrl + "/video/findCollection"
  };
  app.config.globalProperties.ajax = function(url, method, data, fun) {
    common_vendor.index.request({
      "url": url,
      "method": method,
      "header": {
        token: common_vendor.index.getStorageSync("token")
      },
      "data": data,
      success: function(resp) {
        if (resp.statusCode === 401) {
          common_vendor.index.redirectTo({
            url: "/pages/login/login.vue"
          });
        } else if (resp.statusCode === 200 && resp.data.code === 200) {
          let data2 = resp.data;
          if (data2.hasOwnProperty("token")) {
            let token = data2.token;
            console.log(token);
            common_vendor.index.setStorageSync("token", token);
          }
          fun(resp);
        } else if (resp.data.code === 2e3) {
          fun(resp);
        } else {
          common_vendor.index.showToast({
            icon: "none",
            title: "\u8BF7\u6C42\u9519\u8BEF"
          });
        }
      }
    });
  };
  app.config.globalProperties.checkPermission = function(perms) {
    let permission = common_vendor.index.getStorageSync("permission");
    let result = false;
    if (permission.indexOf("ROOT") != -1) {
      result = true;
      console.log("Root\u6743\u9650 \u76F4\u63A5\u7ED3\u675F\u4E86");
    } else {
      console.log("\u4E0D\u662FRoot\uFF0C\u5F00\u59CB\u9274\u6743");
      for (let one of perms) {
        if (permission.indexOf(one) != -1) {
          result = true;
          break;
        }
      }
    }
    console.log("\u7EAA\u5F8B\u6027\u6D4B\u8BD5");
    return result;
  };
  return {
    app
  };
}
createApp().app.mount("#app");
exports.createApp = createApp;
