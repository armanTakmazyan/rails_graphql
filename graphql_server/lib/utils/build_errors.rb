module Utils
    class BuildErrors
        def self.build_model_validation_err(entity) 
            # entity.errors.map do |attr, message|
            #     message = entity[attr] + ' ' + message
            #     context.add_error(GraphQL::ExecutionError.new(message, extensions: { code: 'USER_INPUT_ERROR', attribute: attr }))
            # end   
            error_messages = entity.errors.full_messages.join("\n")
            GraphQL::ExecutionError.new error_messages, extensions: { code: 'USER_INPUT_ERROR' }
        end
        
        def self.auth_required(context)
            raise GraphQL::ExecutionError.new('permission denied', extensions: { code: 'AUTHENTICATION_ERROR' }) unless context[:current_user]
        end
    end
end