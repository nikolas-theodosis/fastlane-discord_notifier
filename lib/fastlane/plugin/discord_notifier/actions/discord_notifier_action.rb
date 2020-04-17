require 'fastlane/action'
require_relative '../helper/discord_notifier_helper'
require 'discordrb/webhooks'

module Fastlane
  module Actions
    class DiscordNotifierAction < Action
      def self.run(params)
        UI.message("Notifying Discord")


        client = Discordrb::Webhooks::Client.new(url: params[:webhook_url])
        client.execute do |builder|
          builder.add_embed do |embed|
            embed.title = "Title"
            embed.description = "Description"
          end
        end
      end

      def self.description
        "Discord Webhook Notifier"
      end

      def self.authors
        ["Nikos Theodosis"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        ""
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :webhook_url,
            env_name: "DISCORD_WEBHOOK_URL",
            description: "Discord Webhook URL",
            optional: false,
            type: String
          )
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
