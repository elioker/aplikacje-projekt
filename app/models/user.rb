class User < ApplicationRecord
    has_secure_token
    has_secure_password
    def invalidate_token
        self.update_columns(token: nil)
    end
end
