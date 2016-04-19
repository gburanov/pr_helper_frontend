# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uuid

    def connect
      self.uuid = obtain_uuid
    end

    def obtain_uuid
      uuid = cookies[:hacked_uuid]
      reject_unauthorized_connection if uuid.empty?
      return uuid
    end
  end
end
