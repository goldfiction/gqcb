app=require('../app.coffee').gqcb
assert=require 'assert'
tests=require 'gqtest'
it=tests.it

# dummy test for code integrity
it "should be able to run",(done)->
  done()

it "should be able to callback success request",(done)->
  func=(o,cb)->
    cb(null,o)
  res=func("abc",app.cb)
  assert.equal(res,"abc")
  done()

it "should display error message for failed request",(done)->
  func=(o,cb)->
    try
      o.ddd()
      cb null,o
    catch e
      cb e,o
  res=func("abc",app.cb)
  assert.equal(res,"abc")
  done()

tests.doRun()