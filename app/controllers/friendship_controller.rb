class FriendshipController < ApplicationController

  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
      if current_user.save
        flash[:notice] = "You are now following #{friend.first_name} #{["🚶‍♂️","🔍","🕵️‍♂️"].shuffle.first}"
      else
        flash[:alert] = "Hmm... Something went wrong and follow was unsuccessful #{["🤔","🐌","😑"].shuffle.first}"
      end
      redirect_to friends_path


  end

  def destroy
    friend = User.find(params[:id])
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "#{friend.first_name} unfollowed! #{["💁‍♀️ - Bye Felicia!","💁‍♂️","✂","💅","🧊",].shuffle.first}"
    redirect_to friends_path
  end

end
