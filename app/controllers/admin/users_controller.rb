class Admin::UsersController < ApplicationController
  def index
      @job = Job.find(params[:job_id])
      @users = @job.job_collectors
  end
end
