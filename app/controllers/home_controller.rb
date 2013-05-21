class HomeController < ApplicationController
    def index
    @users = User.all
	@assets = Asset.all
	@counter = 0
	if current_user
	@user= current_user
    @asset = @user.assets.build(params[:asset])
	end
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
end
