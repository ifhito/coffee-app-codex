module Users
  class User
    attr_accessor :username, :email, :encrypted_password, :profile

    def initialize(username:, email:, encrypted_password:, profile: nil)
      @username = username
      @email = email
      @encrypted_password = encrypted_password
      @profile = profile
    end
  end
end
