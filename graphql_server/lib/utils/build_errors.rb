module Utils
    class BuildErrors
        def self.build(entity, context) 
            entity.errors.map do |attr, message|
                message = entity[attr] + ' ' + message
                context.add_error(GraphQL::ExecutionError.new(message, extensions: { code: 'USER_INPUT_ERROR', attribute: attr }))
            end
        end
        
        def self.auth_required(context)
            raise GraphQL::ExecutionError.new('permission denied', extensions: { code: 'AUTHENTICATION_ERROR' }) unless context[:current_user]
        end
    end
end