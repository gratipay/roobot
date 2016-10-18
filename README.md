# Roobot (deprecated)

This ~~is~~ was Gratipay's version of GitHub's Campfire bot, hubot. He's pretty cool. 

Roobot was powered off on 18th October 2016. https://github.com/gratipay/inside.gratipay.com/issues/834

## Requirements

  * install [**NPM**](http://nodejs.org/)
  * install [**Redis**](http://redis.io/topics/quickstart), hubot's brain.
    (Installing via [homebrew](https://github.com/Homebrew/homebrew/wiki/Installation) is recommended on OSX.)

## Testing

To test roobot locally:

	git clone git@github.com:gratipay/roobot.git && cd roobot
	npm install
	bin/hubot -n roobot

## Contributing

roobot is composed of a core ([hubot][]) and a set of scripts. The configuration is
done through environment variables.

Scripts come for three sources:

- the `hubot-scripts.json` file, it adds scripts from the official [hubot-scripts][] repository
- the `external-scripts.json` file, it adds scripts from standalone repositories (e.g. [hubot-seen][])
- the `scripts` directories, it contains our own custom scripts

Take a look at the [Scripting Guide][] if you want to write a new script.

[hubot]: https://github.com/github/hubot
[hubot-scripts]: https://github.com/github/hubot-scripts
[hubot-seen]: https://github.com/gratipay/hubot-seen
[Scripting Guide]: https://github.com/github/hubot/blob/master/docs/scripting.md

## Deploying

	git remote add heroku git@heroku.com:roobot-test.git
	git remote add heroku-prod git@heroku.com:roobot-prod.git

	# Deploy to the test channel
	git push heroku

	# Confirm the bot is working in #gratipay-test
	# Take a look at the logs if there is a problem:
	# heroku -a roobot-test logs -t

	# If all is well deploy to the prod channel (i.e. #gratipay)
	git push heroku-prod

## Restarting the bot

You may want to get comfortable with `heroku logs` and `heroku restart`
if you're having issues.

