class PostsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user, only: [:destroy, :new, :create, :index, :edit, :update]

  def new
    @categories = Category.all
    @journals = Journal.all
  	@post = current_user.posts.build if admin?
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      flash[:success] = "文章添加成功！"
      redirect_to posts_url
    else
      @categories = Category.all  #必须重新获取数据
      @journals = Journal.all
      render 'new'
    end
  end
  
  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
    @journals = Journal.all
  end

  def update
    @post = Post.find(params[:id])
    @categories = Category.all
    @journals = Journal.all

    if @post.update_attributes(posts_params)
      flash[:success] = "文章信息修改成功"
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "数据成功删除！"
    redirect_to posts_url
  end
  
  private
    def posts_params
    	params.require(:post).permit(:title, :link, :author, :note, :category_id, :journal_id)
    end

    def admin_user
      @post = Post.find_by(id: params[:id])
    end
end
