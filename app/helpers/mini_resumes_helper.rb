module MiniResumesHelper

  # 要求薪水区间 #
  def render_mini_resume_wage(mini_resume)
    "#{mini_resume.wage_lower_bound} k ~ #{mini_resume.wage_upper_bound} k"
  end

  # 创建时间格式化
  def render_mini_resume_time(mini_resume)
    mini_resume.created_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
