"use strict";
var common_vendor = require("../../common/vendor.js");
const uniPopup = () => "../../components/uni-popup/uni-popup.js";
const uniPopupMessage = () => "../../components/uni-popup/uni-popup-message.js";
const uniPopupDialog = () => "../../components/uni-popup/uni-popup-dialog.js";
const _sfc_main = {
  components: {
    uniPopup,
    uniPopupMessage,
    uniPopupDialog
  },
  data() {
    return {
      opt: null,
      id: null,
      uuid: null,
      canEdit: true,
      title: "",
      date: "",
      start: "",
      end: "",
      typeArray: ["\u7EBF\u4E0A\u4F1A\u8BAE", "\u7EBF\u4E0B\u4F1A\u8BAE"],
      typeIndex: 0,
      place: "",
      desc: "\u4F1A\u8BAE\u5185\u5BB9",
      members: [],
      instanceId: null
    };
  },
  onLoad: function(options) {
    this.id = options.id;
    this.opt = options.opt;
  },
  onShow: function() {
    let that = this;
    let pages = getCurrentPages();
    let currPage = pages[pages.length - 1];
    if (!currPage.hasOwnProperty("finishMembers") || !currPage.finishMembers) {
      if (that.opt === "insert") {
        let now = new Date();
        now.setTime(now.getTime() + 30 * 60 * 1e3);
        that.date = now.format("yyyy-MM-dd");
        that.start = now.format("hh:mm");
        now.setTime(now.getTime() + 60 * 60 * 1e3);
        that.end = now.format("hh:mm");
      }
    } else {
      let members = [];
      for (let item of page.members) {
        members.push(Number(item));
      }
      that.ajax(that.url.searchMembers, "POST", { members: JSON.stringify(members) }, function(resp) {
        let result = resp.data.result;
        that.members = result;
      });
    }
  },
  methods: {
    toMembersPage: function() {
      let array = [];
      for (let item of this.members) {
        array.push(item.id);
      }
      common_vendor.index.navigateTo({
        url: "../members/members?members=" + array.join(",")
      });
    },
    dateChange: function(e) {
      this.date = e.detail.value;
    },
    startChange: function(e) {
      this.start = e.detail.value;
    },
    endChange: function(e) {
      this.end = e.detail.value;
    },
    typeChange: function(e) {
      this.typeIndex = e.detail.value;
    },
    editPlace: function() {
      if (!this.canEdit) {
        return;
      }
      this.$refs.popupPlace.open();
    },
    finishPlace: function(done, value) {
      if (value !== null && value !== "") {
        this.place = value;
        done();
      } else {
        common_vendor.index.showToast({
          icon: "none",
          title: "\u5730\u70B9\u4E0D\u80FD\u4E3A\u7A7A"
        });
      }
    },
    editDesc: function() {
      if (!this.canEdit) {
        return;
      }
      this.$refs.popupDesc.open();
    },
    finishDesc: function(done, value) {
      if (value != null && value != "") {
        this.desc = value;
        done();
      } else {
        common_vendor.index.showToast({
          icon: "none",
          title: "\u5185\u5BB9\u4E0D\u80FD\u4E3A\u7A7A"
        });
      }
    }
  }
};
if (!Array) {
  const _component_uni_popup_dialog = common_vendor.resolveComponent("uni-popup-dialog");
  const _easycom_uni_popup2 = common_vendor.resolveComponent("uni-popup");
  (_component_uni_popup_dialog + _easycom_uni_popup2)();
}
const _easycom_uni_popup = () => "../../components/uni-popup/uni-popup.js";
if (!Math) {
  _easycom_uni_popup();
}
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: _ctx.checkPermission(["ROOT", "MEETING:INSERT", "MEERING:UPDATE"])
  }, _ctx.checkPermission(["ROOT", "MEETING:INSERT", "MEERING:UPDATE"]) ? common_vendor.e({
    b: $data.title,
    c: common_vendor.o(($event) => $data.title = $event.detail.value),
    d: $data.canEdit
  }, $data.canEdit ? {
    e: common_vendor.t($data.date),
    f: $data.date,
    g: common_vendor.o((...args) => $options.dateChange && $options.dateChange(...args))
  } : {}, {
    h: !$data.canEdit
  }, !$data.canEdit ? {
    i: common_vendor.t($data.date)
  } : {}, {
    j: $data.canEdit
  }, $data.canEdit ? {
    k: common_vendor.t($data.start),
    l: $data.start,
    m: common_vendor.o((...args) => $options.startChange && $options.startChange(...args))
  } : {}, {
    n: !$data.canEdit
  }, !$data.canEdit ? {
    o: common_vendor.t($data.start)
  } : {}, {
    p: $data.canEdit
  }, $data.canEdit ? {
    q: common_vendor.t($data.end),
    r: $data.end,
    s: common_vendor.o((...args) => $options.endChange && $options.endChange(...args))
  } : {}, {
    t: !$data.canEdit
  }, !$data.canEdit ? {
    v: common_vendor.t($data.end)
  } : {}, {
    w: $data.canEdit
  }, $data.canEdit ? {
    x: common_vendor.t($data.typeArray[$data.typeIndex]),
    y: $data.typeArray,
    z: $data.typeIndex,
    A: common_vendor.o((...args) => $options.typeChange && $options.typeChange(...args))
  } : {}, {
    B: !$data.canEdit
  }, !$data.canEdit ? {
    C: common_vendor.t($data.typeArray[$data.typeIndex])
  } : {}, {
    D: $data.typeArray[$data.typeIndex] === "\u7EBF\u4E0B\u4F1A\u8BAE"
  }, $data.typeArray[$data.typeIndex] === "\u7EBF\u4E0B\u4F1A\u8BAE" ? {
    E: common_vendor.t($data.place),
    F: common_vendor.o(($event) => $options.editPlace())
  } : {}, {
    G: common_vendor.t($data.desc),
    H: common_vendor.o(($event) => $options.editDesc()),
    I: common_vendor.t($data.members.length),
    J: common_vendor.f($data.members, (item, k0, i0) => {
      return {
        a: item.photo,
        b: common_vendor.t(item.name),
        c: item.id
      };
    }),
    K: common_vendor.o(($event) => $options.toMembersPage()),
    L: common_vendor.o($options.finishPlace),
    M: common_vendor.p({
      mode: "input",
      title: "\u7F16\u8F91\u6587\u5B57\u5185\u5BB9",
      placeholder: "\u8F93\u5165\u4F1A\u8BAE\u5730\u70B9",
      value: $data.place
    }),
    N: common_vendor.sr("popupPlace", "0aa478f7-0"),
    O: common_vendor.p({
      type: "dialog"
    }),
    P: common_vendor.o($options.finishDesc),
    Q: common_vendor.p({
      mode: "input",
      title: "\u7F16\u8F91\u6587\u5B57\u5185\u5BB9",
      placeholder: "\u8F93\u5165\u4F1A\u8BAE\u5185\u5BB9",
      value: $data.desc
    }),
    R: common_vendor.sr("popupDesc", "0aa478f7-2"),
    S: common_vendor.p({
      type: "dialog"
    })
  }) : {});
}
var MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/pages/meeting/meeting.vue"]]);
wx.createPage(MiniProgramPage);
