class Api::V1::BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:show, :update, :destroy]

  def index
    @blogs = Blog.all
    render json: @blogs, each_serializer: BlogSerializer
  end

  def show
    render json: @blog, serializer: BlogSerializer
  end

  def create
    @blog = current_user.blogs.build(blog_params)

    if @blog.save
      render json: @blog, serializer: BlogSerializer, status: :created
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  def update
    if @blog.update(blog_params)
      render json: @blog, serializer: BlogSerializer
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    head :no_content
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
