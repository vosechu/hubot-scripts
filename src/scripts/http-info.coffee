# Description:
#   Returns title and description when links are posted
#
# Dependencies:
#   "jsdom": "0.2.15"
#
# Configuration:
#   None
#
# Commands:
#   http(s)://<site> - prints the title and meta description for sites linked.
#
# Authors:
#   ajacksified

jsdom = require('jsdom')

module.exports = (robot) ->

  robot.hear /http(s?):\/\/(.*)/i, (msg) ->
      jsdom.env(
        html: msg.match[0]
        scripts: [
          'http://code.jquery.com/jquery-1.7.2.min.js'
        ]
        done: (errors, window) ->
          unless errors
            $ = window.$
            msg.send "#{$('title').text()}\n#{$('meta[name=description]').attr("content")}"
      )
