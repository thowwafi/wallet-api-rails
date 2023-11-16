class Entity < ApplicationRecord
    has_one :wallet, as: :owner
    has_many :transactions, as: :owner
end