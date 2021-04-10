class UsersController < ApplicationController
  def show
    # @user = User.includes(:user)
    @user = User.find(params[:id])
  end


end
