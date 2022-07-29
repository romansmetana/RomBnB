# frozen_string_literal: true

module ApplicationHelper
  def show_svg(path)
    File.open("app/assets/images/#{path}", 'rb') do |file|
      raw file.read
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    if params[:direction] == "ASC"
      direction = "DESC"
    else
      direction = "ASC"
    end
    link_to title, sort: column, direction: direction
  end
  
end
