class ApplicationController < ActionController::Base

  include pundit

  before_action :authenticate_user!

  protect_from_forgery with: :exception
end
