# frozen_string_literal: true

class UsersController < ApplicationController
  include PaginationHelper

  def index
    collection = User.includes(:projects).order(params[:sort_by] => params[:sort_order])
    paginated = collection.page(params[:page]).per(params[:per_page])
    @pages = paginated.total_pages
    @users = paginated.decorate
  end
end
