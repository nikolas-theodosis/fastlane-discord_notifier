describe Fastlane::Actions::DiscordNotifierAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The discord_notifier plugin is working!")

      Fastlane::Actions::DiscordNotifierAction.run(nil)
    end
  end
end
