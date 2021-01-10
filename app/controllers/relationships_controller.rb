class RelationshipsController < ApplicationController

  def create
    follow = current_user.relationships.build(follow_id: params[:user_id])
    follow.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    follow = current_user.relationships.find_by(follow_id: params[:user_id])
    follow.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
