# Description:
#   A simple interaction with the built in HTTP Daemon
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# URLS:
#   /hubot/ping

spawn = require('child_process').spawn

module.exports = (robot) ->

  robot.router.get "/hubot/ping", (req, res) ->
    res.end "PONG"
