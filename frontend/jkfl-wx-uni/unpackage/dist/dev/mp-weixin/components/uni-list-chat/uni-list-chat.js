"use strict";
var common_vendor = require("../../common/vendor.js");
const avatarWidth = 45;
const _sfc_main = {
  name: "UniListChat",
  props: {
    title: {
      type: String,
      default: ""
    },
    note: {
      type: String,
      default: ""
    },
    clickable: {
      type: Boolean,
      default: false
    },
    link: {
      type: [Boolean, String],
      default: false
    },
    to: {
      type: String,
      default: ""
    },
    badgeText: {
      type: [String, Number],
      default: ""
    },
    badgePositon: {
      type: String,
      default: "right"
    },
    time: {
      type: String,
      default: ""
    },
    avatarCircle: {
      type: Boolean,
      default: false
    },
    avatar: {
      type: String,
      default: ""
    },
    avatarList: {
      type: Array,
      default() {
        return [];
      }
    }
  },
  inject: ["list"],
  computed: {
    isSingle() {
      if (this.badgeText === "dot") {
        return "uni-badge--dot";
      } else {
        const badgeText = this.badgeText.toString();
        if (badgeText.length > 1) {
          return "uni-badge--complex";
        } else {
          return "uni-badge--single";
        }
      }
    },
    computedAvatar() {
      if (this.avatarList.length > 4) {
        this.imageWidth = avatarWidth * 0.31;
        return "avatarItem--3";
      } else if (this.avatarList.length > 1) {
        this.imageWidth = avatarWidth * 0.47;
        return "avatarItem--2";
      } else {
        this.imageWidth = avatarWidth;
        return "avatarItem--1";
      }
    }
  },
  data() {
    return {
      isFirstChild: false,
      border: true,
      imageWidth: 50
    };
  },
  mounted() {
    if (!this.list.firstChildAppend) {
      this.list.firstChildAppend = true;
      this.isFirstChild = true;
    }
    this.border = this.list.border;
  },
  methods: {
    onClick() {
      if (this.to !== "") {
        this.openPage();
        return;
      }
      if (this.clickable || this.link) {
        this.$emit("click", {
          data: {}
        });
      }
    },
    openPage() {
      if (["navigateTo", "redirectTo", "reLaunch", "switchTab"].indexOf(this.link) !== -1) {
        this.pageApi(this.link);
      } else {
        this.pageApi("navigateTo");
      }
    },
    pageApi(api) {
      common_vendor.index[api]({
        url: this.to,
        success: (res) => {
          this.$emit("click", {
            data: res
          });
        },
        fail: (err) => {
          this.$emit("click", {
            data: err
          });
          console.error(err.errMsg);
        }
      });
    }
  }
};
function _sfc_render(_ctx, _cache, $props, $setup, $data, $options) {
  return common_vendor.e({
    a: $data.border ? 1 : "",
    b: $data.isFirstChild ? 1 : "",
    c: $props.avatarCircle || $props.avatarList.length === 0
  }, $props.avatarCircle || $props.avatarList.length === 0 ? {
    d: $props.avatar,
    e: $props.avatarCircle ? 1 : ""
  } : {
    f: common_vendor.f($props.avatarList, (item, index, i0) => {
      return {
        a: item.url,
        b: index
      };
    }),
    g: $data.imageWidth + "px",
    h: $data.imageWidth + "px",
    i: common_vendor.n($options.computedAvatar),
    j: $data.imageWidth + "px",
    k: $data.imageWidth + "px"
  }, {
    l: $props.badgeText && $props.badgePositon === "left"
  }, $props.badgeText && $props.badgePositon === "left" ? {
    m: common_vendor.t($props.badgeText === "dot" ? "" : $props.badgeText),
    n: common_vendor.n($options.isSingle)
  } : {}, {
    o: common_vendor.t($props.title),
    p: common_vendor.t($props.note),
    q: common_vendor.t($props.time),
    r: $props.badgeText && $props.badgePositon === "right"
  }, $props.badgeText && $props.badgePositon === "right" ? {
    s: common_vendor.t($props.badgeText === "dot" ? "" : $props.badgeText),
    t: common_vendor.n($options.isSingle),
    v: common_vendor.n($props.badgePositon === "right" ? "uni-list-chat--right" : "")
  } : {}, {
    w: !$props.clickable && !$props.link ? "" : "uni-list-chat--hover",
    x: common_vendor.o((...args) => $options.onClick && $options.onClick(...args))
  });
}
var Component = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["render", _sfc_render], ["__scopeId", "data-v-62e4955a"], ["__file", "F:/Projection/jkfl-cloud/frontend/jkfl-wx-uni/components/uni-list-chat/uni-list-chat.vue"]]);
wx.createComponent(Component);
