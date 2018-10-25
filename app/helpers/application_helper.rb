module ApplicationHelper
  def capitalize(data)
    data.capitalize if data.present?
  end
end
