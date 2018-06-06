class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @routes = policy_scope(Route).where(@user_id).where(public: true)
    @hiked_routes = HikedRoute.where(user_id: @user.id)
    @customized_routes = Route.where(public: false).where(user_id: @user.id)
    # current_user.hiked_routes
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :username, :email, :picture_url)
  end
end


