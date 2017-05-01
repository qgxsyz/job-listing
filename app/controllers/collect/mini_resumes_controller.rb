class Collect::MiniResumesController < ApplicationController
  def index
      @mini_resumes = current_user.collected_mini_resumes
  end
end
