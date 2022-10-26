require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    describe "name, price, quantity, category" do
      it "should have a name, price, quantity, category" do
        category = Category.create(name: 'trees')
        product = Product.create(name: 'apple tree', price_cents: 3000, quantity: 5, category_id: 3)
        expect(product.attributes).to include "name"
        expect(product.attributes).to include "price_cents"
        expect(product.attributes).to include "quantity"
        expect(product.attributes).to include "category_id"
      end
    end

    describe "name" do
      it "should have a name" do
        product = Product.create(name: 'tomato plant')
        expect(product.attributes).to include "name"
        expect(product.name).to eq 'tomato plant'
      end
    end

    describe "price_cents" do
      it "should have a price" do
        product = Product.create(price_cents: 3000)
        expect(product.attributes).to include "price_cents"
        expect(product.price_cents).to eq 3000
      end
    end

    describe "quantity" do
      it "should have a quantity" do
        product = Product.create(quantity: 5)
        expect(product.attributes).to include "quantity"
        expect(product.quantity).to eq 5
      end
    end

    describe "category_id" do
      it "should have a category_id" do
        product = Product.create(category_id: 3)
        expect(product.attributes).to include "category_id"
        expect(product.category_id).to eq 3
      end
    end

  end
end
