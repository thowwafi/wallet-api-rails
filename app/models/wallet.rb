# app/models/wallet.rb
class Wallet < ApplicationRecord
    belongs_to :owner, polymorphic: true
    has_many :transactions, dependent: :destroy
end
  