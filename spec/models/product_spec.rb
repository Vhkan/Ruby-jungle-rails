require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.create(name: "my_category")
  end

  describe 'Validations' do
     #validates :name, presence: true
    it "is not valid without the name" do
      product = Product.new(name: nil, description: "The Giant Tea is an uncommon", price: 64, quantity: 0, category: @category)
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    #validates :price, presence: true
    it "is not valid without the price" do
      product = Product.new(name: "Scented Blade", description: "The Scented Blade is an extremely rare", quantity: 18, category: @category)
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    #validates :quantity, presence: true
    it "is not valid without the quantity" do
      @product = Product.new(name: "Lion Grapevine", description: "The Lion Grapevine is an uncommon", price: 34, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    #validates :category, presence: true
    it "is not valid without the category" do
      @product = Product.new(name: "Bone Coneflower", description: "The Bone Coneflower is an uncommon", price: 24)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
  