{Style} = require './Style.coffee'
{Color} = require './Color.coffee'

class Token
  constructor: (@style = 0, @text = '') ->

  toHTML: ->
    styleStack = []
    if @style
      if @style & Style.COLORED
        # Converting string to hex
        color = parseInt(Color.rgb12to24(@style & 0xfff), 10).toString(16)
        if (color.length == 1)
          color = '00000' + color
        else if (color.length == 2)
          color = '0000' + color
        else if (color.length == 4)
          color = '00' + color
        styleStack.push 'color: #' + color + ';'
        if (color == '000000')
          styleStack.push 'font-weight:bold;text-shadow: -1px 0 0 rgba(255, 255, 255, 0.4), 0 1px 0 rgba(255, 255, 255, 0.4), 1px 0 0 rgba(255, 255, 255, 0.4), 0 -1px 0 rgba(255, 255, 255, 0.4);'
      if @style & Style.ITALIC
        styleStack.push 'font-style:italic;'
      if @style & Style.BOLD
        styleStack.push 'font-weight:bold;'
      if @style & Style.SHADOWED
        styleStack.push 'text-shadow:1px 1px 1px rgba(0, 0, 0, 0.5);'
      if @style & Style.WIDE
        styleStack.push 'font-weight:800;font-size:105%;'
      else if @style & Style.NARROW
        styleStack.push 'font-weight:500;font-size:95%;'
      return '<span style="' + styleStack.join(' ') + '">' + @text + '</span>'
    else
      return @text

exports.Token = Token
