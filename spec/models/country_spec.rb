require 'rails_helper'

RSpec.describe Country, type: :model do
  context 'Create' do

    it 'country without name should raise record invalid' do
      @country = Country.new()
      expect(@country.valid?).to be(false)
    end
    
    it 'country should be created successfully' do
      expect{
        Country.create(name: 'Canada')
      }.to change(Country, :count).by(+1)
    end

    it 'country without name should not be created' do
      expect{
        Country.create()
      }.to change(Country, :count).by(0)
    end

  end
  context 'Edit' do
    
    before(:each) do
      @country = create(:country)
      @new_name = 'United States'
    end

    it 'should change the name to United States' do
      @country.update(name: @new_name)
      @country.reload
      expect(@country.name).to eq(@new_name)
    end
    
    it 'should not change name to nil' do
      @country.update(name: nil)
      @country.reload
      expect(@country.name).not_to eq(nil)
    end

    it 'should raise error trying to update name to nil' do
      expect{
        @country.update!(name: nil)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end
  context 'Destroy' do
    
    before(:each) do
      @country = create(:country)
      @product = create(:product, country: @country)
    end

    it 'should be able to destroy country' do
      expect{
        @country.destroy
      }.to change(Country,:count).by(-1)
    end

    it 'on delete should remove related products' do
      expect{
        @country.destroy
      }.to change(Product, :count).by(-1)
    end

  end
end
