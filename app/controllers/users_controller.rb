class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_action, except: [:index, :show]

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      
    else

    end
  end

  def destroy
    if @user.destroy

    else

    end
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :poster)
  end

  def authorize_action
    authorize(@user, "#{params[:action]}?")
  end
end
