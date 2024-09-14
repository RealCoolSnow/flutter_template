function util_getUserAgent() {
  return window.navigator.userAgent;
}
function util_redirect(url) {
  window.location.href = url;
}
function util_isMobile() {
  if (1 == window.app_preview) {
    return true;
  }
  if (self.frameElement && self.frameElement.tagName == "IFRAME") {
    return true;
  }
  let userAgentInfo = navigator.userAgent;
  let Agents = [
    "Android",
    "iPhone",
    "SymbianOS",
    "Windows Phone",
    "iPad",
    "iPod",
  ];
  let getArr = Agents.filter((i) => userAgentInfo.includes(i));
  return getArr.length ? true : false;
}
function util_getLocationUrl() {
  return window.location.href;
}
function util_toHome() {
  // return (window.location.href = "https://m.valuex.top/index");
}
function util_copyText(str) {
  util_h5Copy(str);
  return true;
}
function util_selectText(textbox, startIndex, stopIndex) {
  if (textbox.createTextRange) {
    var range = textbox.createTextRange();
    range.collapse(true);
    range.moveStart("character", startIndex);
    range.moveEnd("character", stopIndex - startIndex);
    range.select();
  } else {
    textbox.setSelectionRange(startIndex, stopIndex);
    textbox.focus();
  }
}
const util_h5Copy = (str) => {
  var ua = util_getUserAgent().toLowerCase();
  var isIOS = false;
  if (ua.indexOf("iphone") > -1 || ua.indexOf("ipad") > -1) {
    isIOS = true;
  }
  if (isIOS) {
    var textString = str.toString();
    var input = document.querySelector("#copy-input");
    if (!input) {
      input = document.createElement("input");
      input.id = "copy-input";
      input.readOnly = true;
      input.style.position = "absolute";
      input.style.top = "-100px";
      input.style.left = "-1000px";
      input.style.zIndex = "-1000";
      document.body.appendChild(input);
    }
    input.value = textString;
    util_selectText(input, 0, textString.length);
    if (document.execCommand("copy")) {
      document.execCommand("copy");
      console.log("复制成功");
    } else {
      console.log("复制失败");
    }
    input.blur();
    document.body.removeChild(input);
  } else {
    var currentInput = document.createElement("input");
    currentInput.value = str;
    document.body.appendChild(currentInput);
    currentInput.select();
    document.execCommand("copy");
    document.body.removeChild(currentInput);
    if (document.execCommand("copy")) {
      console.log("复制成功");
    } else {
      console.log("复制失败");
    }
  }
};
function util_alert(content) {
  alert(content);
}
function util_inApp() {
  return typeof flutter_inappwebview != "undefined";
}

function util_isPreview() {
  if (1 == window.app_preview) {
    return true;
  }
  return false;
}