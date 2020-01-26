require 'rails_helper'

RSpec.describe ProductTag, type: :model do
  context 'Create' do
    
    before(:each) do
      @product = create(:product)
      @tag = create(:tag)
    end

    it 'product tag without tag should not be valid' do
      @product_tag = ProductTag.new(product: @product)
      expect(@product_tag.valid?).to be(false)
    end
    
    it 'product tag should be created successfully' do
      expect{
        @product.tags.create(name: 'tag name')
      }.to change(ProductTag, :count).by(+1)
    end
    
    it 'should not create product tag with a product' do
      expect{
        ProductTag.create(tag: @tag)
      }.to change(ProductTag, :count).by(0)
    end

    it 'product tag without tag and product should not be created' do
      expect{
        ProductTag.create()
      }.to change(ProductTag, :count).by(0)
    end

  end
  context 'Destroy' do
    
    before(:each) do
      @product = create(:product)
      @tag = create(:tag)
      @product_tag = create(:product_tag, tag: @tag, product: @product)
    end

    it 'should be able to destroy product tag' do
      expect{
        @product_tag.destroy
      }.to change(ProductTag,:count).by(-1)
    end

  end

end
