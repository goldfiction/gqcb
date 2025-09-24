l=require("gqcolorlog").logging

@gqcb={}

@gqcb.cb=(e,r)->
  if e
    l.error e
    l.filterederror e
  r