# frozen_string_literal: true

class ProjectsController < ApplicationController
  include PaginationHelper

  def index
    collection = Project.includes(:user).order(params[:sort_by] => params[:sort_order])
    paginated = collection.page(params[:page]).per(params[:per_page])
    # @pages = paginated.total_pages
    @projects = paginated.decorate
  end
end
