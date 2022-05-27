"use strict";
var components_uniPopup_message = require("./message.js");
const config = {
  top: "top",
  bottom: "bottom",
  center: "center",
  message: "top",
  dialog: "center",
  share: "bottom"
};
var popup = {
  data() {
    return {
      config
    };
  },
  mixins: [components_uniPopup_message.message]
};
exports.popup = popup;
