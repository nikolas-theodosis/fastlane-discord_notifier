require 'fastlane/action'
require_relative '../helper/discord_notifier_helper'
require 'discordrb/webhooks'


module Fastlane
  module Actions
    class DiscordNotifierAction < Action
      def self.run(params)
        
        UI.message("Notifying Discord")

        color = params[:success] ? "4BB543" : "CC0000"

        unless params[:color].nil? || params[:color] == 0
          color = params[:color]
        end
        
        begin
          user = Helper::DiscordUserHelper.findUser(params[:bot_token], params[:client_id], params[:discord_user_id])
          discord_avatar = user.avatar_url
        rescue => ex
          UI.important('Fetching user data failed. Continuing anyway...')
        end

        author_name = ENV['USER']
        unless user.nil?
          author_name = user.name
        end

        unless params[:gravatar_email].nil? || params[:gravatar_email].empty?
          discord_avatar = Helper::DiscordUserHelper.gravatarImageUrl(params[:gravatar_email])
        end
       
        client = Discordrb::Webhooks::Client.new(url: params[:webhook_url])
        client.execute do |builder|
          builder.add_embed do |embed|
            embed.title = params[:title]
            embed.description = params[:description]
            embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(
              url: params[:thumbnail_url]
            )
            embed.image = Discordrb::Webhooks::EmbedImage.new(
              url: params[:image_url]
            )
            embed.author = Discordrb::Webhooks::EmbedAuthor.new(
              name: author_name,
              icon_url: discord_avatar
            )
            embed.colour = color
            embed.timestamp = Time.now
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
          ),
          FastlaneCore::ConfigItem.new(
            key: :title,
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :description,
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :thumbnail_url,
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :image_url,
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :success,
            optional: true,
            default_value: true,
            is_string: false
          ),
          FastlaneCore::ConfigItem.new(
            key: :color,
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :gravatar_email,
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :bot_token,
            env_name: "DISCORD_BOT_TOKEN",
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :client_id,
            env_name: "DISCORD_CLIENT_ID",
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :discord_user_id,
            env_name: "DISCORD_USER_ID",
            optional: true,
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
