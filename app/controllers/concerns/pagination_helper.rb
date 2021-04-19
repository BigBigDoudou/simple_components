# frozen_string_literal: true

module PaginationHelper
  extend ActiveSupport::Concern

  included do
    before_action :set_pagination_params, only: :index
  end

  def set_pagination_params
    params[:sort_by] ||= :last_name
    params[:sort_order] ||= :asc
    params[:page] ||= 1
    params[:per_page] ||= 8
  end
end
