class ApplicationController < ActionController::Base
  include LoginHelper
  protect_from_forgery with: :exception
end
