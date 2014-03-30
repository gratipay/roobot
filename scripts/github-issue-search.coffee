# Description:
#   Search GitHub issues within a repo.
#
# Commands:
#   hubot search issues [ [<user>/]<repo>] ] "<query>" - Search repo issues
#
# Configuration:
#   HUBOT_GITHUB_USER
#   HUBOT_GITHUB_REPO
#   HUBOT_GITHUB_TOKEN

module.exports = (robot) ->
  robot.respond /search issues( (.+))? "(.+)"$/i, (msg) ->
    github = require('githubot')(robot)
    repo = github.qualified_repo msg.match[2]
    query = msg.match[3]

    query_full = "repo:#{repo} #{query}"
    query_encoded =  encodeURIComponent(query_full).replace(/%20/g, "+")

    github.get "/search/issues?q=#{query_encoded}", (response) ->
      count = response.total_count
      issues = response.items[0..4]
      msg.send "Top 5 of #{count} matches in #{repo}:"
      for issue in issues
        msg.send "Issue #{issue.number}: #{issue.title} #{issue.html_url}"
