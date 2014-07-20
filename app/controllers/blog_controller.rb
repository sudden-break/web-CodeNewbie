class BlogController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    if params[:tag]
      @blogs = Blog.tagged_with(params[:tag]).order("created_at")
    else
      @blogs = Blog.all.order("created_at")
    end
    
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog.slug)
    else
      flash[:notice] = "Couldn't save. Try again?"
      redirect_to new_blog_path
    end
  end

  def show
    @blog = Blog.friendly.find(params[:slug])
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :tag_list, :excerpt)
  end

end
