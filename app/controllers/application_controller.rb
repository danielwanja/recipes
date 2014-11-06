class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_action :no_cache

  # FROM: http://stackoverflow.com/questions/19883497/heroku-rails-cors-issue
  def cors_preflight_check
    headers['Access-Control-Max-Age'] = '1728000'

    render json: {} # Render as you need
  end

  protected

  def no_cache
    # response.headers['Last-Modified'] = Time.now.httpdate
    expires_now
  end

end
