class ItemsController < ApplicationController
  def index
      @user = User.all
  end

  # def new
  #   @user = User.new

  #   if @user.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(users_params)
  #     redirect_to root_path
  #   else
  #     render :update
  #   end
  # end

  private


  def users_params
    params.require(:user).permit(:email,:password)
  end

end

