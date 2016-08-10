# frozen_string_literal: true
# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uuid

    def connect
      puts 'New connection'
      self.uuid = obtain_uuid
    end

    def obtain_uuid
      cookies[:hacked_uuid].tap do |uuid|
        reject_unauthorized_connection if uuid.blank?
      end
    end
  end
end
