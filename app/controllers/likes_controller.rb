class LikesController < ApplicationController
  before_action :set_like, only: [:show, :update, :destroy]
  skip_before_action :authorize, only: [:index, :create, :show, :destroy]

  # GET /likes
  def index
    @likes = Like.all

    render json: @likes
  end

  # GET /likes/1
  def show
    render json: @like
  end

  # POST /likes
  # def create
  # previous_like = Like.find_by(user_id: session[:user_id], post_id: params[:id])
    
  # # if previous_like == nil
  #     like = Like.new(like_params)
  #     if like.save
  #     render json: @like, status: :created
  #   else
  #     render json: @like.errors, status: :unprocessable_entity
  #   end
  # end

  def create
    like = Like.create!(like_params)
    if like
        render json: like
    else
        render json: { message: 'There was an error creating the Like' }
    end
end

def destroy
    like = Like.find_by(user_id: session[:user_id], post_id: params[:id])
    if like
        like.destroy
        render json: { message: 'Like has been successfully removed'}
    else
        render json: { message: 'There was an error in removing the like'}
    end
end

def unlike
  like = Like.find_by(user_id: session[:user_id], post_id: params[:id])
    if like
        like.destroy
        render json: { message: 'Like has been successfully removed'}
    else
        render json: { message: 'There was an error in removing the like'}
    end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.permit(:id, :post_id, :user_id)
    end
end
