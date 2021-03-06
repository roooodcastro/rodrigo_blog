# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_action

  def index
    @users = User.all.map { |a| a.decorate(view_context) }
  end

  def show
    @user = @user.decorate(view_context)
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = t('users.update.success')
      redirect_to @user
    else
      flash[:error] = t('users.update.error', errors)
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = t('users.destroy.success')
    else
      flash[:error] = t('users.destroy.error', errors)
    end
    redirect_to root_path
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :poster)
  end

  def authorize_action
    authorize(@user || User, "#{params[:action]}?")
  end

  def errors
    @user.errors.full_messages.join(',')
  end
end
