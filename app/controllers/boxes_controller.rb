class BoxesController < ApplicationController
  # GET /boxes
  # GET /boxes.json
  # GET /users/:user_id/boxes(.:format)
  def index
    @user = User.where("username = ?", params[:user_id]).first
    @boxes = @user.boxes.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boxes }
    end
  end

  # GET /boxes/1
  # GET /boxes/1.json
  # GET    /users/:user_id/boxes/:id(.:format)
  def show
    @box = Box.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @box }
    end
  end

  # GET /boxes/new
  # GET /boxes/new.json
  # GET    /users/:user_id/boxes/new(.:format)
  def new
    @user = User.where("username = ?", params[:user_id]).first
    @box = @user.boxes.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @box }
    end
  end

  # GET /boxes/1/edit
  # GET    /users/:user_id/boxes/:id
  def edit
    @box = Box.find(params[:id])
  end

  # POST /boxes
  # POST /boxes.json
  # POST   /users/:user_id/boxes(.:format)
  def create
    @user = User.where("username = ?", params[:user_id]).first
    @box = Box.new(params[:box])

    respond_to do |format|
      if @box.save
        format.html { redirect_to @box, notice: 'Box was successfully created.' }
        format.json { render json: @box, status: :created, location: @box }
      else
        format.html { render action: "new" }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /boxes/1
  # PUT /boxes/1.json
  # GET    /users/:user_id/boxes/:id/edit(.:format)
  def update
    @box = Box.find(params[:id])

    respond_to do |format|
      if @box.update_attributes(params[:box])
        format.html { redirect_to @box, notice: 'Box was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boxes/1
  # DELETE /boxes/1.json
  # DELETE /users/:user_id/boxes/:id(.:format)
  def destroy
    @box = Box.find(params[:id])
    @box.destroy

    respond_to do |format|
      format.html { redirect_to boxes_url }
      format.json { head :no_content }
    end
  end
end
