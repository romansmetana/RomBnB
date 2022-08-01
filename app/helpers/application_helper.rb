# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def show_svg(path)
    File.open("app/assets/images/#{path}", 'rb') do |file|
      raw file.read
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = if params[:direction] == 'ASC'
                  'DESC'
                else
                  'ASC'
                end
    link_to title, sort: column, direction: direction
  end
end
