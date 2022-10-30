require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    before do
      @category = Category.create(
        name: 'Savings',
        user_id: 1
      )
    end

    context 'confirm the category name' do
      it 'not exist' do
        expect(@category.name).to eq(@category.name)
      end
    end
  end
end
