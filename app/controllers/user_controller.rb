class UserController < ApplicationController
  include JsonResponder

  def index
    @users = User.select(User.column_names - ['password'])

    respond_with_json("users", @users)
  end

  def show
    @user = User.select(User.column_names - ['password']).find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      if @user.save
        @user = User.select(User.column_names - ['password']).find(@user.id)
        respond_with_json("user", @user)
      else
        respond_with_json_error("error", "cant create user.")
      end
    else
      respond_with_json_error("error", "cant validate user.")
    end
  end

  private
  def set_avatar
    user = User.find(params[:id])
    user.update(avatar: params[:avatar])
    render json: { avatar: rails_blob_path(user.avatar) }
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email_address, :password)
  end
end
