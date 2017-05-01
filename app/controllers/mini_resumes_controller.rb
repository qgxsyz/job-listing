class MiniResumesController < ApplicationController
  before_action :authenticate_user!

  def index
    @mini_resumes = MiniResume.all
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
