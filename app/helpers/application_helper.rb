module ApplicationHelper
  def full_title(page_title = "")
    base_title = "PAYROLL"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def flash_message_type(type)
    if type == "notice"
      "success"
    elsif type == "alert"
      "danger"
    else
      type
    end
  end
end
