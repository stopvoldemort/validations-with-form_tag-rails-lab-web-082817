class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@path)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.new(post_params)
    if @post.valid?
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      @post_id = params[:id]
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
