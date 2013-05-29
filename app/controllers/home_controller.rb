class HomeController < ApplicationController
    def index
	@counter = 0
	@assets = Asset.all
  
  if @current_user
  @asset= current_user.assets.build
    end
	if current_user

  @asset= current_user.assets.build
  @assets = current_user.assets
  end
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
end
