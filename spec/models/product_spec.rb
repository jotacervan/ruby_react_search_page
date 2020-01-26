require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Create' do

    before(:each) do 
      @country = create(:country)
    end

    it 'product without name, price and country should not be valid' do
      @product = Product.new()
      expect(@product.valid?).to be(false)
    end
    
    it 'product should not be created without country' do
      expect{
        Product.create(name: 'Canada', price: 20)
      }.to change(Product, :count).by(0)
    end

    it 'product should be created successfully' do
      expect{
        Product.create(name: 'Canada', price: 20, country: @country)
      }.to change(Product, :count).by(1)
    end

    it 'product without name, price and country should not be created' do
      expect{
        Product.create()
      }.to change(Product, :count).by(0)
    end

  end
  context 'Edit' do
    
    before(:each) do
      @country = create(:country)
      @product = create(:product, country: @country)
      @new_name = 'Product new name'
    end

    it 'should change the name to Produc new name' do
      @product.update(name: @new_name)
      @product.reload
      expect(@product.name).to eq(@new_name)
    end
    
    it 'should not change name to nil' do
      @product.update(name: nil)
      @product.reload
      expect(@product.name).not_to eq(nil)
    end

    it 'should not change price to nil' do
      @product.update(price: nil)
      @product.reload
      expect(@product.price).not_to eq(nil)
    end
    
    it 'should not change country to nil' do
      @product.update(country: nil)
      @product.reload
      expect(@product.country_id).not_to eq(nil)
    end

    it 'should raise error trying to update name to nil' do
      expect{
        @product.update!(name: nil)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should raise error trying to update price to nil' do
      expect{
        @product.update!(price: nil)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should raise error trying to update country to nil' do
      expect{
        @product.update!(country: nil)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end
  context 'Destroy' do
    
    before(:each) do
      @country = create(:country)
      @product = create(:product, country: @country)
    end

    it 'should be able to destroy product' do
      expect{
        @product.destroy
      }.to change(Product,:count).by(-1)
    end

    it 'after destroy product count on country should be 0' do
      @product.destroy
      @country.reload
      expect(@country.products.count).to be(0)
    end

  end

end
