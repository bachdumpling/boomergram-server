class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authorize, only: [:show, :index, :feed, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :handle_baddata

  # GET /users
  def index
    render json: User.all
  end

  # GET /users/1
  def show
    # user = User.find_by(id: session[:user_id]) 
    other_user = User.find_by(id: params[:id])

    # if user.id != other_user.id
      render json: other_user
    # end
  end

  def show_me
    user = User.find_by(id: session[:user_id])
    render json: user
  end

  # want all posts where their user_id match in the array of followees for self
  def feed
    user = User.find_by(id: session[:user_id])
    user_id = user.followees.pluck(:id).append(user)
    posts = Post.where(user_id: user_id).order(created_at: :desc)
    render json: posts
  end

  # POST /users
  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # GET /

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :bio, :avatar_url, :password)
    end
end
