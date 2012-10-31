class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #@user = User.find(params[:id])
    @user = User.where("username = ?", params[:id]).first

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
  end

  # POST /users
  # POST /users.json
  def create
    respond_to do |format|
      if @user.save
        #create root folder here
        @box = @user.boxes.new(:kind => 'root', :name => 'rootDir') 
        @box.save
        format.html { redirect_to user_path(@user.username) } 
        format.json { render json: @user, status: :created, location: @user }
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
        format.html { render action: "edit" }
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

  # GET    /users/:user_id/view(.:format)
  def view
    @user = User.where("username = ?", params[:user_id]).first
    @boxes = @user.boxes.all
  end

  # POST   /users/:user_id/login(.:format)
  def login
    #login verification stuff
    @user = User.where("username = ?", params[:user]).first
    if @user.nil? then
      @user = User.new
      @user.errors.add(:username, 'does not exists')
    else
      #user is valid, now check for password
      if @user.password != params[:pass] then
        @user.errors.add(:password, 'invalid')
      else
        session[:username] = @user.username
      end
    end 
  end
  
  def logout
    #reset session
    session[:username] = nil
    redirect_to root_path
  end
end
