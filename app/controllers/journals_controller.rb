class JournalsController < ApplicationController
  before_action :admin_user, only: [:destroy, :index, :edit, :update]
  
  def index
    @starttime = Time.now.beginning_of_week.strftime("%Y.%m.%d")
    @endtime = Time.now.end_of_week.strftime("%Y.%m.%d")
  	@journal = current_user.journals.build if admin?
  	@journals = Journal.all
  end

  def create
  	@journal = current_user.journals.build(journals_params)
  	if @journal.save
  		flash[:success] = "期刊号创建成功！"
  		redirect_to journals_url
  	else
      @starttime = Time.now.beginning_of_week.strftime("%Y.%m.%d")
      @endtime = Time.now.end_of_week.strftime("%Y.%m.%d")
      @journals = Journal.all
  		render 'index'
  	end
  end

  def show
    @journal = Journal.find(params[:id])
    @journals = Journal.all
    @journaltotal = Journal.count

    @next = Journal.all.where("id > ?", @journal.id).order("id ASC").first
    @prev = Journal.all.where("id < ?", @journal.id).order("id DESC").first

    rescue ActiveRecord::RecordNotFound
      flash[:error] = "你浏览的内容去火星了"
      redirect_to root_path
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
    @journal = Journal.find(params[:id])

    if @journal.update_attributes(journals_params)
      flash[:success] = "期刊信息修改成功"
      redirect_to journals_url
    else
      render 'edit'
    end
  end

  def destroy
    @journal.destroy
    flash[:success] = "数据成功删除！"
    redirect_to journals_url
  end

  private
    def journals_params
    	params.require(:journal).permit(:starttime, :endtime, :journalnum, :note)
    end

    def admin_user
      @journal = Journal.find_by(id: params[:id])
    end
end
