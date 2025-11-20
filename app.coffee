l=require("gqcolorlog").logging
Q = require 'q'

@gqcb={}

isPromise=(value)->
  return (
    value != null &&
    typeof value == 'object' &&
    typeof value.then == 'function'
  )

tryCb=(e,r,next)->
  if e
    l.error e
    l.filterederror e
  if next
    next e,r
  r

tryResolv=(e,r,def)->
  deferred = def || Q.defer()
  if e
    deferred.reject(e)
  else
    deferred.resolve(r)
  deferred.promise

@gqcb.tryCb=tryCb
@gqcb.tryResolv=tryResolv

@gqcb.cb=(e,r,next,def)->
  if isPromise(@this)
    tryResolv(e,r,def)
  else
    tryCb(e,r,next)