# Hubot

This is a version of GitHub's Campfire bot, hubot. He's pretty cool.

This version is designed to be deployed on [Heroku][heroku]. This README was generated for you by hubot to help get you started. Definitely update and improve to talk about your own instance, how to use and deploy, what functionality he has, etc!

[heroku]: http://www.heroku.com

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

  * install **Gnu Privacy Guard (GPG)**
  * generate a GPG key
  * configure **Git** to use your key
  * install [Heroku pipeline plugin](https://devcenter.heroku.com/articles/labs-pipelines):
    `heroku plugins:install git://github.com/heroku/heroku-pipeline.git`

```
git remote add heroku git@heroku.com:roobot-test.git
git checkout master
git branch --set-upstream-to=heroku/master
grunt release[:patch | :minor | :major]
# Enter gpg key password when prompted

# Confirm the bot is working in #gittip-hubot-test
heroku logs

# Push publicly to GitHub if Heroku looks good
git push origin master --tags

# Promote the build from test to prod (ie. #gittip)
heroku pipeline:promote
heroku ps:restart web --app=roobot-prod # So that previous dyno logs out of IRC
heroku logs --app=roobot-prod
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
