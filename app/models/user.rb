class User < Entity
    
    has_one :wallet, as: :owner
    validates :email, presence: true
    validates :password, presence: true
    
    def generate_token
        payload = { user_id: id, exp: 1.hour.from_now.to_i }
        Base64.urlsafe_encode64(JSON.generate(payload))
    end

    def self.find_by_token(token)
        return unless token

        decoded_token = JSON.parse(Base64.urlsafe_decode64(token))
        find_by(id: decoded_token['user_id'])
    rescue JSON::ParserError, ArgumentError
        nil
    end

    def as_json(options = {})
        super(options.merge(methods: :type))
    end
end