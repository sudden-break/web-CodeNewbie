class BlogController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    if params[:tag]
      @blog_posts = Blog.tagged_with(params[:tag]).order("created_at")
    else
      @blog_posts = Blog.all.order("created_at")
    end
  end

  def new
    @blog_post = Blog.new
  end

  def create
    @blog_post = Blog.new(blog_params)
    if @blog_post.save
      redirect_to blog_path(@blog_post.slug)
    else
      flash[:notice] = "Couldn't save. Try again?"
      redirect_to new_blog_path
    end
  end

  def show
    @blog_post = Blog.friendly.find(params[:slug])
  end

  def edit
    @blog_post = Blog.friendly.find(params[:slug])
  end

  def update
    @blog_post = Blog.friendly.find(params[:slug])
    @blog_post.update(blog_params)
    if @blog_post.save
      redirect_to blog_path(@blog_post.slug)
    else
      flash[:notice] = "Couldn't save. Try again?"
      redirect_to edit_blog_path(@blog)
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :tag_list, :excerpt)
  end

end