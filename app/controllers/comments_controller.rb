class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  skip_before_action :authorize, only: [:show, :index, :create, :patch, :delete]

  # GET /comments
  def index
    comments = Comment.all.order(created_at: :desc)

    render json: comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    # @comment = Comment.new(comment_params)

    # if @comment.save!
    #   render json: @comment, status: :created
    # else
    #   render json: @comment.errors, status: :unprocessable_entity
    # end

    comment = Comment.create!(comment_params)
    render json: comment, status: :created
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.permit(:post_id, :user_id, :content)
    end
end
