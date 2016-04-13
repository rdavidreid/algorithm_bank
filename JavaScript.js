
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

// Cracking Code Interview 1.3

var myPerm = function(str1,str2) {
  var myObj = {};
  var ans = true;
  for (var i = 0; i < str1.length; i ++) {
    if (myObj[i] === undefined) {
      myObj[i] = 1;
    }
    else {
      myObj[i] ++;
    }
  }

  for (var j = 0; j < str2.length; j ++) {
    if (myObj[j] === undefined) {
      myObj[j] = -1;
    }
    else {
      myObj[j] -= 1;
    }
  }
  Object.keys(myObj).forEach(function(key) {
    if (myObj[key] != "0") {
      ans =  false;
    }
  });
  return ans;
};

var myCompress = function(str) {
  var ans = "";
  var count = 1;
  var prev = str[0];
  for (var i = 0; i <= str.length; i ++) {
    if (i === 0 ) {
      continue;
    }
    else if  (prev === str[i]) {
      count += 1;
    }
    else {
      ans += count;
      ans += prev;
      count = 1;
    }
    prev = str[i];
  }
  if (ans.length < str.length) {
    return ans;
  }
  return str;
};
