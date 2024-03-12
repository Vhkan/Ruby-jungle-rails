class Admin::DashboardController < ApplicationController
  def show
    @product_total = Product.count
    @category_total = Category.count
  end
end
