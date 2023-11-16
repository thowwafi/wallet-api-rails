class Team < Entity
    # Team-specific attributes and methods
    validates :team_name, presence: true
end