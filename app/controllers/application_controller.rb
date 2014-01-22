class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_action :no_cache

  protected

  def no_cache
    # response.headers['Last-Modified'] = Time.now.httpdate
    expires_now
  end

end
