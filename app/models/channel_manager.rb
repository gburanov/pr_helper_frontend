class ChannelManager
  @@channels = Hash.new

  class << self
    def add_channel(uuid)
      @@channels[uuid] = 1
    end

    def process(message)
      byebug
      uuid = message.message_attributes["uuid"]&.string_value
      return if uuid.nil?
      return unless @@channels.has_key?(uuid)
      ActionCable.server.broadcast "user_#{uuid}", message.body
    end

    def remove_channel(uuid)
      @@channels.delete(uuid)
    end
  end
end