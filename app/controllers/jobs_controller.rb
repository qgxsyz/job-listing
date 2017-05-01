class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :collect_job, :discollect_job]
  def index
    # 判断是否筛选城市 #
  if params[:location].present?
    @location = params[:location]
    if @location == '所有城市'
      @jobs = Job.published.recent.paginate(:page => params[:page], :per_page => 10)
    else
      @jobs = Job.where(:is_hidden => false, :location => @location).recent.paginate(:page => params[:page], :per_page => 10)
    end

  # 判断是否筛选职位类型 #
  elsif params[:category].present?
    @category = params[:category]
    if @category == '所有类型'
      @jobs = Job.published.recent.paginate(:page => params[:page], :per_page => 10)
    else
      @jobs = Job.where(:is_hidden => false, :category => @category).recent.paginate(:page => params[:page], :per_page => 10)
    end

    # 预设显示所有公开职位 #
  else
    @jobs = Job.published.recent.paginate(:page => params[:page], :per_page => 10)
  end
end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This Job already archived"
      redirect_to root_path
    end
  end


  def collect
    @job = Job.find(params[:id])
    if current_user.is_collected_job?(@job)
      flash[:warning] = "您已收藏过了"
    else
      current_user.collect_job!(@job)
      flash[:notice] = "收藏成功"
    end

    redirect_to :back
  end

  def discollect
    @job = Job.find(params[:id])
    if current_user.is_collected_job?(@job)
      current_user.discollect_job!(@job)
      flash[:warning] = '取消收藏成功'
    else
      flash[:notice] = "您已取消收藏过了"
    end

    redirect_to :back
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end
end
