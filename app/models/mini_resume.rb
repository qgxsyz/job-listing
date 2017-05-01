class MiniResume < ApplicationRecord
  belongs_to :user
  has_many :mini_resume_collections
  has_many :mini_resume_collectors, through: :mini_resume_collections, source: :user
end
