# frozen_string_literal: true
class WelcomeController < ApplicationController
  def index
    cookies[:hacked_uuid] = nil
  end

  def results
    cookies[:hacked_uuid] = SecureRandom.uuid unless cookies[:hacked_uuid].present?
    uuid = cookies[:hacked_uuid]
    url = params[:url]
    BackendMessager.new(uuid).send(url)
  end
end
