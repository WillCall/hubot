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

  robot.hear /event (.{24})/i, (msg) ->
    msg.http("https://api.getwillcall.com/api/events/#{ msg.match[1]}")
      .get() (err, res, body) ->
        msg.send "#{JSON.parse(body).name}",
                 "#{JSON.parse(body).time_to_start} at #{JSON.parse(body).venue_name}",
                 "#{JSON.parse(body).images.thumbnail}"