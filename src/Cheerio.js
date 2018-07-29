const cheerio = require('cheerio')

// Attributes
exports.attrImpl = function(nothing, just, name, cheerioInst) {
  return cheerioInst.length ? just(cheerioInst.attr(name)) : nothing;
}

exports.hasClassImpl = function(className, cheerioInst) {
  return cheerioInst.hasClass(className);
}

// Traversing
exports.findImpl = function(selector, cheerioInst) {
  return cheerioInst.find(selector);
}

exports.parent = function(cheerioInst) {
  return cheerioInst.parent()
}

exports.next = function(cheerioInst) {
  return cheerioInst.next()
}

exports.prev = function(cheerioInst) {
  return cheerioInst.prev()
}

exports.siblings = function(cheerioInst) {
  return cheerioInst.siblings()
}

exports.children = function(cheerioInst) {
  return cheerioInst.children()
}

exports.first = function(cheerioInst) {
  return cheerioInst.first()
}

exports.last = function(cheerioInst) {
  return cheerioInst.last()
}

exports.eqImpl = function(index, cheerioInst) {
  return cheerioInst.eq(index)
}

// Rendering
exports.htmlImpl = function(nothing, just, cheerioInst) {
  return cheerioInst.length ? just(cheerioInst.html()) : nothing;
}

exports.text = function(cheerioInst) {
  return cheerioInst.text()
}

// Miscellaneous
exports.length = function(cheerioInst) {
  return cheerioInst.length;
}
