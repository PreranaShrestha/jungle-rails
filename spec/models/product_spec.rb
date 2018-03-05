require 'rails_helper'

RSpec.describe Product, type: :model do
  before :example do
    @category =Category.create(name: "Womens")
    @product = @category.products.create(name: 'Shoe', price_cents: 23, quantity: 2)
  end
  describe 'Validations' do
    it 'Should return true if name is  presence' do
      expect(@product).to be_valid
    end
    it 'Should return false if name is not presence' do
      @product.name = nil
      expect(@product).to_not be_valid
    end
    it 'Should return true if price is  presence' do
      expect(@product).to be_valid
    end
    it 'Should return false if price is not presence' do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end
    it 'Should return true if quantity is  presence' do
      expect(@product).to be_valid
    end
    it 'Should return false if quantity is not presence' do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end
    it 'Should return true if category is  presence' do
      expect(@product).to be_valid
    end
    it 'Should return false if category is not presence' do
      @product.category = nil
      expect(@product).to_not be_valid
    end
  end
end
