class AuthenticationController < ApplicationController
  def change_password
  end

  def forgot_password
  end

  def new_user
  end

  def password_sent
  end
#m ethod "sign_in" is called from the route that handles the HTTP "get" command:
 def sign_in
    @user = User.new
  end

  
  
# method handles the HTTP "post" command, determining whether the user is authenticated.
def login
    name = params[:user][:name]
    password = params[:user][:password]
    user = User.authenticate_by_name(name, password) || User.authenticate_by_email(name, password)

	if user
	session[:user_id] = user.id
	flash[:notice] = 'Welcome.'
	redirect_to :root
	else
	flash.now[:error] = 'Unknown user. Please check your username and password.'
	render :action => "sign_in"
	end

end
def signed_out
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."
  redirect_to :root
end
end
