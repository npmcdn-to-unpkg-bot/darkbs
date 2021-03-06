require! tape
{render, assert-class, class-name, element} = require \./utils

tape 'Class name' (t) ->
  name = \test
  t.equal do
    class-name \test
    name
    'should return the string unchanged'
  t.notOk class-name!, 'should return a falsely value'

  options =
    text: <[nowrap lowercase]>
    hidden:
      down: \sm
      up: \lg
    active: true

  result = class-name options
  $ = render element, className: [name, [options]]
  t.ok ($ ".#name" .length), "should have #name in the element"

  <[text-nowrap text-lowercase hidden-sm-down hidden-lg-up active]>
  .forEach ->
    t.ok (0 <= result.search it), "should conain #it"
    t.ok ($ ".#it" .length), "should have #it in the element"

  t.end!
