module ApplicationHelper
  
  # ページごとにタイトルを返す
  def full_titled(page_name ="")
    base_title = "AttendanceB"
    if page_name.empty?
      base_title
    else
      page_name + "|" + base_title
    end
  end
end
