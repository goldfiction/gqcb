var l;

l = require("gqcolorlog").logging;

this.gqcb = {};

this.gqcb.cb = function(e, r) {
  if (e) {
    l.error(e);
    l.filterederror(e);
  }
  return r;
};
