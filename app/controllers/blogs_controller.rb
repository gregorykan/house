class BlogsController < ApplicationController
  before_filter :authenticate_user_from_token!

  def index
    @blogs = Blog.all
    render json: { blogs: @blogs }
  end

  def show
    @blog = Blog.find(params[:id])
    render json: { blog: @blog }
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      track_activity(@blog)
      render json: { blog: @blog }
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      track_activity(@blog)
      render json: { blog: @blog }
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    ActiveRecord::Base.transaction do
      track_activity(@blog)
      @blog.destroy
    end
    render status:200, json: {}
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text)
  end


end
