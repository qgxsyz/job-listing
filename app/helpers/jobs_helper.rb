module JobsHelper

  # 职位状态
  def render_job_status(job)
    if job.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-globe")
    end
  end

  # 薪水区间 #
  def render_job_wage(job)
    "#{job.wage_lower_bound} k ~ #{job.wage_upper_bound} k"
  end

  # 职位收到简历数量
  def render_resumes_count(job)
    count = job.resumes.count
    if count > 0
      content_tag(:span, count, :class => "fa fa-envelope-o")
    else
      content_tag(:span, count, :class => "fa fa-envelope-open-o")
    end
  end

  # 职位被收藏数量
  def render_collectors_count(job)
    count = job.job_collectors.count
    if count > 0
      content_tag(:span, count, :class => "fa fa-heart")
    else
      content_tag(:span, count, :class => "fa fa-heart-o")
    end
  end


end
