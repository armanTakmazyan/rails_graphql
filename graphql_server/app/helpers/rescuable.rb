class Rescuable
    attr_reader :resolve_func
  
    def initialize(resolve_func)
        @resolve_func = resolve_func
    end
  
    def call(obj, args, ctx)
        resolve_func.call(obj, args, ctx)
    rescue ActiveRecord::RecordNotFound => e
        GraphQL::ExecutionError.new e.message, extensions: { code: 'USER_INPUT_ERROR' }
    rescue ActiveRecord::RecordInvalid => e
        error_messages = e.record.errors.full_messages.join("\n")
        GraphQL::ExecutionError.new "Validation failed: #{error_messages}.", extensions: { code: 'USER_INPUT_ERROR' }
    rescue StandardError => e
        GraphQL::ExecutionError.new e.message, extensions: { code: "INTERNAL_SERVER_ERROR" }
    end
end