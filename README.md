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
    success: "<true/false>", # Optional - Default is true
    color: "FFFFF", # Optional
    author:"<author's name>" # Optional
    thumbnail_url:"<thumbnail url>", # Optional
    image_url:"<image url>" # Optional 
  )
```
**A note on the color property** : The color defined will be attributed to the message sidebar. The sidebar by default uses #4BB543 if `success` is set to true and #CC0000 if set to false. If `color` is set, it overrides the default color described before.

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
