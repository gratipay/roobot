# Roobot [![HuBoard badge](http://img.shields.io/badge/Hu-Board-7965cc.svg)](https://huboard.com/gittip/roobot) [![Build Status](http://img.shields.io/travis/gittip/roobot/master.svg)](https://travis-ci.org/gittip/roobot)

This is Gittip's version of GitHub's Campfire bot, hubot. He's pretty cool.

## Requirements

  * install [**NPM**](http://nodejs.org/)
  * install [**Grunt**](http://gruntjs.com/): `npm install --global grunt-cli`
  * install [**Redis**](http://redis.io/topics/quickstart), hubot's brain.
    (Installing via [homebrew](https://github.com/Homebrew/homebrew/wiki/Installation) is recommended on OSX.)

## Testing

To test roobot locally:

```
git clone git@github.com:gittip/roobot.git && cd roobot
npm install
bin/hubot -n roobot
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Deploying

Defore deploying changes, you'll need to do the following:

  * install `grunt-cli`: `[sudo] grunt install --global grunt-cli`
  * install Heroku Toolbelt CLI
  * install [Heroku pipeline plugin](https://devcenter.heroku.com/articles/labs-pipelines):
    `heroku plugins:install git://github.com/heroku/heroku-pipeline.git`

```
git clone git@github.com:gittip/roobot.git
git checkout master
grunt release[:patch | :minor | :major]

# Here's what will happen:
#   1. Grunt will push to origin remote (GitHub).
#   2. Travis will run tests.
#   3. On success, Travis will push to `roobot-test` Heroku app.

# Confirm the bot is working in #gittip-hubot-test

# Confirm logs look fine
heroku logs --app=roobot-test

# Promote the build from test to prod (ie. #gittip)
heroku pipeline:promote --app=roobot-test
heroku ps:restart web --app=roobot-prod # If previous dyno still has nickname
heroku logs --app=roobot-prod
```

### Sensitive Deploys

Sometimes, when pushing sensitive releases, you don't want a public
record of the release to exist prior to successfully deploying live on
Heroku. For example, we don't want a fixed critical bug commit public on
GitHub, and this dangerous situation would be exacerbated if the
subsequent Heroku deploy failed.

To push directly to Heroku first:

```
git remote add heroku git@heroku.com:roobot-test.git
git config branch.master.remote heroku
grunt release[:patch | :minor | :major]
git config branch.master.remote origin

# Confirm the bot is working in #gittip-hubot-test...

# Carry through above steps from normal deploy

# Push to GitHub once changes are live on prod
git push origin master --tags
```
![Hubot deploy pipeline](https://rawgithub.com/gittip/roobot/master/docs/hubot-deploy-workflow.svg)

### Scripting

Take a look at the scripts in the `./scripts` folder for examples.
Delete any scripts you think are useless or boring.  Add whatever functionality you
want hubot to have. Read up on what you can do with hubot in the [Scripting Guide](https://github.com/github/hubot/blob/master/docs/scripting.md).

## hubot-scripts

There will inevitably be functionality that everyone will want. Instead
of adding it to hubot itself, you can submit pull requests to
[hubot-scripts][hubot-scripts].

To enable scripts from the hubot-scripts package, add the script name with
extension as a double quoted string to the `hubot-scripts.json` file in this
repo.

[hubot-scripts]: https://github.com/github/hubot-scripts

## external-scripts

Tired of waiting for your script to be merged into `hubot-scripts`? Want to
maintain the repository and package yourself? Then this added functionality
maybe for you!

Hubot is now able to load scripts from third-party `npm` packages! To enable
this functionality you can follow the following steps.

1. Add the packages as dependencies into your `package.json`
2. `npm install` to make sure those packages are installed

To enable third-party scripts that you've added you will need to add the package
name as a double quoted string to the `external-scripts.json` file in this repo.

## Restart the bot

You may want to get comfortable with `heroku logs` and `heroku restart`
if you're having issues.

