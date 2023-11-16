class Stock < Entity
    # Stock-specific attributes and methods
    validates :symbol, presence: true
end