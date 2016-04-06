def digitalRoot(arg)
  return arg if arg < 10
  return digitalRoot((arg % 10) + (arg / 10))
end
