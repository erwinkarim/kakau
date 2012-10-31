class WelcomeController < ApplicationController
  def index
    if user_signed_in? then
      redirect_to user_boxes_path(current_user.username)
    end
  end
end
