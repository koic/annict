class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:create, :destroy]


  def create
    follow = current_user.follow(@user)
    keen_client.follows.create(follow) if follow.present?

    render status: 200, nothing: true
  end

  def destroy
    current_user.unfollow(@user)

    render status: 200, nothing: true
  end


  private

  def set_user
    @user = User.find(params[:id])
  end
end
