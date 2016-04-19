class WelcomeController < ApplicationController
  def index
    cookies[:hacked_uuid] = nil
  end

  def results
    cookies[:hacked_uuid] = SecureRandom.uuid if cookies[:hacked_uuid].empty?

    uuid = cookies[:hacked_uuid]
    url = params[:url]
    BackendMessager.new(uuid)
  end
end
