"use strict";
var common_vendor = require("../../common/vendor.js");
let QQMapWX = require("../../static/js/qqmap-wx-jssdk.min.js");
let qqmapsdk;
const _sfc_main = {
  data() {
    return {
      canCheckin: true,
      photoPath: "",
      btnText: "\u62CD\u7167",
      showCamera: true,
      showImage: false
    };
  },
  onLoad: function() {
    qqmapsdk = new QQMapWX({
      key: "TK5BZ-DBUC6-OAOS4-ELRVY-M3PIZ-DJFWX"
    });
  },
  onShow: function() {
    let that = this;
    that.ajax(that.url.validCanCheckIn, "GET", null, function(resp) {
      let msg = resp.data.msg;
      if (msg != "\u53EF\u4EE5\u8003\u52E4") {
        that.canCheckin = false;
        setTimeout(function() {
          common_vendor.index.showToast({
            title: msg,
            icon: "none"
          });
        }, 1e3);
      }
    });
  },
  methods: {
    clickBtn: function() {
      let that = this;
      if (that.btnText == "\u62CD\u7167") {
        let ctx = common_vendor.index.createCameraContext();
        ctx.takePhoto({
          quality: "high",
          success: function(resp) {
            console.log(resp.tempImagePath);
            that.photoPath = resp.tempImagePath;
            that.showCamera = false;
            that.showImage = true;
            that.btnText = "\u7B7E\u5230";
          }
        });
      } else {
        common_vendor.index.showLoading({
          title: "\u7B7E\u5230\u4E2D\u8BF7\u7A0D\u540E"
        });
        setTimeout(function() {
          common_vendor.index.hideLoading();
        }, 3e4);
        common_vendor.index.getLocation({
          type: "wgs84",
          success: function(resp) {
            let latitude = resp.latitude;
            let longitude = resp.longitude;
            qqmapsdk.reverseGeocoder({
              location: {
                latitude,
                longitude
              },
              success: function(resp2) {
                console.log("map", resp2.result);
                let address = resp2.result.address;
                let addressComponent = resp2.result.address_component;
                let nation = addressComponent.nation;
                let province = addressComponent.province;
                let city = addressComponent.city;
                let district = addressComponent.district;
                common_vendor.index.uploadFile({
                  url: that.url.checkin,
                  filePath: that.photoPath,
                  name: "photo",
                  header: {
                    token: common_vendor.index.getStorageSync("token")
                  },
                  formData: {
                    address,
                    country: nation,
                    province,
                    city,
                    district
                  },
                  success: function(resp3) {
                    console.log("face model");
                    if (resp3.statusCode == 500 && resp3.data == "\u4E0D\u5B58\u5728\u4EBA\u8138\u6A21\u578B") {
                      common_vendor.index.hideLoading();
                      common_vendor.index.showModal({
                        title: "\u63D0\u793A\u4FE1\u606F",
                        content: "EMOS\u7CFB\u7EDF\u4E2D\u4E0D\u5B58\u5728\u4F60\u7684\u4EBA\u8138\u8BC6\u522B\u6A21\u578B\uFF0C\u662F\u5426\u7528\u5F53\u524D\u8FD9\u5F20\u7167\u7247\u4F5C\u4E3A\u4EBA\u8138\u8BC6\u522B\u6A21\u578B\uFF1F",
                        success: function(res) {
                          if (res.confirm) {
                            common_vendor.index.uploadFile({
                              url: that.url.createFaceModel,
                              filePath: that.photoPath,
                              name: "photo",
                              header: {
                                token: common_vendor.index.getStorageSync("token")
                              },
                              success: function(resp4) {
                                if (resp4.statusCode == 500) {
                                  common_vendor.index.showToast({
                                    title: resp4.data,
                                    icon: "none"
                                  });
                                } else if (resp4.statusCode == 200) {
                                  common_vendor.index.showToast({
                                    title: "\u4EBA\u8138\u5EFA\u6A21\u6210\u529F",
                                    icon: "none"
                                  });
                                }
                              }
                            });
                          }
                        }
                      });
                    } else if (resp3.statusCode == 200) {
                      let data = JSON.parse(resp3.data);
                      let code = data.code;
                      data.msg;
                      if (code == 200) {
                        common_vendor.index.hideLoading();
                        common_vendor.index.showToast({
                          title: "\u7B7E\u5230\u6210\u529F",
                          complete: function() {
                            common_vendor.index.navigateTo({
                              url: "../checkin_result/checkin_result"
                            });
                          }
                        });
                      }
                    } else if (resp3.statusCode == 500) {
                      common_vendor.index.showToast({
                        title: resp3.data,
                        icon: "none"
                      });
                    }
                  }
                });
              }
            });
          }
        });
      }
    },
    afresh: function() {
      let that = this;
      that.showCamera = true;
      that.showImage = false;
      that.btnText = "\u62CD\u7167";
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: $data.showCamera
  }, $data.showCamera ? {
    b: common_vendor.o((...args) => _ctx.error && _ctx.error(...args))
  } : {}, {
    c: $data.showImage
  }, $data.showImage ? {
    d: $data.photoPath
  } : {}, {
    e: common_vendor.t($data.btnText),
    f: common_vendor.o(($event) => $options.clickBtn()),
    g: !$data.canCheckin,
    h: common_vendor.o(($event) => $options.afresh()),
    i: !$data.canCheckin
  });
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/checkin/checkin.vue"]]);
wx.createPage(MiniProgramPage);
