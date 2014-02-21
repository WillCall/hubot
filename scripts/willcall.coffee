# Description:
#   WillCall speicfic hubot actions
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot (WillCall) event <ID> - Get info on an event

module.exports = (robot) ->

  robot.respond /WillCall event (.*)/i, (msg) ->
    msg.http("https://api.getwillcall.com/api/events/#{ msg.match[1]}")
      .get() (err, res, body) ->
        msg.send "#{JSON.parse(body).name}"
        msg.send "#{JSON.parse(body).time_to_start} at #{JSON.parse(body).venue_name}"
        msg.send "#{JSON.parse(body).images.thumbnail}"
        
  robot.respond /event (.*)/i, (msg) ->
    msg.http("https://api.getwillcall.com/api/events/#{ msg.match[1]}")
      .get() (err, res, body) ->
        msg.send "#{JSON.parse(body).name}"
        msg.send "#{JSON.parse(body).time_to_start} at #{JSON.parse(body).venue_name}"
        msg.send "#{JSON.parse(body).images.thumbnail}"