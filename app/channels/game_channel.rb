# frozen_string_literal: true
# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_#{uuid}"
    ChannelManager.add_channel(uuid)
  end

  def unsubscribed
    ChannelManager.remove_channel(uuid)
  end
end
