class Transaction < ApplicationRecord
    belongs_to :source_wallet, class_name: 'Wallet', optional: true
    belongs_to :target_wallet, class_name: 'Wallet', optional: true
  
    validates_presence_of :amount
    validate :valid_transaction_type
    validate :valid_wallets

    private

    def valid_transaction_type
        unless transaction_type.in?(['credit', 'debit'])
            errors.add(:transaction_type, 'must be either credit or debit')
        end
    end

    def valid_wallets
        if transaction_type == 'credit' && !source_wallet.nil?
            errors.add(:source_wallet, 'must be nil for credit transactions')
        elsif transaction_type == 'debit' && !target_wallet.nil?
            errors.add(:target_wallet, 'must be nil for debit transactions')
        end
    end
end
