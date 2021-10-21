class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(
      tittle: params[:tittle],
      start: params[:start],
      stop: params[:stop],
      detail: params[:detail])
    if @post.save
      flash[:notice] = "スケジュールを登録しました。"
      redirect_to("/")
    else
     render("posts/new")
    end
  end
  def show
    @post = Post.find_by(id: params[:id])
  end
 
  def edit
    @post = Post.find_by(id: params[:id])
  end
 
  def update
    @post = Post.find_by(id: params[:id])
    @post.tittle = params[:tittle]
    @post.start = params[:start]
    @post.stop = params[:stop]
    @post.detail = params[:detail]
    if @post.save
      flash[:notice] = "スケジュールを編集しました。"
      redirect_to("/")
    else
      render("posts/edit")
    end
  end
 
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to("/")
  end
end
