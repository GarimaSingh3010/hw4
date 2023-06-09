class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["username"] = params["user"]["username"]
    @user["email_id"] = params["user"]["email_id"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
    @user.save
    session["user_id"] = @user["id"]
    redirect_to "/"
  end
end
