module.exports = (robot) ->
  robot.respond /do something crazy/i, (msg) ->
    if robot.auth.hasRole(msg.envelope.user, 'demo')
      msg.send "Ok, just because you're special..."
      msg.emote "turns into a cloud of majestic monarch butterflies!"
    else
      msg.send "Don't tell me what to do!"
