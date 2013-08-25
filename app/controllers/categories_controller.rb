class CategoriesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user, only: :destroy

  def index
    @category = current_user.categories.build if signed_in?
    @categories = Category.all
  end

  def new
    @category = current_user.categories.build if signed_in?
  end

  def create
  	@category = current_user.categories.build(categories_params)
  	if @category.save
  		flash[:success] = "文章类别创建成功！"
  		redirect_to categories_url
  	else
      @categories = Category.all
  		render 'index'
  	end
  end

  def show
    @categories = Category.all
  end

  def destroy
  	@category.destroy
    flash[:success] = "数据成功删除！"
    redirect_to categories_url
  end

  private
    def categories_params
    	params.require(:category).permit(:content)
    end

    def admin_user
      @category = Category.find_by(id: params[:id])
      redirect_to categories_url if @category.nil?
    end

end
