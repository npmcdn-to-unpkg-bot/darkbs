require! assert
{gen, button} = require \./darkbs

describe \Components ->
  describe \Buttons ->
    origin = (gen button) \button
    classes = origin.attr \class .split ' '
    specify 'Default color' ->
      <[btn btn-secondary]>forEach assert . classes~includes
    specify 'Default type attribute' ->
      assert.equal \button origin.attr \type