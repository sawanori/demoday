class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user.postarticles
    @ticket = current_user.tickets.order(:created_at)



  end
end
