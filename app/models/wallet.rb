# app/models/wallet.rb
class Wallet < ApplicationRecord
    belongs_to :owner, polymorphic: true
    has_many :transactions, foreign_key: 'source_wallet_id', dependent: :destroy
    has_many :transactions, foreign_key: 'target_wallet_id', dependent: :destroy

    def perform_transaction(amount, transaction_type, target_wallet)
        ActiveRecord::Base.transaction do
            transactions.create!(amount: amount, transaction_type: transaction_type, target_wallet: target_wallet)
            # update!(balance: calculate_balance)
        end
    rescue ActiveRecord::RecordInvalid => e
        # Handle validation errors if needed
        raise e
    end
end
  