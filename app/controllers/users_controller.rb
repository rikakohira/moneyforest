class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    redirect_to books_path unless current_user.id == @user.id
  end

  def update

  end
end
