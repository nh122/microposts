class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @follow_user = User.find(params[:followed_id])
    current_user.follow(@follow_user)
  end

  def destroy
    @follow_user = current_user.following_relationships.find(params[:id]).followed
    current_user.unfollow(@follow_user)
  end
end