class Collect::JobsController < ApplicationController
  def index
      @jobs = current_user.collected_jobs
  end
end
