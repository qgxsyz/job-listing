class Seeker::UsersController < ApplicationController
  def index
      @mini_resume = MiniResume.find(params[:mini_resume_id])
      @users = @mini_resume.mini_resume_collectors
  end
end
