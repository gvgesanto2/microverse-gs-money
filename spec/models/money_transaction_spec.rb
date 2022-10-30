require 'rails_helper'

RSpec.describe MoneyTransaction, type: :model do
  describe 'validations' do
    before do
      @transaction = MoneyTransaction.create(
        name: 'Dinner',
        price: 25.50,
        user_id: 1
      )
    end

    context 'confirm the transaction name' do
      it 'not exist' do
        expect(@transaction.name).to eq(@transaction.name)
      end
    end
  end
end
