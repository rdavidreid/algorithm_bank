
var digitalRoot = function(arg) {
  if (arg < 10) {
    return arg;
  }
  return digitalRoot((arg % 10) + Math.floor(arg / 10));
};
