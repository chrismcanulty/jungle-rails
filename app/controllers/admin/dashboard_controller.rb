class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  def show
    @products = Product.order(id: :desc).all
    @category = Category.order(id: :desc).all
  end
end
