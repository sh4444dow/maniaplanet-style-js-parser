{Parser} = require '../src/Parser'

chai = require 'chai'
expect = chai.expect

describe 'Parser', ->
  it 'should not modify text without codes', ->
    expect(Parser.toHTML('foo')).to.equal('foo')
  it 'should parse $otag', ->
    expect(Parser.toHTML('$otag')).to.equal('<span style="font-weight:bold;">tag</span>')
  it 'should ignore non color codes', ->
    expect(Parser.toHTML('$uhi there')).to.equal('hi there')
  it 'should parse $l with specified url', ->
    expect(Parser.toHTML('$l[http://maniaplanet.com]maniaplanet.com$l')).to.equal('<a href="http://maniaplanet.com">maniaplanet.com</a>')
  it 'should parse $l with no text', ->
    expect(Parser.toHTML('$lhttp://maniaplanet.com$l')).to.equal('<a href="http://maniaplanet.com">http://maniaplanet.com</a>')
  it 'should automatically adds a link end tag', ->
    expect(Parser.toHTML('$lhttp://maniaplanet.com')).to.equal('<a href="http://maniaplanet.com">http://maniaplanet.com</a>')