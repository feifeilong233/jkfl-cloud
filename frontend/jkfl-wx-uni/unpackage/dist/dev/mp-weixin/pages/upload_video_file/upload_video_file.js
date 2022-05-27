"use strict";
var common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  data() {
    return {
      videoUrl: "",
      poster: "",
      title: "",
      clickFlag: true
    };
  },
  methods: {
    chooseVideo: function() {
      console.log("chooseVideo");
      let that = this;
      that.clickFlag = false;
      wx.chooseVideo({
        sourceType: ["album", "camera"],
        camera: "back",
        compressed: true,
        success: function(res) {
          console.log(res);
          let tempFilePath = res.tempFilePath;
          let duration = res.duration;
          let size = parseFloat(res.size / 1024 / 1024).toFixed(1);
          that.duration = duration;
          if (parseFloat(size) > 100) {
            that.clickFlag = true;
            that.duration = "";
            let beyondSize = parseFloat(size) - 100;
            wx.showToast({
              title: "\u4E0A\u4F20\u7684\u89C6\u9891\u5927\u5C0F\u8D85\u9650\uFF0C\u8D85\u51FA" + beyondSize + "MB,\u8BF7\u91CD\u65B0\u4E0A\u4F20",
              icon: "none"
            });
          } else {
            that.uploadFile(tempFilePath);
          }
        },
        fail: function() {
        },
        complete: function() {
        }
      });
    },
    uploadFile: function(tempFilePath) {
      let that = this;
      let third_session = wx.getStorageSync("third_session");
      wx.showLoading({
        title: "\u4E0A\u4F20\u8FDB\u5EA6\uFF1A0%",
        mask: true
      });
      const uploadTask = wx.uploadFile({
        url: "http://localhost:8055/upload/uploadVideo?title=" + that.title,
        filePath: tempFilePath,
        name: "file",
        formData: {
          third_session
        },
        success: function(res) {
          console.log("uploadFile", res);
          JSON.parse(res.data);
          wx.hideLoading();
          if (res.statusCode == 200) {
            that.videoUrl = that.videoUrl;
            that.poster = that.imgUrl;
            that.duration = that.duration;
            that.clickFlag = true;
            wx.showToast({
              title: "\u4E0A\u4F20\u6210\u529F",
              icon: "success"
            });
          } else {
            that.videoUrl = "";
            that.poster = "";
            that.duration = "";
            that.clickFlag = true;
            wx.showToast({
              title: "\u4E0A\u4F20\u5931\u8D25",
              icon: "none"
            });
          }
        },
        fail: function() {
          wx.hideLoading();
          that.videoUrl = "";
          that.poster = "";
          that.duration = "";
          that.clickFlag = true;
          wx.showToast({
            title: "\u4E0A\u4F20\u5931\u8D25",
            icon: "none"
          });
        }
      });
      uploadTask.onProgressUpdate((res) => {
        wx.showLoading({
          title: "\u4E0A\u4F20\u8FDB\u5EA6\uFF1A" + res.progress + "%",
          mask: true
        });
        console.log("\u4E0A\u4F20\u8FDB\u5EA6", res.progress);
        console.log("\u5DF2\u7ECF\u4E0A\u4F20\u7684\u6570\u636E\u957F\u5EA6\uFF0C\u5355\u4F4D Bytes:", res.totalBytesSent);
        console.log("\u9884\u671F\u9700\u8981\u4E0A\u4F20\u7684\u6570\u636E\u603B\u957F\u5EA6\uFF0C\u5355\u4F4D Bytes:", res.totalBytesExpectedToSend);
      });
    },
    saveVideo() {
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: $data.clickFlag
  }, $data.clickFlag ? common_vendor.e({
    b: $data.poster
  }, $data.poster ? {
    c: $data.poster,
    d: common_vendor.o((...args) => $options.chooseVideo && $options.chooseVideo(...args))
  } : {
    e: common_vendor.o(($event) => $options.chooseVideo())
  }) : common_vendor.e({
    f: $data.poster
  }, $data.poster ? {
    g: $data.poster
  } : {}), {
    h: $data.title,
    i: common_vendor.o(($event) => $data.title = $event.detail.value),
    j: $data.clickFlag
  }, $data.clickFlag ? {
    k: common_vendor.o((...args) => $options.chooseVideo && $options.chooseVideo(...args))
  } : {}, {
    l: common_vendor.o((...args) => $options.saveVideo && $options.saveVideo(...args)),
    m: $data.videoUrl
  }, $data.videoUrl ? {
    n: $data.videoUrl
  } : {});
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/upload_video_file/upload_video_file.vue"]]);
wx.createPage(MiniProgramPage);
