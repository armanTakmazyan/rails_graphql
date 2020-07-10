module Mutations
  class DeleteEmployee < BaseMutation
    field :result, String, null: true

    argument :employee_id, ID, required: true

    def resolve(clientMutationId: nil, **args)
      #Utils::BuildErrors.auth_required(context)
      resc_obj = Rescuable.new ->(object, args, context) {
        employee = Employee.find(args[:employee_id])

        if employee.destroy
          {
            result: "Employee #{employee.first_name} deleted!"
          } 
        else
          Utils::BuildErrors.build_model_validation_err employee
        end
      }

      resc_obj.call(object, args, context)
      
    end
  end
end
