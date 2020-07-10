module Mutations
  class SignIn < BaseMutation
    field :user, Types::UserType, null: true 
    field :accessToken, String, null: true

    argument :email, String, required: true 
    argument :password, String, required: true 

    def resolve(clientMutationId: nil, **args)

      resc_obj = Rescuable.new ->(object, args, context) {
        user = User.find_by!(email: args[:email])
        if user.authenticate(args[:password])
          {
            user: user, 
            accessToken: Utils::AuthToken.generate_access_token(user)
          }
        else
          GraphQL::ExecutionError.new "Couldn't find User", extensions: { code: 'USER_INPUT_ERROR' }
        end   
      }

      resc_obj.call(object, args, context)

    end
  end
end
