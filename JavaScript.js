
var digitalRoot = function(arg) {
  if (arg < 10) {
    return arg;
  }
  return digitalRoot((arg % 10) + Math.floor(arg / 10));
};

// Cracking Code Interview 1.1

var myUniq = function(str) {
  var myObj = {};
  for (var i = 0; i < str.length; i ++) {
    if (myObj[str[i]] === true) {
      return false;
    }
    myObj[str[i]] = true;
  }
  return true;
};
