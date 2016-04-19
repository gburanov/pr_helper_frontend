class ChannelManager
  @@channels = Hash.new

  class << self
    def add_channel(uuid)
      @@channels[uuid] = 1
    end

    def process(message)
      uuid = message.message_attributes["uuid"]&.string_value
      return if uuid.nil?
      return unless @@channels.has_key?(uuid)
      puts "Broascasting... #{message.body}"
      body = "<p>" + message.body
      ActionCable.server.broadcast "user_#{uuid}", body
    end

    def remove_channel(uuid)
      @@channels.delete(uuid)
    end
  end
end
