class RelationshipsController < ApplicationController
  def create
    follow = Relationship.create!(follow_params)
    if follow
      render json: follow
    else
      render json: [{ errors: "Unable to Create Follow" }]
    end
  end

  def followers
    user = User.find(params[:id])
    if user
      render json: user.followers
    else
      render json: [{ errors: "User Not found" }]
    end
  end

  def following
    user = User.find(params[:id])
    if user
      render json: user.followees
    else
      render json: [{ errors: "User Not found" }]
    end
  end

  def unfollow
    follow = Relationship.find_by(follower_id: session[:user_id], followee_id: params[:id])

    if follow
      follow.destroy
      puts 'something'
    end
  end

  def follow_params
    params.permit(:follower_id, :followee_id)
  end
end
