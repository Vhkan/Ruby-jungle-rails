class Admin::DashboardController < ApplicationController

  before_action :authenticate

  def show
    @product_total = Product.count
    @category_total = Category.count
  end

  private

  #authenticate method
  def authenticate
    authenticate_or_request_with_http_basic("Administration") do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end
end
