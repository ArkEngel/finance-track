class FriendshipController < ApplicationController

  def create

  end

  def destroy
    friend = User.find(params[:id])
    friendship = Friendship.where(user_id: current_user.id, friend_id: friend.id).first
    friendship.destroy
    sass = rand(3)
    flash[:notice] = "#{friend.first_name} unfollowed! #{["💁‍♀️ - Bye Felicia!","💁‍♂️","✂","💅","🧊",].shuffle.first}"
    redirect_to friends_path
  end

end
