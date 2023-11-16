class Transaction < ApplicationRecord
    belongs_to :source_wallet, class_name: 'Wallet', optional: true
    belongs_to :target_wallet, class_name: 'Wallet', optional: true
  
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validate :valid_wallet_combination

    private

    def valid_wallet_combination
        if type == 'Debit' && source_wallet.nil?
            errors.add(:source_wallet, 'must be present for debit transactions')
        elsif type == 'Credit' && target_wallet.nil?
            errors.add(:target_wallet, 'must be present for credit transactions')
        end
    end
end
