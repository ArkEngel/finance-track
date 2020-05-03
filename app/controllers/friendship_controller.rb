class FriendshipController < ApplicationController

  def create

  end

  def destroy
    friend = User.find(params[:id])
    friendship = Friendship.where(user_id: current_user.id, friend_id: friend.id).first
    friendship.destroy
    flash[:notice] = "#{friend.first_name} was unfriended 😢."
    redirect_to friends_path
  end

end
