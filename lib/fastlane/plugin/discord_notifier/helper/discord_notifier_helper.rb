require 'fastlane_core/ui/ui'
require 'digest/md5'
require 'discordrb'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class DiscordNotifierHelper
      # class methods that you define here become available in your action
      # as `Helper::DiscordNotifierHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the discord_notifier plugin helper!")
      end
    end

    class DiscordUserHelper

      def self.gravatarImageUrl(email)
        email_address = ENV["FASTLANE_USER"].downcase
        # create the md5 hash
        hash = Digest::MD5.hexdigest(email)
        # compile URL which can be used in <img src="RIGHT_HERE"...
        image_src = "https://www.gravatar.com/avatar/#{hash}"
        
        return image_src
      end

      def self.findUser(bot_token, client_id, user_id)
        bot = Discordrb::Bot.new(
          token: bot_token,
          client_id: client_id
        )
        user = bot.user(user)
      
        return user
      end
    end
  end
end
