class Admin::CategoriesController < ApplicationController
  before_action :authenticate, except: [:index]

  def index
    @categories = Category.order(id: :desc).all
    # @products = @category.products.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    
      if @category.save
        redirect_to [:admin, :categories], notice: 'Category created!'
      else 
        render :new
      end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
  
    #authenticate method
  def authenticate
    authenticate_or_request_with_http_basic("Administration") do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end

end
