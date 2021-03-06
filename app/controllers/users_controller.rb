class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:current]

  def index
    page = params[:page] || 1
    @users = User.all.order(:created_at).page(page).per(20)
  end

  def show
    @user = User.find_by!(username: params[:username]).presenter
  end

  private

  def user_params
    params.require(:user).permit(
      :password,
      :password_confirmation,
      :username,
      :email_notifications
    )
  end
end
