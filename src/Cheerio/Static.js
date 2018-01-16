const cheerio = require('cheerio')

// Loading
exports.load = cheerio.load

// Selecting
exports.selectImpl = function(str, cheerioStatic) {
  return cheerioStatic(str)
}

exports.selectDeepImpl = function(strArr, cheerioStatic) {
  return cheerioStatic.apply(cheerioStatic, strArr)
}

// Rendering
exports.htmlImpl = function(nothing, just, cheerioInst) {
  const ret = cheerio.html(cheerioInst)
  return ret != null ? just(ret) : nothing
}

// Utilities
exports.root = function(cheerioStatic) {
  return cheerio.root.call(cheerioStatic)
}