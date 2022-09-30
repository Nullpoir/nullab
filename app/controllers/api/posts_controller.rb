class Api::PostsController < ApplicationController
  before_action :posts, only: %i[index]
  before_action :post, only: %i[show]

  def index
    render json: @posts,
           each_serializer: Api::PostIndexSerializer
  end

  def show
  end

  private

  def post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(

    )
  end

  def posts
    @posts = Post.published.page(params[:page])
  end
end
