class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resumes
  has_many :jobs
  has_many :job_collections
  has_many :collected_jobs, through: :job_collections, source: :job
  has_many :mini_resumes
  has_many :mini_resume_collections
  has_many :collected_mini_resumes, through: :mini_resume_collections, source: :mini_resume

  def is_collected_job?(job)
    collected_jobs.include?(job)
  end

  def collect_job!(job)
    collected_jobs << job
  end

  def discollect_job!(job)
    collected_jobs.delete(job)
  end


  def is_collected_mini_resume?(mini_resume)
    collected_mini_resumes.include?(mini_resume)
  end

  def collect_mini_resume!(mini_resume)
    collected_mini_resumes << mini_resume
  end

  def discollect_mini_resume!(mini_resume)
    collected_mini_resumes.delete(mini_resume)
  end

  def admin?
    is_admin
  end
end
