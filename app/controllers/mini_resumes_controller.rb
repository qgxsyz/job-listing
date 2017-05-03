class MiniResumesController < ApplicationController
  before_action :authenticate_user!, only: [:collect, :discollect]

  def index
    # 判断是否筛选城市 #
  if params[:address].present?
    @address = params[:address]
    if @address == '所有城市'
      @mini_resumes = MiniResume.recent.paginate(:page => params[:page], :per_page => 10)
    else
      @mini_resumes = MiniResume.where(:address => @address).recent.paginate(:page => params[:page], :per_page => 10)
    end

    # 判断是否筛选薪水 #
    elsif params[:wage].present?
      @wage = params[:wage]
      if @wage == '5k以下'
        @mini_resumes = MiniResume.wage1.recent.paginate(:page => params[:page], :per_page => 10)
      elsif @wage == '5~10k'
        @mini_resumes = MiniResume.wage2.recent.paginate(:page => params[:page], :per_page => 10)
      elsif @wage == '10~15k'
        @mini_resumes = MiniResume.wage3.recent.paginate(:page => params[:page], :per_page => 10)
      elsif @wage == '15~25k'
        @mini_resumes = MiniResume.wage4.recent.paginate(:page => params[:page], :per_page => 10)
      elsif @wage == '25k以上'
        @mini_resumes = MiniResume.wage5.recent.paginate(:page => params[:page], :per_page => 10)
      else
        @mini_resumes = MiniResume.recent.paginate(:page => params[:page], :per_page => 10)
      end

    # 预设显示所有公开职位 #
  else
    @mini_resumes = MiniResume.recent.paginate(:page => params[:page], :per_page => 10)
  end
  end

  def show
    @mini_resume = MiniResume.find(params[:id])
  end

  def collect
    @mini_resume = MiniResume.find(params[:id])
    if current_user.is_collected_mini_resume?(@mini_resume)
      flash[:warning] = "您已收藏过了"
    else
      current_user.collect_mini_resume!(@mini_resume)
      flash[:notice] = "收藏成功"
    end

    redirect_to :back
  end

  def discollect
    @mini_resume = MiniResume.find(params[:id])
    if current_user.is_collected_mini_resume?(@mini_resume)
      current_user.discollect_mini_resume!(@mini_resume)
      flash[:warning] = '取消收藏成功'
    else
      flash[:notice] = "您已取消收藏过了"
    end

    redirect_to :back
  end

end
