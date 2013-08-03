class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :http_authenticate if Rails.env == "production"

  def http_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "codefellows" && password == "c0defe!!@ws"
    end
  end
end
