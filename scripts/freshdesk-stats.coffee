# Description:
#   List stats for Freshdesk support.
#
# Commands:
#   hubot freshdesk - Reply with support ticket stats.
#
# Configuration:
#   HUBOT_FRESHDESK_APIKEY
#   HUBOT_FRESHDESK_PROJECT

config =
  api_key: process.env.HUBOT_FRESHDESK_APIKEY
  project: process.env.HUBOT_FRESHDESK_PROJECT

endpoint = "#{config.project}.freshdesk.com"
uri = "helpdesk/tickets"
response_type = "json"

module.exports = (robot) ->
  robot.respond /freshdesk$/i, (msg) ->
    robot.http("https://#{config.api_key}:x@#{endpoint}/#{uri}.#{response_type}")
      .get() (err, res, body) ->
        open_count = 0
        overdue_count = 0

        issues = JSON.parse body
        for issue in issues
          open_count++ if issue.status_name.match /open/i

          current_date = Date.parse new Date()
          due_date = Date.parse issue.frDueBy
          overdue_count++ if due_date < current_date

        msg.send "Open support tickets: #{open_count} (#{overdue_count} with response due)"
