class Stock < Entity
    has_one :wallet, as: :owner
    validates :symbol, presence: true
end