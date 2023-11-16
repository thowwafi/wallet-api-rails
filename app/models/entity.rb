class Entity < ApplicationRecord
    after_create :create_wallet
    has_many :transactions, as: :owner

    def as_json(options = {})
        super(options.merge(methods: :type))
    end

    private

    def create_wallet
        Wallet.create(owner: self)
    end
end