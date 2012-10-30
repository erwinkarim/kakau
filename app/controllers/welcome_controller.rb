class WelcomeController < ApplicationController
  def index
    if !session[:username].nil? then
      redirect_to user_boxes_path(session[:username])
    end
  end
end
