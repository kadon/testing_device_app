class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    render :json => { :errors => exception.message }, :status => 422
  end
end
