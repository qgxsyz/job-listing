class MiniResume < ApplicationRecord
  validates :name, presence: {message: "请填写您的姓名"}
  validates :sex, presence: {message: "请选择您的性别"}
  validates :birthday, presence: { message: "请输入您的生日" }
  validates :work_start_time, presence: {message: "请填写您的开始工作时间"}
  validates :job_name, presence: {message: "请填写你要应聘的职位名称"}
  validates :state, presence: { message: "请选择您当前所处的工作状态" }
  validates :address, presence: { message: "请选择期望工作地点" }
  validates :description, presence: { message: "请填写您的工作经历" }
  validates :wage_lower_bound, presence: { message: "请填写最低薪水" }
  validates :wage_upper_bound, presence: { message: "请填写最高薪水" }
  validates :wage_lower_bound, numericality: { less_than: :wage_upper_bound, message: "薪水下限不能高于薪水上限" }
  validates :wage_upper_bound, numericality: { greater_than: 0, message: "最小薪水必须大于零" }
  validates :email, presence: { message: "请填写联系用的邮箱" }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i , message: "请输入正确的邮箱格式"

  belongs_to :user
  has_many :mini_resume_collections
  has_many :mini_resume_collectors, through: :mini_resume_collections, source: :user

  scope :recent, -> {order('created_at DESC')}

  scope :wage1, -> { where('wage_lower_bound <= 5 or wage_upper_bound <= 5') }
  scope :wage2, -> { where('wage_lower_bound between 5 and 10 or wage_upper_bound between 5 and 10') }
  scope :wage3, -> { where('wage_lower_bound between 10 and 15 or wage_upper_bound between 10 and 15') }
  scope :wage4, -> { where('wage_lower_bound between 15 and 25 or wage_upper_bound between 15 and 25') }
  scope :wage5, -> { where('wage_lower_bound >= 25 or wage_upper_bound >= 25') }
end
