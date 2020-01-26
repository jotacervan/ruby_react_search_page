require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'Create' do

    it 'tag without name should not be valid' do
      @tag = Tag.new()
      expect(@tag.valid?).to be(false)
    end
    
    it 'tag should be created successfully' do
      expect{
        Tag.create(name: 'tag name')
      }.to change(Tag, :count).by(+1)
    end
    
    it 'should not create tag with the same name' do
      expect{
        Tag.create(name: 'funny')
        Tag.create(name: 'funny')
      }.to change(Tag, :count).by(1)
    end

    it 'tag without name should not be created' do
      expect{
        Tag.create()
      }.to change(Tag, :count).by(0)
    end

  end
  context 'Edit' do
    
    before(:each) do
      @tag = create(:tag)
      @new_name = 'new tag'
    end

    it 'should change the name to new tag' do
      @tag.update(name: @new_name)
      @tag.reload
      expect(@tag.name).to eq(@new_name)
    end
    
    it 'should not change name to nil' do
      @tag.update(name: nil)
      @tag.reload
      expect(@tag.name).not_to eq(nil)
    end

    it 'should raise error trying to update name to nil' do
      expect{
        @tag.update!(name: nil)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end
  context 'Destroy' do
    
    before(:each) do
      @tag = create(:tag)
    end

    it 'should be able to destroy tag' do
      expect{
        @tag.destroy
      }.to change(Tag,:count).by(-1)
    end

  end

end
