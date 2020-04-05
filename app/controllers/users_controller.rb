class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = "登録が完了しました。"
      redirect_to root_path
    else
      flash.now[:alert] = "登録に失敗しました。"
      render new_user_path
    end
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :sex )
  end
end
