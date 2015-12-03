class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
	if current_user==nil
		redirect_to :root
	end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  @user = User.find(params[:id])
	@counter = 0
  @assets = @user.assets
  @albums = @user.albums
  if current_user
	@asset= @current_user.assets.build
	@album= @current_user.albums.build
  end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
  @user = User.find(params[:id])
	@user.assets.build
  @user.albums.build
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to :root, notice: 'User was successfully created. Please sign in to upload pictures' }
        format.json { render json: @root, status: :created, location: @root }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'User was NOT successfully updated.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
