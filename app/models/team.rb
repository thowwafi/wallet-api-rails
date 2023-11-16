class Team < Entity
    # Team-specific attributes and methods
    has_one :wallet, as: :owner
    validates :team_name, presence: true
end