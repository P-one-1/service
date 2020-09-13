class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
  end

  def create
    # binding.pry
    result = RegisterUser.call(User.new(user_params))
    if result.success?
      redirect_to new_user_path
    else
      render 'new', error: result.errors
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

end
