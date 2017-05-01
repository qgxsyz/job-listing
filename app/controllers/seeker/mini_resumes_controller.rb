class Seeker::MiniResumesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :destroy]

  def index
    @user = current_user

    @mini_resumes = @user.mini_resumes
  end

  def show
    @mini_resume = MiniResume.find(params[:id])
  end

  def new
    @user = current_user
    @mini_resume = MiniResume.new
  end

  def create
    @mini_resume = MiniResume.new(mini_resume_params)
    @mini_resume.user = current_user
    if @mini_resume.save
      redirect_to seeker_mini_resumes_path
    else
      render :new
    end
  end

  def edit
    @mini_resume = MiniResume.find(params[:id])
  end

  def update
    @mini_resume = MiniResume.find(params[:id])
    if @mini_resume.update(mini_resume_params)
      redirect_to seeker_mini_resumes_path
    else
      render :edit
    end
  end

  def destroy
    @mini_resume = MiniResume.find(params[:id])
    @mini_resume.destroy
    redirect_to seeker_mini_resumes_path
  end

  private
  def mini_resume_params
    params.require(:mini_resume).permit(:name, :job_name, :sex, :birthday, :work_start_time, :state, :address, :wage_upper_bound, :wage_lower_bound, :description)
  end
end
