class RelationshipsController < ApplicationController
  before_action :only_loggedin_users

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    @relationAct = Activity.create(actionable: Relationship.last, user_id: current_user.id)
    respond_to do |format|
        format.html { redirect_to @user }
        format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
        format.html { redirect_to @user }
        format.js
    end
  end
end
