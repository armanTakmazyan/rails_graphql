module Mutations
  class SignIn < BaseMutation
    field :user, Types::UserType, null: true 
    field :accessToken, String, null: true
    field :errors, [String], null: true

    argument :email, String, required: true 
    argument :password, String, required: true 

    def resolve(email:, password:, clientMutationId: nil)
      user = User.find_by(email: email)
      p "user: #{user}"
      if user.nil?
        {
          errors: ['Credentials is not valid']
        }
      elsif user.authenticate(password) == false 
        {
          errors: ['Credentials is not valid']
        }
      else
        {
          user: user, 
          accessToken: Utils::AuthToken.generate_access_token(user)
        }  
      end

    end
  end
end
