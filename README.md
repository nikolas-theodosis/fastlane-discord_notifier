# discord_notifier plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-discord_notifier)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-discord_notifier`, add it to your project by running:

```bash
fastlane add_plugin discord_notifier
```

## About discord_notifier

Discord Notifier

`discord_notifier` posts a message in a discord channel defined by a webhook created for your discord server.

## Usage

To get started, first, create a webhook in your Discord server. You can find detailed instructions [here](https://support.discordapp.com/hc/en-us/articles/228383668-Intro-to-Webhooks). You will need the webhook url in each call to successfully post a message in your channel.

```ruby
discord_notifier(
    webhook_url:"<discord webhook url>",
    title: "<a title>",
    description: "<a description>",
    success: "<true/false>", 
    color: "FFFFF", 
    thumbnail_url:"<thumbnail url>", 
    image_url:"<image url>"  
  )
```

## Keys

| Key | Description | Optional
| --- | --- | ---|
| webhook_url | Discord webhook url | false
| title | Message title | false
| description | Message description | false
| thumbnail_url | Thumbnail url | true
| image_url | Message image url | true
| success | Show file differences that haven't been staged | true
| color | The color defined will be attributed to the message sidebar. The sidebar by default uses #4BB543 if `success` is set to true and #CC0000 if set to false. If color is set, it overrides the default color described before. | true
| gravatar_email | If set, then the author's image will be replaced by the resolved gravatar. If not and the next 3 keys are set, the author's image will be set as the user's discord avatar  | true
| bot_token | Token of bot assigned to discord server | true
| client_id | Client id retrieved upon bot creation | true
| discord_user_id | User id of the discord user | true

**Note on the Bot**: Currently the bot is needed in case you want to retrieve your discord user's data. the plugin is using the user's name and avatar to assign them to the author of the message. Create a [discord application](https://discordapp.com/developers/applications), then a new bot and finally assign it to your server. You will need the bot token, the client id and your discord user's id to successfully retrieve all the necessary data.

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
