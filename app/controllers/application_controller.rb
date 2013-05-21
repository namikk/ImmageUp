class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    # Checking the user against the database, while a minor performance hit, 
    # ensures that if an administrator deletes a user, the next time the user navigates to a page, 
    # he/she will be automatically signed out.
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
end
